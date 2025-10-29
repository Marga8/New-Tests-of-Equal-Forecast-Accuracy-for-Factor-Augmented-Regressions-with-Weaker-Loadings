%R= nr of replications
%N,T, cross section and time dimension
%alpha1=[0.51, 0.7, 1] weak loading parameter, change as needed

clear;
clc;

%tic
R=500;

N_vec=[800];
T_vec=[500];

%weak loadings parameters
D2 = diag([3, 2, 1]);
alpha1 = [0.51, 0.7, 1];


[~,sk]=size(N_vec);

r = 3; % number of factors in the DGP
lags = 0;

mu_vec = [0.30;0.35;0.40;0.45]; %sample fraction
[sm,~]=size(mu_vec);
h_vec = [1];
[sh,~]=size(h_vec);

beta2_vec = [0.00;0.10;0.20;0.30;0.35;0.40;0.45;0.50;0.55;0.60];
[sb,~] = size(beta2_vec);

T1 = nan(R,sm,sh,sb,sk);

size_T1_10 = nan(sb,sm,sh,sk);


for k = 1:1
    N = N_vec(k);
    T = T_vec(k);
    
rand('twister',312)
rho = 0.3+rand(N,1)*0.5;
for g = 1:sb
beta2 = beta2_vec(g);

for d = 1:sh
    
h = h_vec(d);
n = T+h+lags;

seed=123456;
stream = RandStream('mrg32k3a','Seed',seed);
parfor b=1:R
    set(stream, 'Substream', b);
    prev = RandStream.setGlobalStream(stream);

B = diag([N^(alpha1(1)/2), N^(alpha1(2)/2), N^(alpha1(3)/2)]); % r*r

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GARCH(1,1) process for forecast error v
omega = 0.1;
alpha_g = 0.1;
beta_g = 0.2;

v = zeros(n,1);        % Initialize error term
h_garch = zeros(n,1);  % Conditional variance
h_garch(1) = omega / (1 - alpha_g - beta_g); % Unconditional variance

rng(b + 1000);         % Optional: reset seed to ensure reproducibility across b

z = randn(n,1);        % i.i.d. standard normal innovations

for t = 2:n
    h_garch(t) = omega + alpha_g*(v(t-1)^2) + beta_g*h_garch(t-1);
    v(t) = sqrt(h_garch(t)) * z(t);
end
%%%%%%%%%%%%%%%%%%%%
%if no GARCH effects is preferred, comment out the entire
% earlier set of lines and un-comment the following two:

%eps = randn(T+h+lags,1);
%v = eps;
%%%%%%%%%%%%%%%%%%%%%

u = randn(T+h+lags,r); 
F = u; % T x r 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cross-sectional dependence parameters
beta_cs = 0.4;  % Adjust this between 0 (no dependence) and 1 (strong dependence)
K = 5;          % Number of neighbors

% Step 1: Generate initial heteroskedastic or homoskedastic shocks
Sigma_diag = diag(rand(N,1) + 0.5);  % Variances between 0.5 and 1.5
epss = mvnrnd(zeros(1,N), Sigma_diag, T+h+lags); % iid across time

% Step 2: Pad with zeros for moving average (K neighbors left and right)
epss_pad = [zeros(T+h+lags,K), epss, zeros(T+h+lags,K)];

% Step 3: Construct cross-sectionally dependent shocks
w = zeros(T+h+lags, N);
for j = 1:N
    w(:,j) = beta_cs * sum(epss_pad(:, j:(j+2*K)), 2) + ...
             (1 - beta_cs) * epss_pad(:, j+K);  % central column
end

% Step 4: Add AR(1) time structure (optional, as in your original code)
e = zeros(size(w));
for j = 1:N
    e(:,j) = filter(1, [1, -rho(j)], w(:,j));  % AR(1) in time
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if no cross sectional dependence is preferred, comment out the entire
% earlier set of lines and un-comment the following:

%epss = randn(T+h+lags,N);
%e = epss;
%for j=1:N
%   e(:,j)=filter(1,[1,-rho(j)],epss(:,j)); 
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define parameters
pi = 24; % specify the value for parameter pi
Z = randn(N,r);

% Generate disturbance
random_dist = pi * Z;

lambda = (Z*sqrtm(D2)*B)/ sqrt(N) + random_dist/sqrt(N); %factor lodadings

X = F*lambda'+e; %generate panel data

f_reg1 = F(:,1);
f_reg2 = F(:,2);
f_reg3 = F(:,3);

Y=zeros(n,1); %n=T+h+lags, h=1, lags=0

Y(h+1:n)=1.25+0.5*Y(1:n-h)+beta2*f_reg1(1:n-h)+beta2*f_reg2(1:n-h)+beta2*f_reg3(1:n-h)+v(h+1:n);

ehat1 = recursive_hstep_fast(Y(h+1:n),[Y(h+1:n)],0.25,h);

ehat2 = fact_recursive_hstep_fast(Y(h+1:n),[Y(h+1:n)],[X(h+1:n,:)],3,0.25,h);

for m=1:sm
[T1(b,m,d,g,k),T1_nw(b,m,d,g,k),T1_alrv(b,m,d,g,k),...
    T1_d(b,m,d,g,k),T1_d_nw(b,m,d,g,k),T1_d_alrv(b,m,d,g,k)]=pred_encompass_dnorm(ehat1,ehat2,mu_vec(m));
end
RandStream.setGlobalStream(prev);
end

end

end

end
for k = 1:sk
for g = 1:sb
for d = 1:sh
for m = 1:sm 
          size_T1_10(g,m,d,k) = sum(T1(:,m,d,g,k)>1.6449)/R;
end
end
end
end


str_beta = ["$\beta_{2}$=0.0";"$\beta_{2}$=0.10";"$\beta_{2}$=0.20";"$\beta_{2}$=0.30";"$\beta_{2}$=0.35";"$\beta_{2}$=0.40";"$\beta_{2}$=0.45";"$\beta_{2}$=0.50";"$\beta_{2}$=0.55";"$\beta_{2}$=0.60";];
str_h1 = ["","","h=1","",""];
str_nt1 = ["","","$(N,T)=(500,500)$","",""];
str_mu = ["$\mu_{0}","0.30","0.35","0.40","0.45"];


mat_T10_k1 = [str_nt1;str_mu;str_h1;str_beta,size_T1_10(:,:,1,1)];
disp(mat_T10_k1);
