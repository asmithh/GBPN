#include <iostream>
#include <vector>
#include <map>
#include <random>
#include <algorithm>
#include <assert.h>
using namespace std;

#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
namespace py = pybind11;

struct Graph {
    vector<int> nodes;
    vector<map<int,int>> nbrs;

    Graph(int num_nodes=0) {
        for (int uid=0; uid<num_nodes; uid++)
            add_node(uid);
    }

    Graph(vector<int> input_nodes) {
        for (auto u: input_nodes)
            add_node(u);
    }

    void add_node(int u) {
        nodes.push_back(u);
        nbrs.push_back(map<int,int>());
    }

    void add_edge(int uid, int vid, int eid) {
        nbrs[uid][vid] = eid;
    }

    void add_edges_from(const vector<tuple<int,int,int>> &edges) {
        for (auto edge: edges)
            add_edge(get<0>(edge), get<1>(edge), get<2>(edge));
    }

    int number_of_nodes(void) {
        return nodes.size();
    }

    vector<int> get_nodes(void) {
        return nodes;
    }

    vector<tuple<int,int,int>> get_edges(void) {
        vector<tuple<int,int,int>> edges;
        for (unsigned uid=0; uid<nodes.size(); uid++)
            for (auto arc: nbrs[uid])
                edges.push_back(make_tuple(uid, arc.first, arc.second));
        return edges;
    }
};

void dfs(Graph& G, Graph& T, int r, int rid, int max_d, int num_samples) {
    vector<tuple<int,int,int,int>> stack;
    if (max_d > 0)
        stack.push_back(make_tuple(r, rid, 0, -1));

    while (stack.size() > 0) {
        auto item = stack.back();
        stack.pop_back();
        int u = get<0>(item);
        int uid = get<1>(item);
        int d = get<2>(item);
        int p = get<3>(item);

//      cout << u << " " << uid << " " << d << " " << p << endl;
//      cout << G.nbrs[u].size() << " ";

        vector<int> nbr;
        for (auto arc: G.nbrs[u])
            if (arc.first != p) {
                nbr.push_back(arc.first);
//              cout << arc.first << " ";
            }
//      cout << nbr.size() << endl;

        vector<int> selected_nbr;
        if ((num_samples < 0) || (nbr.size() <= num_samples))
            selected_nbr = nbr;
        else
            sample(nbr.begin(), nbr.end(), back_inserter(selected_nbr), num_samples, mt19937{random_device{}()});

        for (auto v: selected_nbr)
        {
            int vid = T.number_of_nodes();
            T.add_node(v);
            T.add_edge(uid, vid, G.nbrs[u][v]);
            T.add_edge(vid, uid, G.nbrs[v][u]);
            if (max_d > d+1)
                stack.push_back(make_tuple(v, vid, d+1, u));
//          cout << "(" << u << ", " << v << ", " << uid << ", " << vid << ")  ";
        }
//      cout << endl;
    }
}

Graph sample_subtree(Graph& G, vector<int> batch_nodes, int max_d, int num_samples) {
    unsigned batch_size = batch_nodes.size();

    vector<Graph> TList;
    for (unsigned rid=0; rid<batch_size; rid++)
    {
        Graph T = Graph();
        T.add_node(batch_nodes[rid]);
        TList.push_back(T);
    }

    #pragma omp parallel for
    for (unsigned rid=0; rid<batch_size; rid++)
    {
        dfs(G, TList[rid], batch_nodes[rid], 0, max_d, num_samples);
    }

    vector<vector<int>> l2g;
    Graph TT = Graph(batch_nodes);
    int tot_count = batch_size;
    for (unsigned rid=0; rid<batch_size; rid++)
    {
        vector<int> l2g_map;
        l2g_map.push_back(rid);
        for (unsigned uid=1; uid<TList[rid].number_of_nodes(); uid++)
        {
            l2g_map.push_back(tot_count);
            TT.add_node(TList[rid].nodes[uid]);
            tot_count += 1;
        }
        l2g.push_back(l2g_map);
    }
    for (unsigned rid=0; rid<batch_size; rid++)
        for (unsigned uid=0; uid<TList[rid].number_of_nodes(); uid++)
            for (auto arc: TList[rid].nbrs[uid])
                TT.add_edge(l2g[rid][uid], l2g[rid][arc.first], arc.second);

    return TT;    
}

PYBIND11_MODULE(cnetworkx, m) {
    py::class_<Graph>(m, "Graph")
        .def(py::init<int>())
        .def(py::init<vector<int>>())
        .def("add_node", &Graph::add_node)
        .def("add_edge", &Graph::add_edge)
        .def("add_edges_from", &Graph::add_edges_from)
        .def("number_of_nodes", &Graph::number_of_nodes)
        .def("get_nodes", &Graph::get_nodes)
        .def("get_edges", &Graph::get_edges);
    
   m.def("sample_subtree", &sample_subtree);
}
