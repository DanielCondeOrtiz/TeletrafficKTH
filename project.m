p_l = [0:0.001:1];

K=10;
F_0 = 45e9;
m=15;
mu_d = 1/(1e6);
mu_l = 1/(0.5e9);
F = 0.6e9;
R = 4e6;

%% 3.2.1.1
p_l = [0:0.001:1];
arrival_mu = F*mu_l./p_l;
arrival_cloud = mu_l*F_0./(K.*(1-p_l));
arrival_trans = mu_d*R./(1-p_l);

figure(1)
plot(p_l,arrival_mu)
hold on
plot(p_l,arrival_trans)
plot(p_l,arrival_cloud)

legend('\lambda_{max} MU', '\lambda_{max} Transmission', '\lambda_{max} Cloud', 'Location','north')
xlabel('p_l')
ylabel('Max arrival rate \lambda_{max}')
axis([0 1 0 100])

hold off

%% 3.2.1.2
p_l = [0:0.1:1];
arrival_mu = F*mu_l./p_l;
arrival_cloud = mu_l*F_0./(K.*(1-p_l));
arrival_trans = mu_d*R./(1-p_l);

arrival_1 = min(arrival_mu,arrival_cloud);
arrival_2 = min(min(arrival_mu,arrival_cloud), arrival_trans);

figure(2)
plot(p_l,arrival_1)
hold on
plot(p_l,arrival_2)

legend('\lambda_{max} model 1', '\lambda_{max} model 2')
xlabel('p_l')
ylabel('Max arrival rate \lambda_{max}')

hold off


%% 3.2.2.1
lambda = [0.1:0.1:1.5];
p_l = 0.2;

N_1_1 = [];
N_2_1 = [];

for lamb = lambda

    rho_local = lamb.*p_l/(mu_l*F);
    rho_cloud = m*K .*lamb*(1-p_l)/(mu_l*F_0);
    rho_trans = lamb.*(1-p_l)/(mu_d*R);

    N_1_1 = [N_1_1,(rho_local./(1-rho_local)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud.*(1-erlangb(m,rho_cloud))))/K];
    N_2_1 = [N_2_1,(rho_local./(1-rho_local)) + (rho_trans./(1-rho_trans)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud*(1-erlangb(m,rho_cloud))))/K];

end

figure(3)
plot(lambda,N_1_1,'b-')

hold on

plot(lambda,N_2_1,'b--')

p_l = 0.7;

N_1_2 = [];
N_2_2 = [];

for lamb = lambda

    rho_local = lamb.*p_l/(mu_l*F);
    rho_cloud = m*K .*lamb*(1-p_l)/(mu_l*F_0);
    rho_trans = lamb.*(1-p_l)/(mu_d*R);

    N_1_2 = [N_1_2,(rho_local./(1-rho_local)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud.*(1-erlangb(m,rho_cloud))))/K];
    N_2_2 = [N_2_2,(rho_local./(1-rho_local)) + (rho_trans./(1-rho_trans)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud*(1-erlangb(m,rho_cloud))))/K];

end
plot(lambda,N_1_2,'r-')
plot(lambda,N_2_2,'r--')

legend('Model 1, p_l=0.2' , 'Model 2, p_l=0.2', 'Model 1, p_l=0.7', 'Model 2, p_l=0.7', 'Location','northwest')
xlabel('\lambda')
ylabel('N_i')


hold off

%% 3.2.2.2
figure(4)
plot(lambda,N_1_1./lambda,'b-')

hold on

plot(lambda,N_2_1./lambda,'b--')


plot(lambda,N_1_2./lambda,'r-')
plot(lambda,N_2_2./lambda,'r--')

legend('Model 1, p_l=0.2' , 'Model 2, p_l=0.2', 'Model 1, p_l=0.7', 'Model 2, p_l=0.7', 'Location','northwest')
xlabel('\lambda')
ylabel('T_i')


hold off


%% 3.2.3.1
lambda = 1;
p_l_val = [0:0.1:1];
T_1_1 = [];
T_1_2 = [];
T_1_3 = [];
T_2_1 = [];
T_2_2 = [];
T_2_3 = [];

for p_l = p_l_val


    K=5;

    rho_local = lambda.*p_l/(mu_l*F);
    rho_cloud = m*K .*lambda.*(1-p_l)/(mu_l*F_0);
    rho_trans = lambda.*(1-p_l)/(mu_d*R);

    T_1_1 = [T_1_1,(rho_local./(1-rho_local)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud.*(1-erlangb(m,rho_cloud))))/K];
    T_2_1 = [T_2_1,(rho_local./(1-rho_local)) + (rho_trans./(1-rho_trans)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud*(1-erlangb(m,rho_cloud))))/K];
    
    K=15;

    rho_local = lambda.*p_l/(mu_l*F);
    rho_cloud = m*K .*lambda.*(1-p_l)/(mu_l*F_0);
    rho_trans = lambda.*(1-p_l)/(mu_d*R);

    T_1_2 = [T_1_2,(rho_local./(1-rho_local)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud.*(1-erlangb(m,rho_cloud))))/K];
    T_2_2 = [T_2_2,(rho_local./(1-rho_local)) + (rho_trans./(1-rho_trans)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud*(1-erlangb(m,rho_cloud))))/K];

    K=25;

    rho_local = lambda.*p_l/(mu_l*F);
    rho_cloud = m*K .*lambda.*(1-p_l)/(mu_l*F_0);
    rho_trans = lambda.*(1-p_l)/(mu_d*R);

    T_1_3 = [T_1_3,(rho_local./(1-rho_local)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud.*(1-erlangb(m,rho_cloud))))/K];
    T_2_3 = [T_2_3,(rho_local./(1-rho_local)) + (rho_trans./(1-rho_trans)) + rho_cloud/K + (rho_cloud./(m-rho_cloud)).*((m*erlangb(m,rho_cloud))./(m-rho_cloud*(1-erlangb(m,rho_cloud))))/K];
end

figure(5)
plot(p_l_val,T_1_1,'b-')

hold on

plot(p_l_val,T_1_2,'b--')
plot(p_l_val,T_1_3,'b:')
plot(p_l_val,T_2_1,'r-')
plot(p_l_val,T_2_2,'r--')
plot(p_l_val,T_2_3,'r:')



legend('Model 1, K=5' , 'Model 1, K=15','Model 1, K=25' , 'Model 2, K=5','Model 2, K=15' , 'Model 2, K=25', 'Location','northwest')
xlabel('p_l')
ylabel('T_i')

hold off



