# New-Tests-of-Equal-Forecast-Accuracy-for-Factor-Augmented-Regressions-with-Weaker-Loadings

In this README file we explain in details how to reproduce both the simulations and the empirical results in "New Tests of Equal Forecast Accuracy for Factor Augmented Regressions with Weaker Loadings", International Journal of Forecasting, 2025, by Luca Margaritella and Ovidijus Stauskas [1].

The programming language employed is predominantly MATLAB, with some R codes only to produce the graphs in the main paper. 
The main bodies of the MATLAB scripts are taken and modified directly from the original scripts of J.Y. Pitarakis (see his two repos: https://github.com/jpitarakis/Predictive-Accuracy-Comparisons-Nested and https://github.com/jpitarakis/Multi-Step_Encompassing) who was the original mind behind the tests of forecasting accuracy and encompassing (see also [2], [3]).


Throughout, we refer to our main paper in [1] as MP and to its online appendix as OA.
In both the MP and OA we refer to the four proposed tests as: $g_{\widehat{f},1}$ for the encompassing test and $g_{\widehat{f},2}, g_{\widehat{f},3}, g_{\widehat{f},4}$ for the forecast accuracy ones
with the relative power-enhancement versions: $g_{\widehat{f},2}^{adj}, g_{\widehat{f},3}^{adj}, g_{\widehat{f},4}^{adj}$. Below, the name of the simulations scripts reflect this nomenclature with G1, G2, G3, G4.
____________________________________________________________________________________________________________________________________________________________________________________________________________________
We start with a list of the scripts and data files found in this repository.

# MATLAB Scripts
---------------------------------------
# Main Scripts Simulations G1
- SIMULATIONS_G1.M
- SIMULATIONS_G1_CSdependentIdio_Garcherrors.M

# Auxiliary Functions G1
---------------------------------------
# Main Scripts Simulations G2, G3
- SIMULATIONS_G2_G3.M
- SIMULATIONS_G2_G3_CSdependentIdio_garcherrors.M
  
# Auxiliary Functions G2, G3
----------------------------------------
# Main Scripts Simulations G4
- SIMULATIONS_G4.M
- SIMULATIONS_G4_CSdependentidio_garcherrors.M
  
# Auxiliary Functions G4
----------------------------------------
# Main Scripts Empirical Application I

# Main Scripts Empirical Application II

# Auxiliary Functions 
-----------------------------------------
# R Scripts
- Plot_Rscript_G1.R
- Plot_Rscript_G2.R
- Plot_Rscript_G3.R
- Plot_Rscript_G4.R
-----------------------------------------
# Data Files


____________________________________________________________________________________________________________________________________________________________________________________________________________________
# MONTE CARLO SIMULATIONS


# EMPIRICAL APPLICATION I: Inflation Forecasting


# EMPIRICAL APPLICATION II: FRED-MD Forecasting






_____________________________________________________________________________________________________________________________________________________________________________________________________________________
REFERENCES
[1] Margaritella, L., Stauskas, O., New Tests of Equal Forecast Accuracy for Factor-Augmented Regressions with Weaker Loadings. International Journal of Forecasting, 2025

[2] Pitarakis, J.-Y. (2023). Direct multi-step forecast based comparison of nested models via an encompassing test. arXiv preprint arXiv:2312.16099.

[3] Pitarakis, J.-Y. (2025). A novel approach to predictive accuracy testing in nested environments. Econometric Theory, 41(1), 35–78.
