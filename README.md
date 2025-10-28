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
- andrews_lrv.M
- armaxfilter_simulate.M
- covnw.M
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
- armaxfilter_simulate.M
- covnw.M
- varsim.M
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
# MONTE CARLO SIMULATIONS


# EMPIRICAL APPLICATION I: Inflation Forecasting


# EMPIRICAL APPLICATION II: FRED-MD Forecasting






_____________________________________________________________________________________________________________________________________________________________________________________________________________________
REFERENCES

[1] Margaritella, L., Stauskas, O., New Tests of Equal Forecast Accuracy for Factor-Augmented Regressions with Weaker Loadings. International Journal of Forecasting, 2025

[2] Pitarakis, J.-Y. (2023). Direct multi-step forecast based comparison of nested models via an encompassing test. arXiv preprint arXiv:2312.16099.

[3] Pitarakis, J.-Y. (2025). A novel approach to predictive accuracy testing in nested environments. Econometric Theory, 41(1), 35–78.
