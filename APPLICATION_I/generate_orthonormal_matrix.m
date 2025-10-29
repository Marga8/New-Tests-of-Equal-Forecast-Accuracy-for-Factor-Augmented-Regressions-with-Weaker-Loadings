function A = generate_orthonormal_matrix(m, n)
    % Generate an m x n matrix with orthonormal columns
    A = randn(m, n);
    [Q, ~] = qr(A, 0);
    A = Q(:, 1:n);
end
