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
- (andrews_lrv.M)
- (armaxfilter_simulate.M)
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

For example: take Figure 1, which is for the encompassing test G1 with $mu_0=0.4$, then the 3 plotted curves of color blue, green and orange, correspond to column 4 (the one for $mu_0=0.4$) of Table 5.1, 5.2, 5.3 in the OA. 

Likewise, for Figure 2 and Figure 3 for the forecast accuracy test G2 and G3, the curves correspond to the values in column 5 (the one for $\lmbda_2^0=0.65$) -for the lower part (the one for the power-enhanced tests $g_{\widehat{f},2}^{adj}$, $g_{\widehat{f},3}^{adj}$)- of OA Table 5.5, 5.6, 5.7 and Table 5.9, 5.10, 5.11, respectively.

Similarly goes for Figure 4, for the forecast accuracy test G4: the curves correspond to the values in column 2,3,4 -for the lower part (the one for the power-enhanced tests $g_{\widehat{f},4}^{adj}$)- of OA Table 5.13. (Note how for G4 the tables are shorter as there is no $\lambda_2^0$).

The exact same process is to obtain Figure 5-8 for the case of cross-sectional dependent idiosyncratics (I), and Figure 9-12 for the case of cross-sectional dependent idiosyncratics plus GARCH(1, 1) forecast errors (II). 
The values to impute to the relevant lines of the provided R scripts should now be taken from the corresponding columns in Table 5.41 for G1, Table 5.42 for G2, Table 5.43 for G3 and Table 5.44 for G4, for (I). Likewise, from the corresponding columns in Table 5.45 for G1, Table 5.46 for G2, Table 5.47 for G3 and Table 5.48 for G4, for (II).

Note again that the R scripts provided have pre-imputed values to reproduce Figure 1-4. To reproduce Figure 5-12 for the cases of cross-sectional dependent idiosyncratics and cross-sectional dependent idiosyncratics plus GARCH(1, 1) forecast errors, the values should be imputed as explained above.

We now proceed to explain how to precisely obtain all the tables reported in the OA, Section 5.2 ("Size and Power Tables"), Section 5.3 ("Sensitivity to Smaller Sample Sizes") and Section 5.4 (Cross-sectional dependent idiosyncratics and Garch errors for heterogeneous loadings)
























# EMPIRICAL APPLICATION I: Inflation Forecasting


# EMPIRICAL APPLICATION II: FRED-MD Forecasting






_____________________________________________________________________________________________________________________________________________________________________________________________________________________
REFERENCES

[1] Margaritella, L., Stauskas, O., New Tests of Equal Forecast Accuracy for Factor-Augmented Regressions with Weaker Loadings. International Journal of Forecasting, 2025

[2] Pitarakis, J.-Y. (2023). Direct multi-step forecast based comparison of nested models via an encompassing test. arXiv preprint arXiv:2312.16099.

[3] Pitarakis, J.-Y. (2025). A novel approach to predictive accuracy testing in nested environments. Econometric Theory, 41(1), 35–78.
