clear
close all
clc

% =========================================================================
% DESCRIPTION 
% This script loads in a FRED-MD dataset, processes the dataset, and then
% estimates factors.
%
% -------------------------------------------------------------------------
% BREAKDOWN OF THE SCRIPT
% 
% Part 1: Load and label FRED-MD data.
%
% Part 2: Process data -- transform each series to be stationary and remove
%         outliers.
%
% Part 3: Estimate factors and compute R-squared and marginal R-squared. 
%
% -------------------------------------------------------------------------
% AUXILIARY FUNCTIONS
% List of auxiliary functions to be saved in same folder as this script.
%
%   prepare_missing() - transforms series based on given transformation
%       numbers
%
%   remove_outliers() - removes outliers
%
%   factors_em() - estimates factors
%
%   mrsq() - computes R-squared and marginal R-squared from factor 
%       estimates and factor loadings
%
% -------------------------------------------------------------------------
% NOTES
% Authors: Michael W. McCracken and Serena Ng
% Date: 9/5/2017
% Version: MATLAB 2014a
% Required Toolboxes: None
%
% -------------------------------------------------------------------------
% PARAMETERS TO BE CHANGED

% File name of desired FRED-MD vintage
csv_in='2024-07.csv';

% Type of transformation performed on each series before factors are
% estimated
%   0 --> no transformation
%   1 --> demean only
%   2 --> demean and standardize
%   3 --> recursively demean and then standardize
DEMEAN=2;

% Information criterion used to select number of factors; for more details,
% see auxiliary function factors_em()
%   1 --> information criterion PC_p1
%   2 --> information criterion PC_p2
%   3 --> information criterion PC_p3
jj=2;

% Maximum number of factors to be estimated; if set to 99, the number of
% factors selected is forced to equal 8
kmax=15;

% =========================================================================
% PART 1: LOAD AND LABEL DATA

% Load data from CSV file
dum=importdata(csv_in,',');

% Variable names
series=dum.textdata(1,2:end);

% Transformation numbers
tcode=dum.data(1,:);

% Raw data
rawdata=dum.data(2:end,:);

% Month/year of final observation
final_datevec=datevec(dum.textdata(end,1));
final_month=final_datevec(2);
final_year=final_datevec(1);

% Dates (monthly) are of the form YEAR+MONTH/12
% e.g. March 1970 is represented as 1970+3/12
% Dates go from 1959:01 to final_year:final_month (see above)
dates = (1960+1/12:1/12:final_year+final_month/12)';

% T = number of months in sample
T=size(dates,1);
rawdata=rawdata(1:T,:);

% =========================================================================
% PART 2: PROCESS DATA

% Transform raw data to be stationary using auxiliary function
% prepare_missing()
yt=prepare_missing(rawdata,tcode);

% Reduce sample to usable dates: remove first two months because some
% series have been first differenced
yt=yt(3:T,:);
dates=dates(3:T,:);


% NaN handling
threshold = 10; % Define your threshold (e.g., max number of NaNs allowed in a column)

nanCount = sum(isnan(yt));  % Count NaNs in each column
columnsToRemove = find(nanCount > threshold); %identify them
yt(:, nanCount > threshold) = [];  % Remove columns with more NaNs than the threshold
series(:,columnsToRemove)=[];

% Remove outliers using auxiliary function remove_outliers(); see function
% or readme.txt for definition of outliers
%   data = matrix of transformed series with outliers removed
%   n = number of outliers removed from each series
[data,n]=remove_outliers(yt);

%second round: take out series with more than 7 outliers
threshold2= 7;
nanCount2 = sum(isnan(data));  % Count NaNs in each column
columnsToRemove2 = find(nanCount2 > threshold2); %identify them
data(:, nanCount2 > threshold2) = [];  % Remove columns with more NaNs than the threshold
series(:,columnsToRemove2)=[];

%replace remaining outliers (NaN) with the median
for i = 1:size(data, 2)
    col = data(:, i);
    medianValue = median(col(~isnan(col)));
    col(isnan(col)) = medianValue;
    data(:, i) = col;
end

%final check of no NaN

