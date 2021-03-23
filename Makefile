build_cnetworkx:
	c++ -O3 -Wall -shared -std=c++17 -fPIC $(shell python3 -m pybind11 --includes) cnetworkx.cpp -o cnetworkx$(shell python3-config --extension-suffix)

run_Cora:
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H          --verbose
	python main.py --dataset Cora                 --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H --eval_C --verbose

run_CiteSeer:
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H          --verbose
	python main.py --dataset CiteSeer             --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H --eval_C --verbose

run_PubMed:
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H          --verbose
	python main.py --dataset PubMed               --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H --eval_C --verbose

run_Coauthor_CS:
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H          --verbose
	python main.py --dataset Coauthor_CS          --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H --eval_C --verbose

run_Coauthor_Physics:
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H          --verbose
	python main.py --dataset Coauthor_Physics     --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials  10 --device cuda --learn_H --eval_C --verbose

run_County_Facebook:
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H          --verbose
	python main.py --dataset County_Facebook      --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H --eval_C --verbose

run_Sex:
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches 500 --num_trials 100 --device cuda                    --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H          --verbose
	python main.py --dataset Sex                  --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches 200 --num_trials 100 --device cuda --learn_H --eval_C --verbose

run_Elliptic_Bitcoin:
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda --learn_H          --verbose
	python main.py --dataset Elliptic_Bitcoin     --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda --learn_H --eval_C --verbose

run_JPMC_Fraud_Detection:
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name MLP  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name SGC  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name GCN  --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name SAGE --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name GAT  --learning_rate 2.5e-4 --num_epoches  50 --num_trials  10 --device cuda                    --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda --learn_H          --verbose
	python main.py --dataset JPMC_Fraud_Detection --split 0.6 0.2 0.2 --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials  10 --device cuda --learn_H --eval_C --verbose

run_arXiv:
	python main.py --dataset OGBN_arXiv                               --model_name MLP  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_arXiv                               --model_name SGC  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_arXiv                               --model_name GCN  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_arXiv                               --model_name SAGE --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_arXiv                               --model_name GAT  --learning_rate 2.5e-4 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_arXiv                               --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda --learn_H          --verbose
	python main.py --dataset OGBN_arXiv                               --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda --learn_H --eval_C --verbose

run_Products:
	python main.py --dataset OGBN_Products                            --model_name MLP  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_Products                            --model_name SGC  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_Products                            --model_name GCN  --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_Products                            --model_name SAGE --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_Products                            --model_name GAT  --learning_rate 2.5e-4 --num_epoches  50 --num_trials   3 --device cuda                    --verbose
	python main.py --dataset OGBN_Products                            --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda --learn_H          --verbose
	python main.py --dataset OGBN_Products                            --model_name GBPN --learning_rate 1.0e-2 --num_epoches  50 --num_trials   3 --device cuda --learn_H --eval_C --verbose
