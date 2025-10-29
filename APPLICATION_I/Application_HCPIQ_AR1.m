clear;
data_hcpiq = readtable('WB_HCPI_Q.xlsx','Sheet','HCPIQ');

[n,~]=size(data_hcpiq);

%q0=0;
q0=4;

%h=4;
h=1;
q=q0;
m = max(h,q)+2;

mydates = (datetime(1970,1,1):calmonths(3):datetime(2023,3,1))';
fex_dates = mydates(1+h:n);

usa_cpi_q = data_hcpiq.USA_HCPIQ;
gbr_cpi_q = data_hcpiq.GBR_HCPIQ;
jpn_cpi_q = data_hcpiq.JPN_HCPIQ;
fra_cpi_q = data_hcpiq.FRA_HCPIQ;
deu_cpi_q = data_hcpiq.DEU_HCPIQ;
esp_cpi_q = data_hcpiq.ESP_HCPIQ;
ita_cpi_q = data_hcpiq.ITA_HCPIQ;
nld_cpi_q = data_hcpiq.NLD_HCPIQ;
lux_cpi_q = data_hcpiq.LUX_HCPIQ;
can_cpi_q = data_hcpiq.CAN_HCPIQ;
irl_cpi_q = data_hcpiq.IRL_HCPIQ;
fin_cpi_q = data_hcpiq.FIN_HCPIQ;
nzl_cpi_q = data_hcpiq.NZL_HCPIQ;
grc_cpi_q = data_hcpiq.GRC_HCPIQ;
prt_cpi_q = data_hcpiq.PRT_HCPIQ;
nor_cpi_q = data_hcpiq.NOR_HCPIQ;
kor_cpi_q = data_hcpiq.KOR_HCPIQ;
dnk_cpi_q = data_hcpiq.DNK_HCPIQ;
swe_cpi_q = data_hcpiq.SWE_HCPIQ;
aus_cpi_q = data_hcpiq.AUS_HCPIQ;
aut_cpi_q = data_hcpiq.AUT_HCPIQ;
bel_cpi_q = data_hcpiq.BEL_HCPIQ;
che_cpi_q = data_hcpiq.CHE_HCPIQ;

%dependent variables
Y_usa = (400/h)*(log(usa_cpi_q(m:n))-log(usa_cpi_q(m-h:n-h))); 
Y_gbr = (400/h)*(log(gbr_cpi_q(m:n))-log(gbr_cpi_q(m-h:n-h)));
Y_jpn = (400/h)*(log(jpn_cpi_q(m:n))-log(jpn_cpi_q(m-h:n-h)));
Y_fra = (400/h)*(log(fra_cpi_q(m:n))-log(fra_cpi_q(m-h:n-h)));
Y_deu = (400/h)*(log(deu_cpi_q(m:n))-log(deu_cpi_q(m-h:n-h)));
Y_esp = (400/h)*(log(esp_cpi_q(m:n))-log(esp_cpi_q(m-h:n-h)));
Y_ita = (400/h)*(log(ita_cpi_q(m:n))-log(ita_cpi_q(m-h:n-h)));
Y_nld = (400/h)*(log(nld_cpi_q(m:n))-log(nld_cpi_q(m-h:n-h)));
Y_lux = (400/h)*(log(lux_cpi_q(m:n))-log(lux_cpi_q(m-h:n-h)));
Y_can = (400/h)*(log(can_cpi_q(m:n))-log(can_cpi_q(m-h:n-h)));
Y_irl = (400/h)*(log(irl_cpi_q(m:n))-log(irl_cpi_q(m-h:n-h)));
Y_fin = (400/h)*(log(fin_cpi_q(m:n))-log(fin_cpi_q(m-h:n-h)));
Y_nzl = (400/h)*(log(nzl_cpi_q(m:n))-log(nzl_cpi_q(m-h:n-h)));
Y_grc = (400/h)*(log(grc_cpi_q(m:n))-log(grc_cpi_q(m-h:n-h)));
Y_prt = (400/h)*(log(prt_cpi_q(m:n))-log(prt_cpi_q(m-h:n-h)));
Y_nor = (400/h)*(log(nor_cpi_q(m:n))-log(nor_cpi_q(m-h:n-h)));
Y_kor = (400/h)*(log(kor_cpi_q(m:n))-log(kor_cpi_q(m-h:n-h)));
Y_dnk = (400/h)*(log(dnk_cpi_q(m:n))-log(dnk_cpi_q(m-h:n-h)));
Y_swe = (400/h)*(log(swe_cpi_q(m:n))-log(swe_cpi_q(m-h:n-h)));
Y_aus = (400/h)*(log(aus_cpi_q(m:n))-log(aus_cpi_q(m-h:n-h)));
Y_aut = (400/h)*(log(aut_cpi_q(m:n))-log(aut_cpi_q(m-h:n-h)));
Y_bel = (400/h)*(log(bel_cpi_q(m:n))-log(bel_cpi_q(m-h:n-h)));
Y_che = (400/h)*(log(che_cpi_q(m:n))-log(che_cpi_q(m-h:n-h)));

[nx,nc]=size(Y_usa);

XMAT_usa = zeros(nx,q+1);
XMAT_gbr = zeros(nx,q+1);
XMAT_jpn = zeros(nx,q+1);
XMAT_fra = zeros(nx,q+1);
XMAT_deu = zeros(nx,q+1);
XMAT_esp = zeros(nx,q+1);
XMAT_ita = zeros(nx,q+1);
XMAT_nld = zeros(nx,q+1);
XMAT_lux = zeros(nx,q+1);
XMAT_can = zeros(nx,q+1);
XMAT_irl = zeros(nx,q+1);
XMAT_fin = zeros(nx,q+1);
XMAT_nzl = zeros(nx,q+1);
XMAT_grc = zeros(nx,q+1);
XMAT_prt = zeros(nx,q+1);
XMAT_nor = zeros(nx,q+1);
XMAT_kor = zeros(nx,q+1);
XMAT_dnk = zeros(nx,q+1);
XMAT_swe = zeros(nx,q+1);
XMAT_aus = zeros(nx,q+1);
XMAT_aut = zeros(nx,q+1);
XMAT_bel = zeros(nx,q+1);
XMAT_che = zeros(nx,q+1);

for k=0:q0
XMAT_usa(:,k+1)=(400/h)*(log(usa_cpi_q(m-k:n-k))-log(usa_cpi_q(m-k-1:n-k-1)));
XMAT_gbr(:,k+1)=(400/h)*(log(gbr_cpi_q(m-k:n-k))-log(gbr_cpi_q(m-k-1:n-k-1)));
XMAT_jpn(:,k+1)=(400/h)*(log(jpn_cpi_q(m-k:n-k))-log(jpn_cpi_q(m-k-1:n-k-1)));
XMAT_fra(:,k+1)=(400/h)*(log(fra_cpi_q(m-k:n-k))-log(fra_cpi_q(m-k-1:n-k-1)));
XMAT_deu(:,k+1)=(400/h)*(log(deu_cpi_q(m-k:n-k))-log(deu_cpi_q(m-k-1:n-k-1)));
XMAT_esp(:,k+1)=(400/h)*(log(esp_cpi_q(m-k:n-k))-log(esp_cpi_q(m-k-1:n-k-1)));
XMAT_ita(:,k+1)=(400/h)*(log(ita_cpi_q(m-k:n-k))-log(ita_cpi_q(m-k-1:n-k-1)));
XMAT_nld(:,k+1)=(400/h)*(log(nld_cpi_q(m-k:n-k))-log(nld_cpi_q(m-k-1:n-k-1)));
XMAT_lux(:,k+1)=(400/h)*(log(lux_cpi_q(m-k:n-k))-log(lux_cpi_q(m-k-1:n-k-1)));
XMAT_can(:,k+1)=(400/h)*(log(can_cpi_q(m-k:n-k))-log(can_cpi_q(m-k-1:n-k-1)));
XMAT_irl(:,k+1)=(400/h)*(log(irl_cpi_q(m-k:n-k))-log(irl_cpi_q(m-k-1:n-k-1)));
XMAT_fin(:,k+1)=(400/h)*(log(fin_cpi_q(m-k:n-k))-log(fin_cpi_q(m-k-1:n-k-1)));
XMAT_nzl(:,k+1)=(400/h)*(log(nzl_cpi_q(m-k:n-k))-log(nzl_cpi_q(m-k-1:n-k-1)));
XMAT_grc(:,k+1)=(400/h)*(log(grc_cpi_q(m-k:n-k))-log(grc_cpi_q(m-k-1:n-k-1)));
XMAT_prt(:,k+1)=(400/h)*(log(prt_cpi_q(m-k:n-k))-log(prt_cpi_q(m-k-1:n-k-1)));
XMAT_nor(:,k+1)=(400/h)*(log(nor_cpi_q(m-k:n-k))-log(nor_cpi_q(m-k-1:n-k-1)));
XMAT_kor(:,k+1)=(400/h)*(log(kor_cpi_q(m-k:n-k))-log(kor_cpi_q(m-k-1:n-k-1)));
XMAT_dnk(:,k+1)=(400/h)*(log(dnk_cpi_q(m-k:n-k))-log(dnk_cpi_q(m-k-1:n-k-1)));
XMAT_swe(:,k+1)=(400/h)*(log(swe_cpi_q(m-k:n-k))-log(swe_cpi_q(m-k-1:n-k-1)));
XMAT_aus(:,k+1)=(400/h)*(log(aus_cpi_q(m-k:n-k))-log(aus_cpi_q(m-k-1:n-k-1)));
XMAT_aut(:,k+1)=(400/h)*(log(aut_cpi_q(m-k:n-k))-log(aut_cpi_q(m-k-1:n-k-1)));
XMAT_bel(:,k+1)=(400/h)*(log(bel_cpi_q(m-k:n-k))-log(bel_cpi_q(m-k-1:n-k-1)));
XMAT_che(:,k+1)=(400/h)*(log(che_cpi_q(m-k:n-k))-log(che_cpi_q(m-k-1:n-k-1)));
end