%nanColumns = find(any(isnan(data)));
%data = yt;
nanColumns = find(any(isnan(data)));
%data(:, any(isnan(data))) = [];
%series(:, nanColumns) = [];

%standardize
data=zscore(data); 


[N,~]=size(data);
%steps ahead
h=1; 

% Parameterizations for the S(lam10,lam20) statistic

lam10 = 1;
lam20_seq = 0.65; %[0.5:0.05:0.95]'; %from 0.5 to 0.95 by 0.05 so 10 values
%[ns,~]=size(lam20_seq);

% Parameterizations for the Sbar(tau0;lam20) statistic 

tauvec = 0.80;
%[nt,~]=size(tauvec);
lam20_seq_bar = 0.6; %[0.5:0.05:1]'; %from 0.5 till 1 by 0.05 so 11 values
%[nsb,~]=size(lam20_seq_bar);

%mu 
mu_vec = 0.40;

% Series to forecast, input the one we are interested in
idx = find(strcmp('UNRATE', series));

series_to_forecast = data(:,idx);
data_minus_idx=data;
data_minus_idx(:,idx)=[];

zzehat1=recursive_hstep_fast(series_to_forecast,[series_to_forecast],0.25,h);
zzehat2=fact_recursive_hstep_fast(series_to_forecast,[series_to_forecast],data_minus_idx,'determine',0.25,h);

%Encompassing
stat_g1 = pred_encompass_dnorm(zzehat1,zzehat2,mu_vec);
pval_g1 = normcdf(stat_g1,0,1,'upper');

%Forecast Accuracy
[S0_g2(1), S0_nw_g2(1), S0_adj_g2(1), S0_adj_nw_g2(1), pv_S0_g2(1), pv_S0_nw_g2(1), pv_S0_adj_g2(1), pv_S0_adj_nw_g2(1)] = Nested_Stats_S0(zzehat1,zzehat2,lam10,lam20_seq);
stat_g2 = S0_adj_g2;
pval_g2 = normcdf(stat_g2,0,1,'upper');

[S0_g3(1), S0_nw_g3(1), S0_adj_g3(1), S0_adj_nw_g3(1), pv_S0_g3(1), pv_S0_nw_g3(1), pv_S0_adj_g3(1), pv_S0_adj_nw_g3(1)] = Nested_Stats_Sbar(zzehat1,zzehat2,lam20_seq_bar,tauvec);
stat_g3 = S0_adj_g3;
pval_g3 = normcdf(stat_g3,0,1,'upper');

[S0_g4(1), S0_nw_g4(1), S0_adj_g4(1), S0_adj_nw_g4(1), pv_S0_g4(1), pv_S0_nw_g4(1), pv_S0_adj_g4(1), pv_S0_adj_nw_g4(1)] = Nested_Stats_Sbar_g4(zzehat1,zzehat2,lam20_seq_bar,tauvec);
stat_g4 = S0_adj_g4;
pval_g4 = normcdf(abs(stat_g4),0,1,'upper');


% Display results for each test

% Encompassing test
fprintf('Encompassing Test:\n');
fprintf('Statistic (g1): %.4f\n', stat_g1);
fprintf('P-value: %.4f\n\n', pval_g1);

% Forecast Accuracy - Test 1 (S(lam10, lam20))
fprintf('Forecast Accuracy Test g2 (S(lam10, lam20)):\n');
fprintf('Statistic (g2): %.4f\n', stat_g2);
fprintf('P-value: %.4f\n\n', pval_g2);

% Forecast Accuracy - Test 2 (Sbar(lam20, tau0))
fprintf('Forecast Accuracy Test g3 (Sbar(lam20, tau0)):\n');
fprintf('Statistic (g3): %.4f\n', stat_g3);
fprintf('P-value: %.4f\n\n', pval_g3);

% Forecast Accuracy - Test 3 (Sbar_g4(lam20, tau0))
fprintf('Forecast Accuracy Test g4 (Sbar_g4(lam20, tau0)):\n');
fprintf('Statistic (g4): %.4f\n', stat_g4);
%fprintf('P-value: %.4f\n\n', pval_g4);
fprintf('P-value: %.4f\n\n', pv_S0_g4);

%pv_S0_g4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
