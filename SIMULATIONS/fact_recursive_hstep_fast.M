function [ehat]=fact_recursive_hstep_fast(y,X_l,X_f,nfact,pi0,h)

% Recursive LS forecasting using an expanding window approach. 
% 
% Inputs:
%
% y: nx1 outcome series
% X_l: nxp_l predictor matrix of lags of y
% X_f: nxp_f panel data predictor matrix for which factors are extracted
% nfact: nr of factors (given or pre-determined via criteria)
% pi0: fraction of the sample to start recursions (e.g., pi0=0.5)
% h: forecast horizon
% 
% 
% Recursively LS-fitted Model (with intercept): y(t) = X(t-h) beta + u(t), t=h+1,...,n
%
% Notes: (1) first estimation window is [1,...,k0] and last window is 
% [1,....,n-h] for k0 = round(n*pi0). First forecast is yhat(k0+h|k0)
% and last forecast is yhat(n|n-h). There are a total of (n-h-k0+1)
% forecasts and corresponding forecast errors. (2) this fast version of the
% recursive least squares algorithm uses the Sherman-Morrison matrix
% formula to avoid matrix inversions at each recursion. 
%
% Outputs: 
%
% sequence of h-steps ahead forecast errors (n-h-k0+1 x 1)
%
%  ex: fact_recursive_hstep_fast(Y(h+1:n),[Y(h+1:n)],X,3,0.25,h);

[n,p_x] = size(X_l);
[n_f,p_f] = size(X_f); %note: it has to be n=n_f

% Check if nfact is a string 'determine', the number of factors can be
% imposed but must be an integer
    if ischar(nfact) && strcmp(nfact, 'determine')
        % Call Ahn Horenstein criterion to estimate nfact
        %nfact = AH_crit(X_f);
        nfact1 = NbFactors(X_f,10);
        nfact2=extractfield(nfact1,'khat');
        nfact=nfact2(1,1);%IC1
        

    %elseif ~isinteger(nfact)
     %   error('nfact must be an integer or ''determine''.');
    end


%p = p_x+1;
p = p_x+nfact+1; %nr of lags, nr of factors (over the whole X_f!), +1 (constant)

k0 = round(n*pi0); %sample split

% initial estimate using data t=1,...,k0 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estimating the factors (nr of fact given by nfact)
Xs = standard(X_f(1:k0-h,:));
XX=Xs*Xs';
[Fhat0,eigval,Fhat1]=svd((1/(p_f*(k0-h))) * XX');
Fhat = Fhat0(:,1:nfact)*sqrt(k0-h);

X = [X_l(1:k0-h,:),Fhat,ones(k0-h,1)];


%iXmat_k0 = inv(X(1:k0-h,:)'*X(1:k0-h,:));
iXmat_k0 = inv(X'*X); 
%bhat_k0 = iXmat_k0*(X(1:k0-h,:)'*y(h+1:k0));
bhat_k0 = iXmat_k0*(X'*y(h+1:k0));

M = zeros(p,p,n-k0-h+1); % initialisations for storage
bhat = zeros(p,n-h-k0+1); % initialisations for storage
ehat = zeros(n-h-k0+1,1); % initialisations for storage

bhat(:,1) = bhat_k0;
M(:,:,1) = iXmat_k0;

for t=k0:n-h
    % recursive estimation of the factors
Xs = standard(X_f(1:t,:));
XX=Xs*Xs';
[Fhat0,eigval,Fhat1]=svd((1/(p_f*(t))) * XX');
Fhat = Fhat0(:,1:nfact)*sqrt(t);
%stack them together with the lags in X
X = [X_l(1:t,:),Fhat,ones(t,1)];
% recursive least squares
   M(:,:,t-k0+2) = M(:,:,t-k0+1)-(M(:,:,t-k0+1)*X(t+1-h,:)'*X(t+1-h,:)*M(:,:,t-k0+1)/(1+X(t+1-h,:)*M(:,:,t-k0+1)*X(t+1-h,:)'));
   bhat(:,t-k0+2) = bhat(:,t-k0+1)+M(:,:,t-k0+2)*X(t+1-h,:)'*(y(t+1)-X(t+1-h,:)*bhat(:,t-k0+1));
   ehat(t-k0+1) = y(t+h)-X(t,:)*bhat(:,t-k0+1);
end