%XMAT_glob = (XMAT_usa + XMAT_gbr + XMAT_jpn + XMAT_fra + XMAT_deu + XMAT_esp + ...
 %   XMAT_ita + XMAT_nld + XMAT_lux + XMAT_can + XMAT_irl + XMAT_fin + XMAT_nzl + XMAT_grc + XMAT_prt + ...
  %  XMAT_nor + XMAT_kor + XMAT_dnk + XMAT_swe + XMAT_aus + XMAT_aut + XMAT_bel + XMAT_che)/23;
XMAT_combined = [XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];

%%%%% DESCRIPTIVES %%%%%%
mean_val = mean(XMAT_combined, 'omitnan'); % Mean for each country
median_val = median(XMAT_combined, 'omitnan'); % Median
std_val = std(XMAT_combined, 'omitnan'); % Standard deviation
range_val = range(XMAT_combined, 'omitnan'); % Range (max - min)
iqr_val = iqr(XMAT_combined); % Interquartile range
%skewness_val = skewness(XMAT_combined, 0, 'omitnan');
%kurtosis_val = kurtosis(XMAT_combined, 0, 'omitnan');
variance_val = var(XMAT_combined);
cov_matrix = cov(XMAT_combined);

z_scores = zscore(XMAT_combined);
outliers_z = abs(z_scores) > 3; % Logical array where outliers are marked as true

country_names = {'USA', 'GBR', 'JPN', 'FRA', 'DEU', 'ESP', 'ITA', 'NLD', ...
                 'LUX', 'CAN', 'IRL', 'FIN', 'NZL', 'GRC', 'PRT', ...
                 'NOR', 'KOR', 'DNK', 'SWE', 'AUS', 'AUT', 'BEL', 'CHE'};

% Create the boxplot
%figure;
%boxplot(XMAT_combined, 'Labels', country_names);
%title('Boxplot of Inflation Rates for Different Countries');
%xlabel('Country');
%ylabel('Inflation Rate');

% Adjust the figure size
%set(gcf, 'PaperPositionMode', 'auto'); % Set the PaperPosition mode to auto
%set(gcf, 'PaperSize', [8 6]); % Set the desired paper size (width, height in inches)

% Save the figure as a PDF file
%print('boxplot_inflation_rates', '-dpdf', '-bestfit'); % Save as PDF using -bestfit


% Calculate the correlation matrix
% Create the heatmap
% Calculate the correlation matrix
%corr_matrix = corr(XMAT_combined, 'rows', 'pairwise');

% Create the heatmap with correlation values inside the squares
%figure;
%h = heatmap(country_names, country_names, corr_matrix, ...
%            'CellLabelFormat','%.2f'); % Format to show 2 decimal places

% Add title and show colorbar
%title('Correlation Matrix of Inflation Rates');
%h.ColorbarVisible = 'on'; % Show color bar if desired

% Adjust the figure size
%set(gcf, 'PaperPositionMode', 'auto'); % Set the PaperPosition mode to auto
%set(gcf, 'PaperSize', [8 6]); % Set the desired paper size

% Save the heatmap as a PDF file
%print('correlation_heatmap', '-dpdf', '-bestfit'); % Save as PDF using -bestfit



%mahal_dist = mahal(XMAT_combined, XMAT_combined); % Mahalanobis distance
%outliers_mahal = mahal_dist > chi2inv(0.975, size(XMAT_combined, 2)); % 95% confidence
%autocorr(XMAT_combined(:, 1)); % For the first country, modify for others
%%%%%%%%%%%%%%%%%%%%%%%%%
% with Bai-Ng (2002)
%nfact1 = NbFactors(XMAT_combined,15);
%nfact = extractfield(nfact1,'khat_BIC3');
%nfact2=extractfield(nfact1,'khat_PC');
%nfact=nfact2(1);


% with Alessi-Barigozzi-Capasso criterion
%nfact = ABC_crit(XMAT_combined,15);

% with Ahn and Horenstein criterion
%nfact = AH_crit(XMAT_combined);

%manually imputed
%nfact = 15;

% Estimating the factor (assume r=3 is known)

