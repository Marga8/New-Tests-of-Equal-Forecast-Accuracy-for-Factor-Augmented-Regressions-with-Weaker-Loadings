clear;
clc;


% Basic Parameterizations for DGP 

R = 500; %nr repetitions
pi0 = 0.25; %fraction
N_vec=[800]; %dimension
T_vec = [500]; %sample size

[nv,~]=size(N_vec);


h=1;
r = 3; % number of factors
lags = 0;
%weak loadings parameters
D2 = diag([3, 2, 1]);
alpha1 = [0.51, 0.7, 1];


beta2_vec = [0;0.10;0.20;0.30;0.35;0.40;0.45;0.50;0.55;0.60];
[sb,~] = size(beta2_vec);

% Parameterizations for the S(lam10,lam20) statistic

lam10 = 0.6;
lam20_seq = [0.5:0.05:0.95]'; %from 0.5 to 0.95 by 0.05 so 10 values
[ns,~]=size(lam20_seq);

% Parameterizations for the Sbar(tau0;lam20) statistic 

tauvec = 0.80;
[nt,~]=size(tauvec);
lam20_seq_bar = [0.5:0.05:1]'; %from 0.5 till 1 by 0.05 so 11 values
nsb=1;

% Initializations (storage preps) 

S0 = nan(R,ns,sb,nv);
S0_nw = nan(R,ns,sb,nv);
S0_adj = nan(R,ns,sb,nv);
S0_adj_nw = nan(R,ns,sb,nv);
pv_S0 = nan(R,ns,sb,nv);
pv_S0_nw = nan(R,ns,sb,nv);
pv_S0_adj = nan(R,ns,sb,nv);
pv_S0_adj_nw = nan(R,ns,sb,nv);

Sbar = nan(R,nt,nsb,sb,nv);
Sbar_nw = nan(R,nt,nsb,sb,nv);
Sbar_adj = nan(R,nt,nsb,sb,nv);
Sbar_adj_nw = nan(R,nt,nsb,sb,nv);
pv_Sbar = nan(R,nt,nsb,sb,nv);
pv_Sbar_nw = nan(R,nt,nsb,sb,nv);
pv_Sbar_adj = nan(R,nt,nsb,sb,nv);
pv_Sbar_adj_nw = nan(R,nt,nsb,sb,nv);

Size_Sbar  = nan(nt,nsb,sb,nv);
Size_Sbar_nw  = nan(nt,nsb,sb,nv);
Size_Sbar_adj  = nan(nt,nsb,sb,nv);
Size_Sbar_adj_nw  = nan(nt,nsb,sb,nv);

% ========================================

for ggg = 1:1
    N = N_vec(ggg);
    T = T_vec(ggg);
    
rand('twister',312)

rho = 0.3+rand(N,1)*0.5;

for g = 1:sb
beta2 = beta2_vec(g);


n = T+h+lags;

seed=123456;
stream = RandStream('mrg32k3a','Seed',seed);
parfor b=1:R
    set(stream, 'Substream', b);
    prev = RandStream.setGlobalStream(stream);

B = diag([N^(alpha1(1)/2), N^(alpha1(2)/2), N^(alpha1(3)/2)]); % r*r

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if no GARCH effects is preferred, comment out the entire
% earlier set of lines and un-comment the following:

%eps = randn(T+h+lags,1);
%v = eps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    %e(:,j)=filter(1,[1,-rho(j)],epss(:,j)); 
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

Y=zeros(n,1); 

Y(h+1:n)=1.25+0.5*Y(1:n-h)+beta2*f_reg1(1:n-h)+beta2*f_reg2(1:n-h)+beta2*f_reg3(1:n-h)+v(h+1:n);

ehat1 = recursive_hstep_fast(Y(h+1:n),[Y(h+1:n)],0.25,h);

ehat2 = fact_recursive_hstep_fast(Y(h+1:n),[Y(h+1:n)],[X(h+1:n,:)],3,0.25,h);

for t = 1:nt
    for m = 1:nsb
[Sbar(b,t,m,g,ggg), Sbar_nw(b,t,m,g,ggg), Sbar_adj(b,t,m,g,ggg), Sbar_adj_nw(b,t,m,g,ggg), pv_Sbar(b,t,m,g,ggg), pv_Sbar_nw(b,t,m,g,ggg), pv_Sbar_adj(b,t,m,g,ggg), pv_Sbar_adj_nw(b,t,m,g,ggg)] = Nested_Stats_Sbar_g4(ehat1,ehat2,lam20_seq_bar(m),tauvec(t));
    end
end

end
end
end

%%%%%
% Define the beta strings and lambda headers
str_beta = ["$\beta_{2}$=0";"$\beta_{2}$=0.10"; "$\beta_{2}$=0.20"; "$\beta_{2}$=0.30"; ...
            "$\beta_{2}$=0.35"; "$\beta_{2}$=0.40"; "$\beta_{2}$=0.45"; ...
            "$\beta_{2}$=0.50"; "$\beta_{2}$=0.55"; "$\beta_{2}$=0.60"];

% Lambda headers from 0.5 to 0.95 with step 0.05
lambda_headers = "lambda=" + string(0.5:0.05:0.95);

% Create the primary headers for S0 and S0_adj
header_S0 = repmat({"S0 (N=800, T=500)"}, 1, length(lambda_headers));
header_S0_adj = repmat({"S0_Adj (N=800, T=500)"}, 1, length(lambda_headers));

% Create the combined overall header with an empty column for beta
overall_header = ["", header_S0, header_S0_adj];

% Add the lambda headers below the overall header
combined_headers = ["", lambda_headers, lambda_headers];



for t = 1:nt
   for m = 1:nsb
       for g=1:sb
Size_Sbar(t,m,g,:) = sum(pv_Sbar(:,t,m,g,:)<0.05)/R;
Size_Sbar_adj(t,m,g,:) = sum(pv_Sbar_adj(:,t,m,g,:)<0.05)/R;
       end
    end
end


% Lambda headers from 0.5 to 1 with step 0.05
lambda_headers_bar = "lambda2=0.5"; 

% Create the primary headers for S_bar and S_bar_adj
header_Sbar = repmat({"S_bar (N=800, T=500)"}, 1, length(lambda_headers_bar));
header_Sbar_adj = repmat({"S_bar_Adj (N=800, T=500)"}, 1, length(lambda_headers_bar));

% Create the combined overall header with an empty column for beta
overall_header_bar = ["", header_Sbar, header_Sbar_adj];

% Add the lambda headers below the overall header
combined_headers_bar = ["", lambda_headers_bar, lambda_headers_bar];

% Extract and transpose the relevant data for S_bar and S_bar_adj
Size_Sbar_selected = squeeze(Size_Sbar(1, :, :, 1))';        % nsb x sb -> sb x nsb
Size_Sbar_adj_selected = squeeze(Size_Sbar_adj(1, :, :, 1))'; % nsb x sb -> sb x nsb

% Combine the beta values with the data
out_data_bar = [str_beta, Size_Sbar_selected', Size_Sbar_adj_selected'];

% Combine the headers and data into one table
out_Sbar_Sbaradj = [overall_header_bar; combined_headers_bar; out_data_bar];

% Display the table
disp(out_Sbar_Sbaradj);




