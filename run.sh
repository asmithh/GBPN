# make device="cuda:0" run_Ising_P
# make device="cuda:0" run_Ising_M
# make device="cuda:0" run_MRF_P
# make device="cuda:0" run_MRF_M
# make device="cuda:0" run_Sex
# make device="cuda:2" run_County_Facebook
  make device="cuda:1" run_Cora
# make device="cuda:0" run_CiteSeer
# make device="cuda:0" run_PubMed
# make device="cuda:0" run_Coauthor_CS
# make device="cuda:0" run_Coauthor_Physics

# make device="cuda:0" run_Elliptic_Bitcoin
# make device="cuda:0" run_JPMC_Payment0
# make device="cuda:0" run_arXiv
# make device="cuda:0" run_Products

# python main.py --dataset OGBN_Products --model_name GBPN --dim_hidden 256 --num_layers 2 --num_hops 2 --num_samples  5 --dropout_p 0.1 --device cuda:1 --learning_rate 1.0e-3 --num_epoches 100 --num_trials  5 --initskip_BP 0.05 --lossfunc_BP 0 --learn_H                        --verbose
# python main.py --dataset OGBN_Products --model_name GBPN --dim_hidden 256 --num_layers 2 --num_hops 2 --num_samples  5 --dropout_p 0.1 --device cuda:2 --learning_rate 1.0e-3 --num_epoches 100 --num_trials  5 --initskip_BP 0.05 --lossfunc_BP 0 --learn_H --eval_C               --verbose