%Xs = standard(XMAT_combined);
%XX=Xs*Xs';
%[Fhat0,eigval,Fhat1]=svd(XX');
%Fhat = Fhat0(:,1:1)*sqrt(T+h+lags);
%XMAT_glob = Fhat0(:,1:nfact)*sqrt(length(XMAT_combined));
%fhat_reg = Fhat0(:,1);
%fhat_reg1 = Fhat0(:,1);
%fhat_reg2 = Fhat0(:,2);
%fhat_reg3 = Fhat0(:,3);
XMAT_glob = XMAT_combined;
% the following is for BIC country specific selection of lag length
for k=0:q
ehat_usa(:,k+1)=recursive_hstep_fast(Y_usa,[XMAT_usa(:,1:k+1)],0.25,h);
ehat_gbr(:,k+1)=recursive_hstep_fast(Y_gbr,[XMAT_gbr(:,1:k+1)],0.25,h);
ehat_jpn(:,k+1)=recursive_hstep_fast(Y_jpn,[XMAT_jpn(:,1:k+1)],0.25,h);
ehat_fra(:,k+1)=recursive_hstep_fast(Y_fra,[XMAT_fra(:,1:k+1)],0.25,h);
ehat_deu(:,k+1)=recursive_hstep_fast(Y_deu,[XMAT_deu(:,1:k+1)],0.25,h);
ehat_esp(:,k+1)=recursive_hstep_fast(Y_esp,[XMAT_esp(:,1:k+1)],0.25,h);
ehat_ita(:,k+1)=recursive_hstep_fast(Y_ita,[XMAT_ita(:,1:k+1)],0.25,h);
ehat_nld(:,k+1)=recursive_hstep_fast(Y_nld,[XMAT_nld(:,1:k+1)],0.25,h);
ehat_lux(:,k+1)=recursive_hstep_fast(Y_lux,[XMAT_lux(:,1:k+1)],0.25,h);
ehat_can(:,k+1)=recursive_hstep_fast(Y_can,[XMAT_can(:,1:k+1)],0.25,h);
ehat_irl(:,k+1)=recursive_hstep_fast(Y_irl,[XMAT_irl(:,1:k+1)],0.25,h);
ehat_fin(:,k+1)=recursive_hstep_fast(Y_fin,[XMAT_fin(:,1:k+1)],0.25,h);
ehat_nzl(:,k+1)=recursive_hstep_fast(Y_nzl,[XMAT_nzl(:,1:k+1)],0.25,h);
ehat_grc(:,k+1)=recursive_hstep_fast(Y_grc,[XMAT_grc(:,1:k+1)],0.25,h);
ehat_prt(:,k+1)=recursive_hstep_fast(Y_prt,[XMAT_prt(:,1:k+1)],0.25,h);
ehat_nor(:,k+1)=recursive_hstep_fast(Y_nor,[XMAT_nor(:,1:k+1)],0.25,h);
ehat_kor(:,k+1)=recursive_hstep_fast(Y_kor,[XMAT_kor(:,1:k+1)],0.25,h);
ehat_dnk(:,k+1)=recursive_hstep_fast(Y_dnk,[XMAT_dnk(:,1:k+1)],0.25,h);
ehat_swe(:,k+1)=recursive_hstep_fast(Y_swe,[XMAT_swe(:,1:k+1)],0.25,h);
ehat_aus(:,k+1)=recursive_hstep_fast(Y_aus,[XMAT_aus(:,1:k+1)],0.25,h);
ehat_aut(:,k+1)=recursive_hstep_fast(Y_aut,[XMAT_aut(:,1:k+1)],0.25,h);
ehat_bel(:,k+1)=recursive_hstep_fast(Y_bel,[XMAT_bel(:,1:k+1)],0.25,h);
ehat_che(:,k+1)=recursive_hstep_fast(Y_che,[XMAT_bel(:,1:k+1)],0.25,h);
end

[nehat,cehat]=size(ehat_usa);

cov_ehat_usa = ehat_usa'*ehat_usa/nehat;
cov_ehat_gbr = ehat_gbr'*ehat_gbr/nehat;
cov_ehat_jpn = ehat_jpn'*ehat_jpn/nehat;
cov_ehat_fra = ehat_fra'*ehat_fra/nehat;
cov_ehat_deu = ehat_deu'*ehat_deu/nehat;
cov_ehat_esp = ehat_esp'*ehat_esp/nehat;
cov_ehat_ita = ehat_ita'*ehat_ita/nehat;
cov_ehat_nld = ehat_nld'*ehat_nld/nehat;
cov_ehat_lux = ehat_lux'*ehat_lux/nehat;
cov_ehat_can = ehat_can'*ehat_can/nehat;
cov_ehat_irl = ehat_irl'*ehat_irl/nehat;
cov_ehat_fin = ehat_fin'*ehat_fin/nehat;
cov_ehat_nzl = ehat_nzl'*ehat_nzl/nehat;
cov_ehat_grc = ehat_grc'*ehat_grc/nehat;
cov_ehat_prt = ehat_prt'*ehat_prt/nehat;
cov_ehat_nor = ehat_nor'*ehat_nor/nehat;
cov_ehat_kor = ehat_kor'*ehat_kor/nehat;
cov_ehat_dnk = ehat_dnk'*ehat_dnk/nehat;
cov_ehat_swe = ehat_swe'*ehat_swe/nehat;
cov_ehat_aus = ehat_aus'*ehat_aus/nehat;
cov_ehat_aut = ehat_aut'*ehat_aut/nehat;
cov_ehat_bel = ehat_bel'*ehat_bel/nehat;
cov_ehat_che = ehat_che'*ehat_che/nehat;

%BIC for lag length

[~,qhat_usa] = min(log(diag(cov_ehat_usa))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_gbr] = min(log(diag(cov_ehat_gbr))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_jpn] = min(log(diag(cov_ehat_jpn))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_fra] = min(log(diag(cov_ehat_fra))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_deu] = min(log(diag(cov_ehat_deu))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_esp] = min(log(diag(cov_ehat_esp))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_ita] = min(log(diag(cov_ehat_ita))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_nld] = min(log(diag(cov_ehat_nld))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_lux] = min(log(diag(cov_ehat_lux))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_can] = min(log(diag(cov_ehat_can))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_irl] = min(log(diag(cov_ehat_irl))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_fin] = min(log(diag(cov_ehat_fin))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_nzl] = min(log(diag(cov_ehat_nzl))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_grc] = min(log(diag(cov_ehat_grc))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_prt] = min(log(diag(cov_ehat_prt))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_nor] = min(log(diag(cov_ehat_nor))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_kor] = min(log(diag(cov_ehat_kor))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_dnk] = min(log(diag(cov_ehat_dnk))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_swe] = min(log(diag(cov_ehat_swe))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_aus] = min(log(diag(cov_ehat_aus))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_aut] = min(log(diag(cov_ehat_aut))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_bel] = min(log(diag(cov_ehat_bel))+((log(nehat)/nehat).*([1:q+1]')));
[~,qhat_che] = min(log(diag(cov_ehat_che))+((log(nehat)/nehat).*([1:q+1]')));


[qhat_usa,qhat_gbr,qhat_jpn,qhat_fra,qhat_deu,qhat_esp,qhat_ita,qhat_nld,qhat_lux,qhat_can,qhat_irl,qhat_fin,qhat_nzl,qhat_grc,qhat_prt]
[qhat_nor,qhat_kor,qhat_dnk,qhat_swe,qhat_aus,qhat_aut,qhat_bel,qhat_che];

% Encompassing using the above lags
% REMINDER: take out from XMAT_glob the reference country
XMAT_min_usa=[XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_usa=recursive_hstep_fast(Y_usa,[XMAT_usa(:,1)],0.25,h);
%zehat2_usa=recursive_hstep_fast(Y_usa,[XMAT_usa(:,1:qhat_usa),XMAT_glob(:,1:4)],0.25,h);
zehat2_usa=fact_recursive_hstep_fast(Y_usa,[XMAT_usa(:,1)],XMAT_min_usa,'determine',0.25,h);

XMAT_min_gbr=[XMAT_usa(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_gbr=recursive_hstep_fast(Y_gbr,[XMAT_gbr(:,1)],0.25,h);
%zehat2_gbr=recursive_hstep_fast(Y_gbr,[XMAT_gbr(:,1:qhat_gbr),XMAT_glob(:,1:4)],0.25,h);
zehat2_gbr=fact_recursive_hstep_fast(Y_gbr,[XMAT_gbr(:,1)],XMAT_min_gbr,'determine',0.25,h);

XMAT_min_jpn=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_jpn=recursive_hstep_fast(Y_jpn,[XMAT_jpn(:,1)],0.25,h);
%zehat2_jpn=recursive_hstep_fast(Y_jpn,[XMAT_jpn(:,1:qhat_jpn),XMAT_glob(:,1:4)],0.25,h);
zehat2_jpn=fact_recursive_hstep_fast(Y_jpn,[XMAT_jpn(:,1)],XMAT_min_jpn,'determine',0.25,h);

XMAT_min_fra=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_fra=recursive_hstep_fast(Y_fra,[XMAT_fra(:,1)],0.25,h);
%zehat2_fra=recursive_hstep_fast(Y_fra,[XMAT_fra(:,1:qhat_fra),XMAT_glob(:,1:4)],0.25,h);
zehat2_fra=fact_recursive_hstep_fast(Y_fra,[XMAT_fra(:,1)],XMAT_min_fra,'determine',0.25,h);


XMAT_min_deu=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_deu=recursive_hstep_fast(Y_deu,[XMAT_deu(:,1)],0.25,h);
%zehat2_deu=recursive_hstep_fast(Y_deu,[XMAT_deu(:,1:qhat_deu),XMAT_glob(:,1:4)],0.25,h);
zehat2_deu=fact_recursive_hstep_fast(Y_deu,[XMAT_deu(:,1)],XMAT_min_deu,'determine',0.25,h);

XMAT_min_esp=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_esp=recursive_hstep_fast(Y_esp,[XMAT_esp(:,1)],0.25,h);
%zehat2_esp=recursive_hstep_fast(Y_esp,[XMAT_esp(:,1:qhat_esp),XMAT_glob(:,1:4)],0.25,h);
zehat2_esp=fact_recursive_hstep_fast(Y_esp,[XMAT_esp(:,1)],XMAT_min_esp,'determine',0.25,h);

XMAT_min_ita=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_ita=recursive_hstep_fast(Y_ita,[XMAT_ita(:,1)],0.25,h);
%zehat2_ita=recursive_hstep_fast(Y_ita,[XMAT_ita(:,1:qhat_ita),XMAT_glob(:,1:4)],0.25,h);
zehat2_ita=fact_recursive_hstep_fast(Y_ita,[XMAT_ita(:,1)],XMAT_min_ita,'determine',0.25,h);

XMAT_min_nld=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_nld=recursive_hstep_fast(Y_nld,[XMAT_nld(:,1)],0.25,h);
%zehat2_nld=recursive_hstep_fast(Y_nld,[XMAT_nld(:,1:qhat_nld),XMAT_glob(:,1:4)],0.25,h);
zehat2_nld=fact_recursive_hstep_fast(Y_nld,[XMAT_nld(:,1)],XMAT_min_nld,'determine',0.25,h);

XMAT_min_lux=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_lux=recursive_hstep_fast(Y_lux,[XMAT_lux(:,1)],0.25,h);
%zehat2_lux=recursive_hstep_fast(Y_lux,[XMAT_lux(:,1:qhat_lux),XMAT_glob(:,1:4)],0.25,h);
zehat2_lux=fact_recursive_hstep_fast(Y_lux,[XMAT_lux(:,1)],XMAT_min_lux,'determine',0.25,h);

XMAT_min_can=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_can=recursive_hstep_fast(Y_can,[XMAT_can(:,1)],0.25,h);
%zehat2_can=recursive_hstep_fast(Y_can,[XMAT_can(:,1:qhat_can),XMAT_glob(:,1:4)],0.25,h);
zehat2_can=fact_recursive_hstep_fast(Y_can,[XMAT_can(:,1)],XMAT_min_can,'determine',0.25,h);

XMAT_min_irl=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_irl=recursive_hstep_fast(Y_irl,[XMAT_irl(:,1)],0.25,h);
%zehat2_irl=recursive_hstep_fast(Y_irl,[XMAT_irl(:,1:qhat_irl),XMAT_glob(:,1:4)],0.25,h);
zehat2_irl=fact_recursive_hstep_fast(Y_irl,[XMAT_irl(:,1)],XMAT_min_irl,'determine',0.25,h);

XMAT_min_fin=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_fin=recursive_hstep_fast(Y_fin,[XMAT_fin(:,1)],0.25,h);
%zehat2_fin=recursive_hstep_fast(Y_fin,[XMAT_fin(:,1:qhat_fin),XMAT_glob(:,1:4)],0.25,h);
zehat2_fin=fact_recursive_hstep_fast(Y_fin,[XMAT_fin(:,1)],XMAT_min_fin,'determine',0.25,h);

XMAT_min_nzl=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_nzl=recursive_hstep_fast(Y_nzl,[XMAT_nzl(:,1)],0.25,h);
%zehat2_nzl=recursive_hstep_fast(Y_nzl,[XMAT_nzl(:,1:qhat_nzl),XMAT_glob(:,1:4)],0.25,h);
zehat2_nzl=fact_recursive_hstep_fast(Y_nzl,[XMAT_nzl(:,1)],XMAT_min_nzl,'determine',0.25,h);

XMAT_min_grc=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_grc=recursive_hstep_fast(Y_grc,[XMAT_grc(:,1)],0.25,h);
%zehat2_grc=recursive_hstep_fast(Y_grc,[XMAT_grc(:,1:qhat_grc),XMAT_glob(:,1:4)],0.25,h);
zehat2_grc=fact_recursive_hstep_fast(Y_grc,[XMAT_grc(:,1)],XMAT_min_grc,'determine',0.25,h);

XMAT_min_prt=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_prt=recursive_hstep_fast(Y_prt,[XMAT_prt(:,1)],0.25,h);
%zehat2_prt=recursive_hstep_fast(Y_prt,[XMAT_prt(:,1:qhat_prt),XMAT_glob(:,1:4)],0.25,h);
zehat2_prt=fact_recursive_hstep_fast(Y_prt,[XMAT_prt(:,1)],XMAT_min_prt,'determine',0.25,h);

XMAT_min_nor=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_nor=recursive_hstep_fast(Y_nor,[XMAT_nor(:,1)],0.25,h);
%zehat2_nor=recursive_hstep_fast(Y_nor,[XMAT_nor(:,1:qhat_nor),XMAT_glob(:,1:4)],0.25,h);
zehat2_nor=fact_recursive_hstep_fast(Y_nor,[XMAT_nor(:,1)],XMAT_min_nor,'determine',0.25,h);

XMAT_min_kor=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_kor=recursive_hstep_fast(Y_kor,[XMAT_kor(:,1)],0.25,h);
%zehat2_kor=recursive_hstep_fast(Y_kor,[XMAT_kor(:,1:qhat_kor),XMAT_glob(:,1:4)],0.25,h);
zehat2_kor=fact_recursive_hstep_fast(Y_kor,[XMAT_kor(:,1)],XMAT_min_kor,'determine',0.25,h);

XMAT_min_dnk=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_dnk=recursive_hstep_fast(Y_dnk,[XMAT_dnk(:,1)],0.25,h);
%zehat2_dnk=recursive_hstep_fast(Y_dnk,[XMAT_dnk(:,1:qhat_dnk),XMAT_glob(:,1:4)],0.25,h);
zehat2_dnk=fact_recursive_hstep_fast(Y_dnk,[XMAT_dnk(:,1)],XMAT_min_dnk,'determine',0.25,h);

XMAT_min_swe=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_swe=recursive_hstep_fast(Y_swe,[XMAT_swe(:,1)],0.25,h);
%zehat2_swe=recursive_hstep_fast(Y_swe,[XMAT_swe(:,1:qhat_swe),XMAT_glob(:,1:4)],0.25,h);
zehat2_swe=fact_recursive_hstep_fast(Y_swe,[XMAT_swe(:,1)],XMAT_min_swe,'determine',0.25,h);

XMAT_min_aus=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_aus=recursive_hstep_fast(Y_aus,[XMAT_aus(:,1)],0.25,h);
%zehat2_aus=recursive_hstep_fast(Y_aus,[XMAT_aus(:,1:qhat_aus),XMAT_glob(:,1:4)],0.25,h);
zehat2_aus=fact_recursive_hstep_fast(Y_aus,[XMAT_aus(:,1)],XMAT_min_aus,'determine',0.25,h);

XMAT_min_aut=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_bel(:,1), XMAT_che(:,1)];
zehat1_aut=recursive_hstep_fast(Y_aut,[XMAT_aut(:,1)],0.25,h);
%zehat2_aut=recursive_hstep_fast(Y_aut,[XMAT_aut(:,1:qhat_aut),XMAT_glob(:,1:4)],0.25,h);
zehat2_aut=fact_recursive_hstep_fast(Y_aut,[XMAT_aut(:,1)],XMAT_min_aut,'determine',0.25,h);

XMAT_min_bel=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_che(:,1)];
zehat1_bel=recursive_hstep_fast(Y_bel,[XMAT_bel(:,1)],0.25,h);
%zehat2_bel=recursive_hstep_fast(Y_bel,[XMAT_bel(:,1:qhat_bel),XMAT_glob(:,1:4)],0.25,h);
zehat2_bel=fact_recursive_hstep_fast(Y_bel,[XMAT_bel(:,1)],XMAT_min_bel,'determine',0.25,h);

XMAT_min_che=[XMAT_usa(:,1), XMAT_gbr(:,1), XMAT_jpn(:,1), XMAT_fra(:,1), XMAT_deu(:,1), ...
                 XMAT_esp(:,1), XMAT_ita(:,1), XMAT_nld(:,1), XMAT_lux(:,1), XMAT_can(:,1), ...
                 XMAT_irl(:,1), XMAT_fin(:,1), XMAT_nzl(:,1), XMAT_grc(:,1), XMAT_prt(:,1), ...
                 XMAT_nor(:,1), XMAT_kor(:,1), XMAT_dnk(:,1), XMAT_swe(:,1), XMAT_aus(:,1), ...
                 XMAT_aut(:,1), XMAT_bel(:,1)];
zehat1_che=recursive_hstep_fast(Y_che,[XMAT_che(:,1)],0.25,h);
%zehat2_che=recursive_hstep_fast(Y_che,[XMAT_bel(:,1:qhat_che),XMAT_glob(:,1:4)],0.25,h);
zehat2_che=fact_recursive_hstep_fast(Y_che,[XMAT_che(:,1)],XMAT_min_che,'determine',0.25,h);
mu_vec = 0.40;
%mu_vec = [0.40;0.45];
%[nmu,~]=size(mu_vec);
nmu=4;

stat_usa = nan(1,nmu);
stat_gbr = nan(1,nmu);
stat_jpn = nan(1,nmu);
stat_fra = nan(1,nmu);
stat_deu = nan(1,nmu);
stat_esp = nan(1,nmu);
stat_ita = nan(1,nmu);
stat_nld = nan(1,nmu);
stat_lux = nan(1,nmu);
stat_can = nan(1,nmu);
stat_irl = nan(1,nmu);
stat_fin = nan(1,nmu);
stat_nzl = nan(1,nmu);
stat_grc = nan(1,nmu);
stat_prt = nan(1,nmu);
stat_nor = nan(1,nmu);
stat_kor = nan(1,nmu);
stat_dnk = nan(1,nmu);
stat_swe = nan(1,nmu);
stat_aus = nan(1,nmu);
stat_aut = nan(1,nmu);
stat_bel = nan(1,nmu);
stat_che = nan(1,nmu);


% ENCOMPASSING
%for m=1:nmu
stat_usa(1,1) = pred_encompass_dnorm(zehat1_usa,zehat2_usa,mu_vec);
stat_gbr(1,1) = pred_encompass_dnorm(zehat1_gbr,zehat2_gbr,mu_vec);
stat_jpn(1,1) = pred_encompass_dnorm(zehat1_jpn,zehat2_jpn,mu_vec);
stat_fra(1,1) = pred_encompass_dnorm(zehat1_fra,zehat2_fra,mu_vec);
stat_deu(1,1) = pred_encompass_dnorm(zehat1_deu,zehat2_deu,mu_vec);
stat_esp(1,1) = pred_encompass_dnorm(zehat1_esp,zehat2_esp,mu_vec);
stat_ita(1,1) = pred_encompass_dnorm(zehat1_ita,zehat2_ita,mu_vec);
stat_nld(1,1) = pred_encompass_dnorm(zehat1_nld,zehat2_nld,mu_vec);
stat_lux(1,1) = pred_encompass_dnorm(zehat1_lux,zehat2_lux,mu_vec);
stat_can(1,1) = pred_encompass_dnorm(zehat1_can,zehat2_can,mu_vec);
stat_irl(1,1) = pred_encompass_dnorm(zehat1_irl,zehat2_irl,mu_vec);
stat_fin(1,1) = pred_encompass_dnorm(zehat1_fin,zehat2_fin,mu_vec);
stat_nzl(1,1) = pred_encompass_dnorm(zehat1_nzl,zehat2_nzl,mu_vec);
stat_grc(1,1) = pred_encompass_dnorm(zehat1_grc,zehat2_grc,mu_vec);
stat_prt(1,1) = pred_encompass_dnorm(zehat1_prt,zehat2_prt,mu_vec);
stat_nor(1,1) = pred_encompass_dnorm(zehat1_nor,zehat2_nor,mu_vec);
stat_kor(1,1) = pred_encompass_dnorm(zehat1_kor,zehat2_kor,mu_vec);
stat_dnk(1,1) = pred_encompass_dnorm(zehat1_dnk,zehat2_dnk,mu_vec);
stat_swe(1,1) = pred_encompass_dnorm(zehat1_swe,zehat2_swe,mu_vec);
stat_aus(1,1) = pred_encompass_dnorm(zehat1_aus,zehat2_aus,mu_vec);
stat_aut(1,1) = pred_encompass_dnorm(zehat1_aut,zehat2_aut,mu_vec);
stat_bel(1,1) = pred_encompass_dnorm(zehat1_bel,zehat2_bel,mu_vec);
stat_che(1,1) = pred_encompass_dnorm(zehat1_che,zehat2_che,mu_vec);
%end

%FORECAST ACCURACY g2

lam10 = 1;
lam20_seq = 0.65;

% USA
[S0_usa(1), S0_nw_usa(1), S0_adj_usa(1), S0_adj_nw_usa(1), pv_S0_usa(1), pv_S0_nw_usa(1), pv_S0_adj_usa(1), pv_S0_adj_nw_usa(1)] = Nested_Stats_S0(zehat1_usa, zehat2_usa, lam10, lam20_seq);
stat_usa(1,2) = S0_adj_usa;

% UK
[S0_gbr(1), S0_nw_gbr(1), S0_adj_gbr(1), S0_adj_nw_gbr(1), pv_S0_gbr(1), pv_S0_nw_gbr(1), pv_S0_adj_gbr(1), pv_S0_adj_nw_gbr(1)] = Nested_Stats_S0(zehat1_gbr, zehat2_gbr, lam10, lam20_seq);
stat_gbr(1,2) = S0_adj_gbr;

% Japan
[S0_jpn(1), S0_nw_jpn(1), S0_adj_jpn(1), S0_adj_nw_jpn(1), pv_S0_jpn(1), pv_S0_nw_jpn(1), pv_S0_adj_jpn(1), pv_S0_adj_nw_jpn(1)] = Nested_Stats_S0(zehat1_jpn, zehat2_jpn, lam10, lam20_seq);
stat_jpn(1,2) = S0_adj_jpn;

% France
[S0_fra(1), S0_nw_fra(1), S0_adj_fra(1), S0_adj_nw_fra(1), pv_S0_fra(1), pv_S0_nw_fra(1), pv_S0_adj_fra(1), pv_S0_adj_nw_fra(1)] = Nested_Stats_S0(zehat1_fra, zehat2_fra, lam10, lam20_seq);
stat_fra(1,2) = S0_adj_fra;

% Germany
[S0_deu(1), S0_nw_deu(1), S0_adj_deu(1), S0_adj_nw_deu(1), pv_S0_deu(1), pv_S0_nw_deu(1), pv_S0_adj_deu(1), pv_S0_adj_nw_deu(1)] = Nested_Stats_S0(zehat1_deu, zehat2_deu, lam10, lam20_seq);
stat_deu(1,2) = S0_adj_deu;

% Spain
[S0_esp(1), S0_nw_esp(1), S0_adj_esp(1), S0_adj_nw_esp(1), pv_S0_esp(1), pv_S0_nw_esp(1), pv_S0_adj_esp(1), pv_S0_adj_nw_esp(1)] = Nested_Stats_S0(zehat1_esp, zehat2_esp, lam10, lam20_seq);
stat_esp(1,2) = S0_adj_esp;

% Italy
[S0_ita(1), S0_nw_ita(1), S0_adj_ita(1), S0_adj_nw_ita(1), pv_S0_ita(1), pv_S0_nw_ita(1), pv_S0_adj_ita(1), pv_S0_adj_nw_ita(1)] = Nested_Stats_S0(zehat1_ita, zehat2_ita, lam10, lam20_seq);
stat_ita(1,2) = S0_adj_ita;

% Netherlands
[S0_nld(1), S0_nw_nld(1), S0_adj_nld(1), S0_adj_nw_nld(1), pv_S0_nld(1), pv_S0_nw_nld(1), pv_S0_adj_nld(1), pv_S0_adj_nw_nld(1)] = Nested_Stats_S0(zehat1_nld, zehat2_nld, lam10, lam20_seq);
stat_nld(1,2) = S0_adj_nld;

% Luxembourg
[S0_lux(1), S0_nw_lux(1), S0_adj_lux(1), S0_adj_nw_lux(1), pv_S0_lux(1), pv_S0_nw_lux(1), pv_S0_adj_lux(1), pv_S0_adj_nw_lux(1)] = Nested_Stats_S0(zehat1_lux, zehat2_lux, lam10, lam20_seq);
stat_lux(1,2) = S0_adj_lux;

% Canada
[S0_can(1), S0_nw_can(1), S0_adj_can(1), S0_adj_nw_can(1), pv_S0_can(1), pv_S0_nw_can(1), pv_S0_adj_can(1), pv_S0_adj_nw_can(1)] = Nested_Stats_S0(zehat1_can, zehat2_can, lam10, lam20_seq);
stat_can(1,2) = S0_adj_can;

% Ireland
[S0_irl(1), S0_nw_irl(1), S0_adj_irl(1), S0_adj_nw_irl(1), pv_S0_irl(1), pv_S0_nw_irl(1), pv_S0_adj_irl(1), pv_S0_adj_nw_irl(1)] = Nested_Stats_S0(zehat1_irl, zehat2_irl, lam10, lam20_seq);
stat_irl(1,2) = S0_adj_irl;

% Finland
[S0_fin(1), S0_nw_fin(1), S0_adj_fin(1), S0_adj_nw_fin(1), pv_S0_fin(1), pv_S0_nw_fin(1), pv_S0_adj_fin(1), pv_S0_adj_nw_fin(1)] = Nested_Stats_S0(zehat1_fin, zehat2_fin, lam10, lam20_seq);
stat_fin(1,2) = S0_adj_fin;

% New Zealand
[S0_nzl(1), S0_nw_nzl(1), S0_adj_nzl(1), S0_adj_nw_nzl(1), pv_S0_nzl(1), pv_S0_nw_nzl(1), pv_S0_adj_nzl(1), pv_S0_adj_nw_nzl(1)] = Nested_Stats_S0(zehat1_nzl, zehat2_nzl, lam10, lam20_seq);
stat_nzl(1,2) = S0_adj_nzl;

% Greece
[S0_grc(1), S0_nw_grc(1), S0_adj_grc(1), S0_adj_nw_grc(1), pv_S0_grc(1), pv_S0_nw_grc(1), pv_S0_adj_grc(1), pv_S0_adj_nw_grc(1)] = Nested_Stats_S0(zehat1_grc, zehat2_grc, lam10, lam20_seq);
stat_grc(1,2) = S0_adj_grc;

% Portugal
[S0_prt(1), S0_nw_prt(1), S0_adj_prt(1), S0_adj_nw_prt(1), pv_S0_prt(1), pv_S0_nw_prt(1), pv_S0_adj_prt(1), pv_S0_adj_nw_prt(1)] = Nested_Stats_S0(zehat1_prt, zehat2_prt, lam10, lam20_seq);
stat_prt(1,2) = S0_adj_prt;

% Norway
[S0_nor(1), S0_nw_nor(1), S0_adj_nor(1), S0_adj_nw_nor(1), pv_S0_nor(1), pv_S0_nw_nor(1), pv_S0_adj_nor(1), pv_S0_adj_nw_nor(1)] = Nested_Stats_S0(zehat1_nor, zehat2_nor, lam10, lam20_seq);
stat_nor(1,2) = S0_adj_nor;

% South Korea
[S0_kor(1), S0_nw_kor(1), S0_adj_kor(1), S0_adj_nw_kor(1), pv_S0_kor(1), pv_S0_nw_kor(1), pv_S0_adj_kor(1), pv_S0_adj_nw_kor(1)] = Nested_Stats_S0(zehat1_kor, zehat2_kor, lam10, lam20_seq);
stat_kor(1,2) = S0_adj_kor;

% Denmark
[S0_dnk(1), S0_nw_dnk(1), S0_adj_dnk(1), S0_adj_nw_dnk(1), pv_S0_dnk(1), pv_S0_nw_dnk(1), pv_S0_adj_dnk(1), pv_S0_adj_nw_dnk(1)] = Nested_Stats_S0(zehat1_dnk, zehat2_dnk, lam10, lam20_seq);
stat_dnk(1,2) = S0_adj_dnk;

% Sweden
[S0_swe(1), S0_nw_swe(1), S0_adj_swe(1), S0_adj_nw_swe(1), pv_S0_swe(1), pv_S0_nw_swe(1), pv_S0_adj_swe(1), pv_S0_adj_nw_swe(1)] = Nested_Stats_S0(zehat1_swe, zehat2_swe, lam10, lam20_seq);
stat_swe(1,2) = S0_adj_swe;

% Australia
[S0_aus(1), S0_nw_aus(1), S0_adj_aus(1), S0_adj_nw_aus(1), pv_S0_aus(1), pv_S0_nw_aus(1), pv_S0_adj_aus(1), pv_S0_adj_nw_aus(1)] = Nested_Stats_S0(zehat1_aus, zehat2_aus, lam10, lam20_seq);
stat_aus(1,2) = S0_adj_aus;

% Austria
[S0_aut(1), S0_nw_aut(1), S0_adj_aut(1), S0_adj_nw_aut(1), pv_S0_aut(1), pv_S0_nw_aut(1), pv_S0_adj_aut(1), pv_S0_adj_nw_aut(1)] = Nested_Stats_S0(zehat1_aut, zehat2_aut, lam10, lam20_seq);
stat_aut(1,2) = S0_adj_aut;

% Belgium
[S0_bel(1), S0_nw_bel(1), S0_adj_bel(1), S0_adj_nw_bel(1), pv_S0_bel(1), pv_S0_nw_bel(1), pv_S0_adj_bel(1), pv_S0_adj_nw_bel(1)] = Nested_Stats_S0(zehat1_bel, zehat2_bel, lam10, lam20_seq);
stat_bel(1,2) = S0_adj_bel;

% Switzerland
[S0_che(1), S0_nw_che(1), S0_adj_che(1), S0_adj_nw_che(1), pv_S0_che(1), pv_S0_nw_che(1), pv_S0_adj_che(1), pv_S0_adj_nw_che(1)] = Nested_Stats_S0(zehat1_che, zehat2_che, lam10, lam20_seq);
stat_che(1,2) = S0_adj_che;



%FORECAST ACCURACY g3
lam20_seq = 0.6;
tauvec = 0.80;

% USA
[Sbar_usa(1), Sbar_nw_usa(1), Sbar_adj_usa(1), Sbar_adj_nw_usa(1), pv_Sbar_usa(1), pv_Sbar_nw_usa(1), pv_Sbar_adj_usa(1), pv_Sbar_adj_nw_usa(1)] = Nested_Stats_Sbar(zehat1_usa, zehat2_usa, lam20_seq, tauvec);
stat_usa(1,3) = Sbar_adj_usa;

% UK
[Sbar_gbr(1), Sbar_nw_gbr(1), Sbar_adj_gbr(1), Sbar_adj_nw_gbr(1), pv_Sbar_gbr(1), pv_Sbar_nw_gbr(1), pv_Sbar_adj_gbr(1), pv_Sbar_adj_nw_gbr(1)] = Nested_Stats_Sbar(zehat1_gbr, zehat2_gbr, lam20_seq, tauvec);
stat_gbr(1,3) = Sbar_adj_gbr;

% Japan
[Sbar_jpn(1), Sbar_nw_jpn(1), Sbar_adj_jpn(1), Sbar_adj_nw_jpn(1), pv_Sbar_jpn(1), pv_Sbar_nw_jpn(1), pv_Sbar_adj_jpn(1), pv_Sbar_adj_nw_jpn(1)] = Nested_Stats_Sbar(zehat1_jpn, zehat2_jpn, lam20_seq, tauvec);
stat_jpn(1,3) = Sbar_adj_jpn;

% France
[Sbar_fra(1), Sbar_nw_fra(1), Sbar_adj_fra(1), Sbar_adj_nw_fra(1), pv_Sbar_fra(1), pv_Sbar_nw_fra(1), pv_Sbar_adj_fra(1), pv_Sbar_adj_nw_fra(1)] = Nested_Stats_Sbar(zehat1_fra, zehat2_fra, lam20_seq, tauvec);
stat_fra(1,3) = Sbar_adj_fra;

% Germany
[Sbar_deu(1), Sbar_nw_deu(1), Sbar_adj_deu(1), Sbar_adj_nw_deu(1), pv_Sbar_deu(1), pv_Sbar_nw_deu(1), pv_Sbar_adj_deu(1), pv_Sbar_adj_nw_deu(1)] = Nested_Stats_Sbar(zehat1_deu, zehat2_deu, lam20_seq, tauvec);
stat_deu(1,3) = Sbar_adj_deu;

% Spain
[Sbar_esp(1), Sbar_nw_esp(1), Sbar_adj_esp(1), Sbar_adj_nw_esp(1), pv_Sbar_esp(1), pv_Sbar_nw_esp(1), pv_Sbar_adj_esp(1), pv_Sbar_adj_nw_esp(1)] = Nested_Stats_Sbar(zehat1_esp, zehat2_esp, lam20_seq, tauvec);
stat_esp(1,3) = Sbar_adj_esp;

% Italy
[Sbar_ita(1), Sbar_nw_ita(1), Sbar_adj_ita(1), Sbar_adj_nw_ita(1), pv_Sbar_ita(1), pv_Sbar_nw_ita(1), pv_Sbar_adj_ita(1), pv_Sbar_adj_nw_ita(1)] = Nested_Stats_Sbar(zehat1_ita, zehat2_ita, lam20_seq, tauvec);
stat_ita(1,3) = Sbar_adj_ita;

% Netherlands
[Sbar_nld(1), Sbar_nw_nld(1), Sbar_adj_nld(1), Sbar_adj_nw_nld(1), pv_Sbar_nld(1), pv_Sbar_nw_nld(1), pv_Sbar_adj_nld(1), pv_Sbar_adj_nw_nld(1)] = Nested_Stats_Sbar(zehat1_nld, zehat2_nld, lam20_seq, tauvec);
stat_nld(1,3) = Sbar_adj_nld;

% Luxembourg
[Sbar_lux(1), Sbar_nw_lux(1), Sbar_adj_lux(1), Sbar_adj_nw_lux(1), pv_Sbar_lux(1), pv_Sbar_nw_lux(1), pv_Sbar_adj_lux(1), pv_Sbar_adj_nw_lux(1)] = Nested_Stats_Sbar(zehat1_lux, zehat2_lux, lam20_seq, tauvec);
stat_lux(1,3) = Sbar_adj_lux;

% Canada
[Sbar_can(1), Sbar_nw_can(1), Sbar_adj_can(1), Sbar_adj_nw_can(1), pv_Sbar_can(1), pv_Sbar_nw_can(1), pv_Sbar_adj_can(1), pv_Sbar_adj_nw_can(1)] = Nested_Stats_Sbar(zehat1_can, zehat2_can, lam20_seq, tauvec);
stat_can(1,3) = Sbar_adj_can;

% Ireland
[Sbar_irl(1), Sbar_nw_irl(1), Sbar_adj_irl(1), Sbar_adj_nw_irl(1), pv_Sbar_irl(1), pv_Sbar_nw_irl(1), pv_Sbar_adj_irl(1), pv_Sbar_adj_nw_irl(1)] = Nested_Stats_Sbar(zehat1_irl, zehat2_irl, lam20_seq, tauvec);
stat_irl(1,3) = Sbar_adj_irl;

% Finland
[Sbar_fin(1), Sbar_nw_fin(1), Sbar_adj_fin(1), Sbar_adj_nw_fin(1), pv_Sbar_fin(1), pv_Sbar_nw_fin(1), pv_Sbar_adj_fin(1), pv_Sbar_adj_nw_fin(1)] = Nested_Stats_Sbar(zehat1_fin, zehat2_fin, lam20_seq, tauvec);
stat_fin(1,3) = Sbar_adj_fin;

% New Zealand
[Sbar_nzl(1), Sbar_nw_nzl(1), Sbar_adj_nzl(1), Sbar_adj_nw_nzl(1), pv_Sbar_nzl(1), pv_Sbar_nw_nzl(1), pv_Sbar_adj_nzl(1), pv_Sbar_adj_nw_nzl(1)] = Nested_Stats_Sbar(zehat1_nzl, zehat2_nzl, lam20_seq, tauvec);
stat_nzl(1,3) = Sbar_adj_nzl;

% Greece
[Sbar_grc(1), Sbar_nw_grc(1), Sbar_adj_grc(1), Sbar_adj_nw_grc(1), pv_Sbar_grc(1), pv_Sbar_nw_grc(1), pv_Sbar_adj_grc(1), pv_Sbar_adj_nw_grc(1)] = Nested_Stats_Sbar(zehat1_grc, zehat2_grc, lam20_seq, tauvec);
stat_grc(1,3) = Sbar_adj_grc;

% Portugal
[Sbar_prt(1), Sbar_nw_prt(1), Sbar_adj_prt(1), Sbar_adj_nw_prt(1), pv_Sbar_prt(1), pv_Sbar_nw_prt(1), pv_Sbar_adj_prt(1), pv_Sbar_adj_nw_prt(1)] = Nested_Stats_Sbar(zehat1_prt, zehat2_prt, lam20_seq, tauvec);
stat_prt(1,3) = Sbar_adj_prt;

% Norway
[Sbar_nor(1), Sbar_nw_nor(1), Sbar_adj_nor(1), Sbar_adj_nw_nor(1), pv_Sbar_nor(1), pv_Sbar_nw_nor(1), pv_Sbar_adj_nor(1), pv_Sbar_adj_nw_nor(1)] = Nested_Stats_Sbar(zehat1_nor, zehat2_nor, lam20_seq, tauvec);
stat_nor(1,3) = Sbar_adj_nor;

% South Korea
[Sbar_kor(1), Sbar_nw_kor(1), Sbar_adj_kor(1), Sbar_adj_nw_kor(1), pv_Sbar_kor(1), pv_Sbar_nw_kor(1), pv_Sbar_adj_kor(1), pv_Sbar_adj_nw_kor(1)] = Nested_Stats_Sbar(zehat1_kor, zehat2_kor, lam20_seq, tauvec);
stat_kor(1,3) = Sbar_adj_kor;

% Denmark
[Sbar_dnk(1), Sbar_nw_dnk(1), Sbar_adj_dnk(1), Sbar_adj_nw_dnk(1), pv_Sbar_dnk(1), pv_Sbar_nw_dnk(1), pv_Sbar_adj_dnk(1), pv_Sbar_adj_nw_dnk(1)] = Nested_Stats_Sbar(zehat1_dnk, zehat2_dnk, lam20_seq, tauvec);
stat_dnk(1,3) = Sbar_adj_dnk;

% Sweden
[Sbar_swe(1), Sbar_nw_swe(1), Sbar_adj_swe(1), Sbar_adj_nw_swe(1), pv_Sbar_swe(1), pv_Sbar_nw_swe(1), pv_Sbar_adj_swe(1), pv_Sbar_adj_nw_swe(1)] = Nested_Stats_Sbar(zehat1_swe, zehat2_swe, lam20_seq, tauvec);
stat_swe(1,3) = Sbar_adj_swe;

% Australia
[Sbar_aus(1), Sbar_nw_aus(1), Sbar_adj_aus(1), Sbar_adj_nw_aus(1), pv_Sbar_aus(1), pv_Sbar_nw_aus(1), pv_Sbar_adj_aus(1), pv_Sbar_adj_nw_aus(1)] = Nested_Stats_Sbar(zehat1_aus, zehat2_aus, lam20_seq, tauvec);
stat_aus(1,3) = Sbar_adj_aus;

% Austria
[Sbar_aut(1), Sbar_nw_aut(1), Sbar_adj_aut(1), Sbar_adj_nw_aut(1), pv_Sbar_aut(1), pv_Sbar_nw_aut(1), pv_Sbar_adj_aut(1), pv_Sbar_adj_nw_aut(1)] = Nested_Stats_Sbar(zehat1_aut, zehat2_aut, lam20_seq, tauvec);
stat_aut(1,3) = Sbar_adj_aut;

% Belgium
[Sbar_bel(1), Sbar_nw_bel(1), Sbar_adj_bel(1), Sbar_adj_nw_bel(1), pv_Sbar_bel(1), pv_Sbar_nw_bel(1), pv_Sbar_adj_bel(1), pv_Sbar_adj_nw_bel(1)] = Nested_Stats_Sbar(zehat1_bel, zehat2_bel, lam20_seq, tauvec);
stat_bel(1,3) = Sbar_adj_bel;

% Switzerland
[Sbar_che(1), Sbar_nw_che(1), Sbar_adj_che(1), Sbar_adj_nw_che(1), pv_Sbar_che(1), pv_Sbar_nw_che(1), pv_Sbar_adj_che(1), pv_Sbar_adj_nw_che(1)] = Nested_Stats_Sbar(zehat1_che, zehat2_che, lam20_seq, tauvec);
stat_che(1,3) = Sbar_adj_che;


%FORECAST ACCURACY g4
lam20_seq = 0.5;
tauvec = 0.80;

% USA
[Sbar_g4_usa(1), Sbar_g4_nw_usa(1), Sbar_g4_adj_usa(1), Sbar_g4_adj_nw_usa(1), pv_Sbar_g4_usa(1), pv_Sbar_g4_nw_usa(1), pv_Sbar_g4_adj_usa(1), pv_g4_Sbar_adj_nw_usa(1)] = Nested_Stats_Sbar_g4(zehat1_usa, zehat2_usa, lam20_seq, tauvec);
stat_usa(1,4) = Sbar_g4_adj_usa;

% UK
[Sbar_g4_gbr(1), Sbar_g4_nw_gbr(1), Sbar_g4_adj_gbr(1), Sbar_g4_adj_nw_gbr(1), pv_Sbar_g4_gbr(1), pv_Sbar_g4_nw_gbr(1), pv_Sbar_g4_adj_gbr(1), pv_g4_Sbar_adj_nw_gbr(1)] = Nested_Stats_Sbar_g4(zehat1_gbr, zehat2_gbr, lam20_seq, tauvec);
stat_gbr(1,4) = Sbar_g4_adj_gbr;

% Japan
[Sbar_g4_jpn(1), Sbar_g4_nw_jpn(1), Sbar_g4_adj_jpn(1), Sbar_g4_adj_nw_jpn(1), pv_Sbar_g4_jpn(1), pv_Sbar_g4_nw_jpn(1), pv_Sbar_g4_adj_jpn(1), pv_g4_Sbar_adj_nw_jpn(1)] = Nested_Stats_Sbar_g4(zehat1_jpn, zehat2_jpn, lam20_seq, tauvec);
stat_jpn(1,4) = Sbar_g4_adj_jpn;

% France
[Sbar_g4_fra(1), Sbar_g4_nw_fra(1), Sbar_g4_adj_fra(1), Sbar_g4_adj_nw_fra(1), pv_Sbar_g4_fra(1), pv_Sbar_g4_nw_fra(1), pv_Sbar_g4_adj_fra(1), pv_g4_Sbar_adj_nw_fra(1)] = Nested_Stats_Sbar_g4(zehat1_fra, zehat2_fra, lam20_seq, tauvec);
stat_fra(1,4) = Sbar_g4_adj_fra;

% Germany
[Sbar_g4_deu(1), Sbar_g4_nw_deu(1), Sbar_g4_adj_deu(1), Sbar_g4_adj_nw_deu(1), pv_Sbar_g4_deu(1), pv_Sbar_g4_nw_deu(1), pv_Sbar_g4_adj_deu(1), pv_g4_Sbar_adj_nw_deu(1)] = Nested_Stats_Sbar_g4(zehat1_deu, zehat2_deu, lam20_seq, tauvec);
stat_deu(1,4) = Sbar_g4_adj_deu;

% Spain
[Sbar_g4_esp(1), Sbar_g4_nw_esp(1), Sbar_g4_adj_esp(1), Sbar_g4_adj_nw_esp(1), pv_Sbar_g4_esp(1), pv_Sbar_g4_nw_esp(1), pv_Sbar_g4_adj_esp(1), pv_g4_Sbar_adj_nw_esp(1)] = Nested_Stats_Sbar_g4(zehat1_esp, zehat2_esp, lam20_seq, tauvec);
stat_esp(1,4) = Sbar_g4_adj_esp;

% Italy
[Sbar_g4_ita(1), Sbar_g4_nw_ita(1), Sbar_g4_adj_ita(1), Sbar_g4_adj_nw_ita(1), pv_Sbar_g4_ita(1), pv_Sbar_g4_nw_ita(1), pv_Sbar_g4_adj_ita(1), pv_g4_Sbar_adj_nw_ita(1)] = Nested_Stats_Sbar_g4(zehat1_ita, zehat2_ita, lam20_seq, tauvec);
stat_ita(1,4) = Sbar_g4_adj_ita;

% Netherlands
[Sbar_g4_nld(1), Sbar_g4_nw_nld(1), Sbar_g4_adj_nld(1), Sbar_g4_adj_nw_nld(1), pv_Sbar_g4_nld(1), pv_Sbar_g4_nw_nld(1), pv_Sbar_g4_adj_nld(1), pv_g4_Sbar_adj_nw_nld(1)] = Nested_Stats_Sbar_g4(zehat1_nld, zehat2_nld, lam20_seq, tauvec);
stat_nld(1,4) = Sbar_g4_adj_nld;

% Luxembourg
[Sbar_g4_lux(1), Sbar_g4_nw_lux(1), Sbar_g4_adj_lux(1), Sbar_g4_adj_nw_lux(1), pv_Sbar_g4_lux(1), pv_Sbar_g4_nw_lux(1), pv_Sbar_g4_adj_lux(1), pv_g4_Sbar_adj_nw_lux(1)] = Nested_Stats_Sbar_g4(zehat1_lux, zehat2_lux, lam20_seq, tauvec);
stat_lux(1,4) = Sbar_g4_adj_lux;

% Canada
[Sbar_g4_can(1), Sbar_g4_nw_can(1), Sbar_g4_adj_can(1), Sbar_g4_adj_nw_can(1), pv_Sbar_g4_can(1), pv_Sbar_g4_nw_can(1), pv_Sbar_g4_adj_can(1), pv_g4_Sbar_adj_nw_can(1)] = Nested_Stats_Sbar_g4(zehat1_can, zehat2_can, lam20_seq, tauvec);
stat_can(1,4) = Sbar_g4_adj_can;

% Ireland
[Sbar_g4_irl(1), Sbar_g4_nw_irl(1), Sbar_g4_adj_irl(1), Sbar_g4_adj_nw_irl(1), pv_Sbar_g4_irl(1), pv_Sbar_g4_nw_irl(1), pv_Sbar_g4_adj_irl(1), pv_g4_Sbar_adj_nw_irl(1)] = Nested_Stats_Sbar_g4(zehat1_irl, zehat2_irl, lam20_seq, tauvec);
stat_irl(1,4) = Sbar_g4_adj_irl;

% Finland
[Sbar_g4_fin(1), Sbar_g4_nw_fin(1), Sbar_g4_adj_fin(1), Sbar_g4_adj_nw_fin(1), pv_Sbar_g4_fin(1), pv_Sbar_g4_nw_fin(1), pv_Sbar_g4_adj_fin(1), pv_g4_Sbar_adj_nw_fin(1)] = Nested_Stats_Sbar_g4(zehat1_fin, zehat2_fin, lam20_seq, tauvec);
stat_fin(1,4) = Sbar_g4_adj_fin;

% New Zealand
[Sbar_g4_nzl(1), Sbar_g4_nw_nzl(1), Sbar_g4_adj_nzl(1), Sbar_g4_adj_nw_nzl(1), pv_Sbar_g4_nzl(1), pv_Sbar_g4_nw_nzl(1), pv_Sbar_g4_adj_nzl(1), pv_g4_Sbar_adj_nw_nzl(1)] = Nested_Stats_Sbar_g4(zehat1_nzl, zehat2_nzl, lam20_seq, tauvec);
stat_nzl(1,4) = Sbar_g4_adj_nzl;

% Greece
[Sbar_g4_grc(1), Sbar_g4_nw_grc(1), Sbar_g4_adj_grc(1), Sbar_g4_adj_nw_grc(1), pv_Sbar_g4_grc(1), pv_Sbar_g4_nw_grc(1), pv_Sbar_g4_adj_grc(1), pv_g4_Sbar_adj_nw_grc(1)] = Nested_Stats_Sbar_g4(zehat1_grc, zehat2_grc, lam20_seq, tauvec);
stat_grc(1,4) = Sbar_g4_adj_grc;

% Portugal
[Sbar_g4_prt(1), Sbar_g4_nw_prt(1), Sbar_g4_adj_prt(1), Sbar_g4_adj_nw_prt(1), pv_Sbar_g4_prt(1), pv_Sbar_g4_nw_prt(1), pv_Sbar_g4_adj_prt(1), pv_g4_Sbar_adj_nw_prt(1)] = Nested_Stats_Sbar_g4(zehat1_prt, zehat2_prt, lam20_seq, tauvec);
stat_prt(1,4) = Sbar_g4_adj_prt;

% Norway
[Sbar_g4_nor(1), Sbar_g4_nw_nor(1), Sbar_g4_adj_nor(1), Sbar_g4_adj_nw_nor(1), pv_Sbar_g4_nor(1), pv_Sbar_g4_nw_nor(1), pv_Sbar_g4_adj_nor(1), pv_g4_Sbar_adj_nw_nor(1)] = Nested_Stats_Sbar_g4(zehat1_nor, zehat2_nor, lam20_seq, tauvec);
stat_nor(1,4) = Sbar_g4_adj_nor;

% South Korea
[Sbar_g4_kor(1), Sbar_g4_nw_kor(1), Sbar_g4_adj_kor(1), Sbar_g4_adj_nw_kor(1), pv_Sbar_g4_kor(1), pv_Sbar_g4_nw_kor(1), pv_Sbar_g4_adj_kor(1), pv_g4_Sbar_adj_nw_kor(1)] = Nested_Stats_Sbar_g4(zehat1_kor, zehat2_kor, lam20_seq, tauvec);
stat_kor(1,4) = Sbar_g4_adj_kor;

% Denmark
[Sbar_g4_dnk(1), Sbar_g4_nw_dnk(1), Sbar_g4_adj_dnk(1), Sbar_g4_adj_nw_dnk(1), pv_Sbar_g4_dnk(1), pv_Sbar_g4_nw_dnk(1), pv_Sbar_g4_adj_dnk(1), pv_g4_Sbar_adj_nw_dnk(1)] = Nested_Stats_Sbar_g4(zehat1_dnk, zehat2_dnk, lam20_seq, tauvec);
stat_dnk(1,4) = Sbar_g4_adj_dnk;

% Sweden
[Sbar_g4_swe(1), Sbar_g4_nw_swe(1), Sbar_g4_adj_swe(1), Sbar_g4_adj_nw_swe(1), pv_Sbar_g4_swe(1), pv_Sbar_g4_nw_swe(1), pv_Sbar_g4_adj_swe(1), pv_g4_Sbar_adj_nw_swe(1)] = Nested_Stats_Sbar_g4(zehat1_swe, zehat2_swe, lam20_seq, tauvec);
stat_swe(1,4) = Sbar_g4_adj_swe;

% Australia
[Sbar_g4_aus(1), Sbar_g4_nw_aus(1), Sbar_g4_adj_aus(1), Sbar_g4_adj_nw_aus(1), pv_Sbar_g4_aus(1), pv_Sbar_g4_nw_aus(1), pv_Sbar_g4_adj_aus(1), pv_g4_Sbar_adj_nw_aus(1)] = Nested_Stats_Sbar_g4(zehat1_aus, zehat2_aus, lam20_seq, tauvec);
stat_aus(1,4) = Sbar_g4_adj_aus;

% Austria
[Sbar_g4_aut(1), Sbar_g4_nw_aut(1), Sbar_g4_adj_aut(1), Sbar_g4_adj_nw_aut(1), pv_Sbar_g4_aut(1), pv_Sbar_g4_nw_aut(1), pv_Sbar_g4_adj_aut(1), pv_g4_Sbar_adj_nw_aut(1)] = Nested_Stats_Sbar_g4(zehat1_aut, zehat2_aut, lam20_seq, tauvec);
stat_aut(1,4) = Sbar_g4_adj_aut;

% Belgium
[Sbar_g4_bel(1), Sbar_g4_nw_bel(1), Sbar_g4_adj_bel(1), Sbar_g4_adj_nw_bel(1), pv_Sbar_g4_bel(1), pv_Sbar_g4_nw_bel(1), pv_Sbar_g4_adj_bel(1), pv_g4_Sbar_adj_nw_bel(1)] = Nested_Stats_Sbar_g4(zehat1_bel, zehat2_bel, lam20_seq, tauvec);
stat_bel(1,4) = Sbar_g4_adj_bel;

% Switzerland
[Sbar_g4_che(1), Sbar_g4_nw_che(1), Sbar_g4_adj_che(1), Sbar_g4_adj_nw_che(1), pv_Sbar_g4_che(1), pv_Sbar_g4_nw_che(1), pv_Sbar_g4_adj_che(1), pv_g4_Sbar_adj_nw_che(1)] = Nested_Stats_Sbar_g4(zehat1_che, zehat2_che, lam20_seq, tauvec);
stat_che(1,4) = Sbar_g4_adj_che;


%%%%%%%%%%%%%%%%%%%%
pval_usa = normcdf(stat_usa,0,1,'upper')
pval_gbr = normcdf(stat_gbr,0,1,'upper')
pval_jpn = normcdf(stat_jpn,0,1,'upper')
pval_fra = normcdf(stat_fra,0,1,'upper')
pval_deu = normcdf(stat_deu,0,1,'upper')
pval_esp = normcdf(stat_esp,0,1,'upper')
pval_ita = normcdf(stat_ita,0,1,'upper')
pval_nld = normcdf(stat_nld,0,1,'upper')
pval_lux = normcdf(stat_lux,0,1,'upper')
pval_can = normcdf(stat_can,0,1,'upper')
pval_irl = normcdf(stat_irl,0,1,'upper')
pval_fin = normcdf(stat_fin,0,1,'upper')
pval_nzl = normcdf(stat_nzl,0,1,'upper')
pval_grc = normcdf(stat_grc,0,1,'upper')
pval_prt = normcdf(stat_prt,0,1,'upper')
pval_nor = normcdf(stat_nor,0,1,'upper')
pval_kor = normcdf(stat_kor,0,1,'upper')
pval_dnk = normcdf(stat_dnk,0,1,'upper')
pval_swe = normcdf(stat_swe,0,1,'upper')
pval_aus = normcdf(stat_aus,0,1,'upper')
pval_aut = normcdf(stat_aut,0,1,'upper')
pval_bel = normcdf(stat_bel,0,1,'upper')
pval_che = normcdf(stat_che,0,1,'upper')


vec1 = ["usa",pval_usa;"gbr",pval_gbr;"jpn",pval_jpn;"fra",pval_fra;"deu",pval_deu;"esp",pval_esp;"ita",pval_ita;"nld",pval_nld];
vec2 = ["lux",pval_lux;"can",pval_can;"irl",pval_irl;"fin",pval_fin;"nzl",pval_nzl];
vec3 = ["grc",pval_grc;"prt",pval_prt;"nor",pval_nor;"kor",pval_kor;"dnk",pval_dnk];
vec4 = ["swe",pval_swe;"aus",pval_aus;"aut",pval_aut;"bel",pval_bel;"che",pval_che];

encompass_Q_stats = [vec1;vec2;vec3;vec4]

rmserat_usa = [sqrt(zehat2_usa'*zehat2_usa/nehat)/sqrt(zehat1_usa'*zehat1_usa/nehat)];
rmserat_gbr = [sqrt(zehat2_gbr'*zehat2_gbr/nehat)/sqrt(zehat1_gbr'*zehat1_gbr/nehat)];
rmserat_jpn = [sqrt(zehat2_jpn'*zehat2_jpn/nehat)/sqrt(zehat1_jpn'*zehat1_jpn/nehat)];
rmserat_fra = [sqrt(zehat2_fra'*zehat2_fra/nehat)/sqrt(zehat1_fra'*zehat1_fra/nehat)];
rmserat_deu = [sqrt(zehat2_deu'*zehat2_deu/nehat)/sqrt(zehat1_deu'*zehat1_deu/nehat)];
rmserat_esp = [sqrt(zehat2_esp'*zehat2_esp/nehat)/sqrt(zehat1_esp'*zehat1_esp/nehat)];
rmserat_ita = [sqrt(zehat2_ita'*zehat2_ita/nehat)/sqrt(zehat1_ita'*zehat1_ita/nehat)];
rmserat_nld = [sqrt(zehat2_nld'*zehat2_nld/nehat)/sqrt(zehat1_nld'*zehat1_nld/nehat)];
rmserat_lux = [sqrt(zehat2_lux'*zehat2_lux/nehat)/sqrt(zehat1_lux'*zehat1_lux/nehat)];
rmserat_can = [sqrt(zehat2_can'*zehat2_can/nehat)/sqrt(zehat1_can'*zehat1_can/nehat)];
rmserat_irl = [sqrt(zehat2_irl'*zehat2_irl/nehat)/sqrt(zehat1_irl'*zehat1_irl/nehat)];
rmserat_fin = [sqrt(zehat2_fin'*zehat2_fin/nehat)/sqrt(zehat1_fin'*zehat1_fin/nehat)];
rmserat_nzl = [sqrt(zehat2_nzl'*zehat2_nzl/nehat)/sqrt(zehat1_nzl'*zehat1_nzl/nehat)];
rmserat_grc = [sqrt(zehat2_grc'*zehat2_grc/nehat)/sqrt(zehat1_grc'*zehat1_grc/nehat)];
rmserat_prt = [sqrt(zehat2_prt'*zehat2_prt/nehat)/sqrt(zehat1_prt'*zehat1_prt/nehat)];
rmserat_nor = [sqrt(zehat2_nor'*zehat2_nor/nehat)/sqrt(zehat1_nor'*zehat1_nor/nehat)];
rmserat_kor = [sqrt(zehat2_kor'*zehat2_kor/nehat)/sqrt(zehat1_kor'*zehat1_kor/nehat)];
rmserat_dnk = [sqrt(zehat2_dnk'*zehat2_dnk/nehat)/sqrt(zehat1_dnk'*zehat1_dnk/nehat)];
rmserat_swe = [sqrt(zehat2_swe'*zehat2_swe/nehat)/sqrt(zehat1_swe'*zehat1_swe/nehat)];
rmserat_aus = [sqrt(zehat2_aus'*zehat2_aus/nehat)/sqrt(zehat1_aus'*zehat1_aus/nehat)];
rmserat_aut = [sqrt(zehat2_aut'*zehat2_aut/nehat)/sqrt(zehat1_aut'*zehat1_aut/nehat)];
rmserat_bel = [sqrt(zehat2_bel'*zehat2_bel/nehat)/sqrt(zehat1_bel'*zehat1_bel/nehat)];
rmserat_che = [sqrt(zehat2_che'*zehat2_che/nehat)/sqrt(zehat1_che'*zehat1_che/nehat)];


rec1 = ["usa",rmserat_usa;"gbr",rmserat_gbr;"jpn",rmserat_jpn;"fra",rmserat_fra;"deu",rmserat_deu;"esp",rmserat_esp;"ita",rmserat_ita;"nld",rmserat_nld];
rec2 = ["lux",rmserat_lux;"can",rmserat_can;"irl",rmserat_irl;"fin",rmserat_fin;"nzl",rmserat_nzl];
rec3 = ["grc",rmserat_grc;"prt",rmserat_prt;"nor",rmserat_nor;"kor",rmserat_kor;"dnk",rmserat_dnk];
rec4 = ["swe",rmserat_swe;"aus",rmserat_aus;"aut",rmserat_aut;"bel",rmserat_bel;"che",rmserat_che];

rmse_ratios_Q = [rec1;rec2;rec3;rec4];

%xlswrite('HCPIout_AH1.xlsx',rmse_ratios_Q,'rmse-ratios-Q-biclags','A1');
%xlswrite('HCPIout_AH2.xlsx',encompass_Q_stats,'encompass-Q-biclags','A1');


