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


# R Scripts


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
