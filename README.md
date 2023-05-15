# Neurips2023
Code for paper that explores cross-training of ANN models as a mean of supporting/disproving Effective Market Hypotesis

List of files:
 - Main program:
w_series_generic_cl.m 

To configure, find and modify the following fragments:

%% Load the data, initialize partition pareameters (model name)
%saveDataPrefix = 'nasdaq0704_';
%saveDataPrefix = 'dj0704_';
%saveDataPrefix = 'nikkei0704_';
saveDataPrefix = 'dax0704_';

%% Data name (may be different than model)
%dataFile = 'nasdaq_1_3_05-1_28_22.csv';
%dataFile = 'dj_1_3_05-1_28_22.csv';
dataFile = 'nikkei_1_4_05_1_31_22.csv';
%dataFile = 'dax_1_3_05_1_31_22.csv';

%Input data directory
dataDir = '~/data/STOCKS';

% input dimesion (days)
m_in = 30;
% Try different output dimensions (days)
n_out = 30;

% No graph relations in models *Net, graph retations in models *VNet
%regNet = SigNet(m_in, n_out, mb_size, ini_rate, max_epoch);
regNet = SigVNet(m_in, n_out, mb_size, ini_rate, max_epoch);
%regNet = TanhNet(m_in, n_out, mb_size, ini_rate, max_epoch);
%regNet = TanhVNet(m_in, n_out, mb_size, ini_rate, max_epoch);
%regNet = RbfNet(m_in, n_out, mb_size, ini_rate, max_epoch);
%regNet = RbfVNet(m_in, n_out, mb_size, ini_rate, max_epoch);
...


 - Libraries:
   * ANN models
BaseNet.m
BaseNetV.m
CNNInputNet.m
CNNInputNetV.m
LinRegInputNet.m
MLPInputNet.m
MLPInputNetV.m
RNNInputNet.m
RNNSeqInputNet.m

AnnNet.m
AnnVNet.m
CnnCascadeNet.m
CnnCascadeVNet.m
CnnNet.m
CnnVNet.m
GmdhNet.m
GmdhVNet.m
KgNet.m
KgVNet.m
LinRegNet.m
LstmNet.m
LstmVNet.m
LstmSeqNet.m
RbfNet.m
RbfVNet.m
ReluNet.m
ReluVNet.m
SigNet.m
SigVNet.m
TanhNet.m
TanhVNet.m
TransNet.m
TransVNet.m
   
   * Custom ANN layers
GaussianRBFLayer.m
gmdhLayerGrowN.m
gmdhLayerN.m
gmdhRegression.m
transformerLayer.m
vRegression.m
   
   * Training and test sets building
w_series_generic_test_seq_tensors.m
w_series_generic_test_seq_vtensors.m
w_series_generic_test_tensors.m
w_series_generic_test_vtensors.m
w_series_generic_train_seq_tensors.m
w_series_generic_train_seq_vtensors.m
w_series_generic_train_tensors.m
w_series_generic_train_vtensors.m
w_series_spots.m
w_seriesv_test_tensors.m
w_seriesv_train_tensors.m

   * Auxiliary: scaling, error, graph routines
w_series_generic_calc_mape.m
w_series_generic_calc_rmse.m
w_series_generic_calcv_mape.m
w_series_generic_calcv_rmse.m
w_series_generic_err_graph.m
w_series_generic_errv_graph.m
w_series_generic_minmax_rescale.m
w_series_generic_minmax_scale.m

 - Accuracy metrics calculation script:
ltts_vreg_err.R

 - Input data files (stock indexes
nasdaq_1_3_05-1_28_22.csv
dax_1_3_05_1_31_22.csv
dj_1_3_05-1_28_22.csv
nikkei_1_4_05_1_31_22.csv

  - Detailed output files (errors per session)
mape.1.<model>.<training index>.<test index>.*.txt
