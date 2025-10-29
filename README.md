# New-Tests-of-Equal-Forecast-Accuracy-for-Factor-Augmented-Regressions-with-Weaker-Loadings

In this README file we explain in details how to reproduce both the simulations and the empirical results in "New Tests of Equal Forecast Accuracy for Factor Augmented Regressions with Weaker Loadings", International Journal of Forecasting, 2025, by Luca Margaritella and Ovidijus Stauskas [1].

The programming language employed is predominantly MATLAB, with some R codes only to produce the graphs in the main paper. 
The main bodies of the MATLAB scripts are taken and modified directly from the original scripts of J.Y. Pitarakis (see his two repos: https://github.com/jpitarakis/Predictive-Accuracy-Comparisons-Nested and https://github.com/jpitarakis/Multi-Step_Encompassing) who was the original mind behind the tests of forecasting accuracy and encompassing (see also [2], [3]).


Throughout, we refer to our main paper in [1] as MP and to its online appendix as OA.
In both the MP and OA we refer to the four proposed tests as: $g_{\widehat{f},1}$ for the encompassing test and $g_{\widehat{f},2}, g_{\widehat{f},3}, g_{\widehat{f},4}$ for the forecast accuracy ones
with the relative power-enhancement versions: $g_{\widehat{f},2}^{adj}, g_{\widehat{f},3}^{adj}, g_{\widehat{f},4}^{adj}$. Below, the name of the simulations scripts reflect this nomenclature with G1, G2, G3, G4.
___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
We start with a list of the scripts and data files found in this repository. 
We distinguish between main scripts and auxiliary functions. Some auxiliary functions are exactly the same across the test, yet we list them for completeness.

# MATLAB Scripts
----------------------------------------------
# Main Scripts Simulations G1
- SIMULATIONS_G1.M
- SIMULATIONS_G1_CSdependentIdio_Garcherrors.M

# Auxiliary Functions G1
- fact_recursive_hstep_fast.M
- recursive_hstep_fast.M
- pred_encompass_dnorm.M
- NbFactors.M
- standard.M
- (armaxfilter_simulate.M)
- (andrews_lrv.M)
- (covnw.M)
---------------------------------------------
# Main Scripts Simulations G2, G3, G4
- SIMULATIONS_G2_G3.M
- SIMULATIONS_G2_G3_CSdependentIdio_garcherrors.M
- SIMULATIONS_G4.M
- SIMULATIONS_G4_CSdependentidio_garcherrors.M
  
# Auxiliary Functions G2, G3, G4
- fact_recursive_hstep_fast.M
- recursive_hstep_fast.M
- Nested_Stats_S0.M
- Nested_Stats_Sbar.M
- Nested_Stats_Sbar_g4.M
- NbFactors.M
- standard.M
- (armaxfilter_simulate.M)
- (covnw.M)
- (varsim.M)
---------------------------------------------
# Main Scripts Empirical Application I
- Application_HCPIQ_AR1.M
- Application_HCPIQ_AR1_GRANDAVERAGE.M

# Main Scripts Empirical Application II
- Application_FREDMD.M
  
# Auxiliary Functions 
For both Empirical Applications the auxiliary functions are basically the same auxiliary functions within the simulations above for G1,G2,G3,G4 combined. However, some tiny changes are required, e.g., in Application II to impose $\lambda_1^0=0.6$ for G4 within Nested_Stats_Sbar_g4.M. And also, for Empirical Application II a couple of additional auxiliary functions are needed to take care of the usual (stationarity) transformation of FRED-MD (zip file with these have been downloaded from https://www.stlouisfed.org/research/economists/mccracken/fred-databases) plus a couple of others for trying different method of extracting factors. Thus, we recommend downloading the whole folder for each application when replicating it.

These are:
- transform_data.M
- seqa.M
- remove_outliers.M
- prepare_missing.M
- mrsq.M
- fredfactors.M
- factors_em.M
- AH_crit.M
- ABC_crit.M
----------------------------------------------
# R Scripts
- Plot_Rscript_G1.R
- Plot_Rscript_G2.R
- Plot_Rscript_G3.R
- Plot_Rscript_G4.R
----------------------------------------------
# Data Files
- WB_HCPI_Q.xlsx
- 2024-07.xlsx

____________________________________________________________________________________________________________________________________________________________________________________________________________________
# REPRODUCIBILITY OF RESULTS:

# MONTE CARLO SIMULATIONS
_______________________________________________________________________________________________________________
To obtain the Power curve plots in Figure 1-4 of the MP, we use the R scripts Plot_Rscript_G1.R-Plot_Rscript_G4.R;
Note that the imput values are simply taken from the relevant columns of the full blown simulations reported in OA, Section 5.2. 
In fact, all the figures (Figure 1-12) are visualization summaries of the overall simulations reported in OA Section 5.2 and 5.4.

For example: take Figure 1, which is for the encompassing test G1 with $\mu_0=0.4$, then the 3 plotted curves of color blue, green and orange, correspond to column 4 (the one for $\mu_0=0.4$) of Table 5.1, 5.2, 5.3 in the OA. 

Likewise, for Figure 2 and Figure 3 for the forecast accuracy test G2 and G3, the curves correspond to the values in column 5 (the one for $\lambda_2^0=0.65$) -for the lower part (the one for the power-enhanced tests $g_{\widehat{f},2}^{adj}$, $g_{\widehat{f},3}^{adj}$)- of OA Table 5.5, 5.6, 5.7 and Table 5.9, 5.10, 5.11, respectively.

Similarly goes for Figure 4, for the forecast accuracy test G4: the curves correspond to the values in column 2,3,4 -for the lower part (the one for the power-enhanced tests $g_{\widehat{f},4}^{adj}$)- of OA Table 5.13. (Note how for G4 the tables are shorter as there is no $\lambda_2^0$).

The exact same process is to obtain Figure 5-8 for the case of cross-sectional dependent idiosyncratics (I), and Figure 9-12 for the case of cross-sectional dependent idiosyncratics plus GARCH(1, 1) forecast errors (II). 
The values to impute to the relevant lines of the provided R scripts should now be taken from the corresponding columns in Table 5.41-5.43 for G1, Table 5.45-5.47 for G2, Table 5.49-5.51 for G3 and Table 5.53-5.55 for G4, for (I). Likewise, from the corresponding columns in Table 5.57-5.59 for G1, Table 5.61-5.63 for G2, Table 5.65-5.67 for G3 and Table 5.69-5.71 for G4, for (II).

Note again that the R scripts provided have pre-imputed values to reproduce Figure 1-4 only. To reproduce Figure 5-12 for the cases of cross-sectional dependent idiosyncratics and cross-sectional dependent idiosyncratics plus GARCH(1, 1) forecast errors, the values should be imputed as explained above.

We now proceed to explain how to precisely obtain all the tables reported in the OA, Section 5.2 ("Size and Power Tables"), Section 5.3 ("Sensitivity to Smaller Sample Sizes") and Section 5.4 (Cross-sectional dependent idiosyncratics and Garch errors for homogeneous and heterogeneous loadings)

OA Section 5.2 ("Size and Power Tables"):
---------------

- Table 5.1-5.4 are obtained by running the script SIMULATIONS_G1.M and modifying the line 13 of the script to accomodate the different homogeneous and heterogeneous loadings: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The final output table -which is also printed to the console- is "mat_T10_k1".

- Table 5.5-5.12 are obtained by running the script SIMULATIONS_G2_G3.M and modifying the line 20 of the script to accomodate the different homogeneous and heterogeneous loadings: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The final output tables -which are also printed to the console- are "out_S0_S0adj1" for G2 (and the power enhanced version G2-adj) and "out_Sbar_Sbaradj" fro G3 (and the power enhanced version G3-adj). Note that in the output tables the two versions of the test (G2 and G2-adj) are printed horizontally one contiguous to the other. In the OA Tables we have placed the power-enhanced versions underneath, so they are placed in a vertical fashion for space reasons.
  
- Table 5.13-5.16 are obtained by running the script SIMULATIONS_G4.M and modifying the line 20 of the script to accomodate the different homogeneous and heterogeneous loadings: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The final output table -which is also printed to the console- is "out_Sbar_Sbaradj" for G4 (and the power enhanced version G4-adj). Note that in the output tables the two versions of the test (G4 and G4-adj) are printed horizontally, one contiguous to the other. In the OA Tables we have placed the power-enhanced versions underneath, so they are placed in a vertical fashion for space reasons.


OA Section 5.3 ("Sensitivity to Smaller Sample Sizes"):
---------------

- Table 5.17-5.22 are obtained by running the script SIMULATIONS_G1.M and modifying the values of the cross sectional dimension N and sample size T at line 8-9 as N_vec=[100]; T_vec=[200]; or T_vec=[350]; along with this, the line 13 of the script should be modified to accomodate the different homogeneous and heterogeneous loadings as explained above in Section 5.2. The output table names and displaying are also the same as explained for Section 5.2 above.

- Table 5.23-5.34 are obtained by running the script SIMULATIONS_G2_G3.M and modifying the values of the cross sectional dimension N and sample size T at line 8-9 as N_vec=[100]; T_vec=[200]; or T_vec=[350]; along with this, the line 13 of the script should be modified to accomodate the different homogeneous and heterogeneous loadings as explained above in Section 5.2. The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.

- Table 5.35-5.40 are obtained by running the script SIMULATIONS_G4.M and modifying the values of the cross sectional dimension N and sample size T at line 8-9 as N_vec=[100]; T_vec=[200]; or T_vec=[350]; along with this, the line 13 of the script should be modified to accomodate the different homogeneous and heterogeneous loadings as explained above in Section 5.2. The output table names and displaying are also the same as explained for Section 5.2 above. The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.


OA Section 5.3 ("Cross-sectional dependent idiosyncratics and Garch errors for homogeneous and heterogeneous loadings"):
---------------
Here Subsection 5.4.1 is about Cross sectional dependent idiosyncratic only, without GARCH effects on the error. 
This means that for all the scripts below there is a section to be commented out (lines 61-76 for G1 and lines 91-106 for G2,G3,G4) and one to be un-commented out (lines 81-82 for G1 and lines 111-112 for G2,G3,G4). This is clearly commented within the code! 

- Table 5.41-5.44 are obtained by running the script SIMULATIONS_G1_CSdependentIdio_Garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above.


- Table 5.45-5.52 are obtained by running the script SIMULATIONS_G2_G3_CSdependentIdio_garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.

- Table 5.53-5.56 are obtained by running the script SIMULATIONS_G4_CSdependentIdio_garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.



Here Subsection 5.4.2 is about Cross sectional dependent idiosyncratic plus GARCH effects on the error. 
This means that for all the scripts below the same sections commented out to obtain the results in Subsection 5.4.1 above should now be un-commented again, while lines 81-82 for G1 and lines 111-112 for G2,G3,G4 should be commented out. This is clearly commented within the code! 

- Table 5.57-5.60 are obtained by running the script SIMULATIONS_G1_CSdependentIdio_Garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above.

- Table 5.61-5.68 are obtained by running the script SIMULATIONS_G2_G3_CSdependentIdio_garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.

- Table 5.69-5.72 are obtained by running the script SIMULATIONS_G4_CSdependentIdio_garcherrors.M  where to accomodate the different homogeneous and heterogeneous loadings one should imput: alpha1 = [1, 1, 1]; or alpha1 = [0.51, 0.51, 0.51]; or alpha1 = [0.1, 0.1, 0.1]; or alpha1 = [0.51, 0.7, 1]; The output table names and displaying are also the same as explained for Section 5.2 above, though note that only the power-enhanced versions (adj) are reported in the OA.



NOTE: all simulations have been run locally on the authors machine, and the code only contains parloops to parallelize the tasks. The settings with N_vec=[800]; T_vec=[500]; for 500 replications are lengthy, and the main culprit for this lenghty-ness is the time dimension T_vec as the factors are estimated at every roll of the out-of-sample window (recursively). G1 seems a bit slower than G2-G4. On a processor Intel(R) Core(TM) i7-10875H CPU @ 2.30GHz  2.30 GHz with installed RAM of 32 GB, the whole simulation of G1 takes about 3.5-4 hours. Needless to say, to reproduce exactly the results the scripts -and random number generators thereof- should not be modified (e.g., the snippet ensuring reproducible random number generation in parallel loops -line 47-51 for SIMULATIONS_G1.M and similarly everywhere else- should be left as-is!).
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

# EMPIRICAL APPLICATION I: Inflation Forecasting


# EMPIRICAL APPLICATION II: FRED-MD Forecasting






_____________________________________________________________________________________________________________________________________________________________________________________________________________________
REFERENCES

[1] Margaritella, L., Stauskas, O., New Tests of Equal Forecast Accuracy for Factor-Augmented Regressions with Weaker Loadings. International Journal of Forecasting, 2025

[2] Pitarakis, J.-Y. (2023). Direct multi-step forecast based comparison of nested models via an encompassing test. arXiv preprint arXiv:2312.16099.

[3] Pitarakis, J.-Y. (2025). A novel approach to predictive accuracy testing in nested environments. Econometric Theory, 41(1), 35–78.
