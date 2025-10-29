function numFactors = ahnHorensteinCriterion(data)
    % Ahn and Horenstein Criterion for determining the number of factors
    %
    % Inputs:
    %   data - a matrix where rows are observations and columns are variables
    %
    % Outputs:
    %   numFactors - the estimated number of factors

    % Step 1: Calculate the sample covariance matrix
    covarianceMatrix = cov(data);

    % Step 2: Calculate the eigenvalues of the sample covariance matrix
    eigenvalues = sort(eig(covarianceMatrix), 'descend');

    % Step 3: Calculate the ratio of each eigenvalue to the next one
    ratios = eigenvalues(1:end-1) ./ eigenvalues(2:end);

    % Step 4: Identify the maximum ratio, which corresponds to the number of factors
    [~, numFactors] = max(ratios);
end