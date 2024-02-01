
using Printf
using LinearAlgebra, DifferentialEquations, Plots, Infiltrator, Dates,Distributions
using ReverseDiff, Symbolics, Turing ,StatsPlots


######## Symbols for symbolic math calculations #########
@variables Xv Xt GLC GLN LAC AMM MAb t

@variables mu_max Kglc Kgln KIlac KIamm mu_dmax Kdamm Klysis Yxglc mglc Yxgln alpha1 alpha2 Kdgln Ylacglc Yammgln r1 r2 lambda

@variables P1_1 P1_2 P1_3 P1_4 P1_5 P1_6 P1_7
@variables P2_1 P2_2 P2_3 P2_4 P2_5 P2_6 P2_7
@variables P3_1 P3_2 P3_3 P3_4 P3_5 P3_6 P3_7
@variables P4_1 P4_2 P4_3 P4_4 P4_5 P4_6 P4_7
@variables P5_1 P5_2 P5_3 P5_4 P5_5 P5_6 P5_7
@variables P6_1 P6_2 P6_3 P6_4 P6_5 P6_6 P6_7
@variables P7_1 P7_2 P7_3 P7_4 P7_5 P7_6 P7_7

P = [P1_1 P1_2 P1_3 P1_4 P1_5 P1_6 P1_7;
    P2_1 P2_2 P2_3 P2_4 P2_5 P2_6 P2_7;
    P3_1 P3_2 P3_3 P3_4 P3_5 P3_6 P3_7;
    P4_1 P4_2 P4_3 P4_4 P4_5 P4_6 P4_7;
    P5_1 P5_2 P5_3 P5_4 P5_5 P5_6 P5_7;
    P6_1 P6_2 P6_3 P6_4 P6_5 P6_6 P6_7;
    P7_1 P7_2 P7_3 P7_4 P7_5 P7_6 P7_7]

# P = Diagonal([P1_1,P2_2,P3_3,P4_4,P5_5,P6_6,P7_7]) # Initial Process Estimation / Initial Estimation Error Covariance Matrix


    # global P = [P1_1 P1_2 P1_3 P1_4 P1_5 P1_6 P1_7;
    #     P2_1 P2_2 P2_3 P2_4 P2_5 P2_6 P2_7;
    #     P3_1 P3_2 P3_3 P3_4 P3_5 P3_6 P3_7;
    #     P4_1 P4_2 P4_3 P4_4 P4_5 P4_6 P4_7;
    #     P5_1 P5_2 P5_3 P5_4 P5_5 P5_6 P5_7;
    #     P6_1 P6_2 P6_3 P6_4 P6_5 P6_6 P6_7;
    #     P7_1 P7_2 P7_3 P7_4 P7_5 P7_6 P7_7]

@variables Q1_1 Q1_2 Q1_3 Q1_4 Q1_5 Q1_6 Q1_7
@variables Q2_1 Q2_2 Q2_3 Q2_4 Q2_5 Q2_6 Q2_7
@variables Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7
@variables Q4_1 Q4_2 Q4_3 Q4_4 Q4_5 Q4_6 Q4_7
@variables Q5_1 Q5_2 Q5_3 Q5_4 Q5_5 Q5_6 Q5_7
@variables Q6_1 Q6_2 Q6_3 Q6_4 Q6_5 Q6_6 Q6_7
@variables Q7_1 Q7_2 Q7_3 Q7_4 Q7_5 Q7_6 Q7_7

Qv = [Q1_1 Q1_2 Q1_3 Q1_4 Q1_5 Q1_6 Q1_7;
    Q2_1 Q2_2 Q2_3 Q2_4 Q2_5 Q2_6 Q2_7;
    Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7;
    Q4_1 Q4_2 Q4_3 Q4_4 Q4_5 Q4_6 Q4_7;
    Q5_1 Q5_2 Q5_3 Q5_4 Q5_5 Q5_6 Q5_7;
    Q6_1 Q6_2 Q6_3 Q6_4 Q6_5 Q6_6 Q6_7;
    Q7_1 Q7_2 Q7_3 Q7_4 Q7_5 Q7_6 Q7_7]

Qv = Diagonal([Q1_1,Q2_2,Q3_3,Q4_4,Q5_5,Q6_6,Q7_7]) # Initial Process Estimation / Initial Estimation Error Covariance Matrix


############# Process model ##############


#Monod terms
mu = mu_max*(GLC/(Kglc+GLC))*(GLN/(Kgln+GLN))*(KIlac/(KIlac+LAC))*(KIamm/(KIamm+AMM));
mu_d = mu_dmax/(1+(Kdamm/AMM)^2);
#Model ODE
dS = [mu*Xv-mu_d*Xv;  #viable cell density XV
 mu*Xv-Klysis*(Xt-Xv); #total cell density Xt
 -(mu/Yxglc+mglc)*Xv;
 -(mu/Yxgln+alpha1*GLN/(alpha2+GLN))*Xv - Kdgln*GLN;
 Ylacglc*(mu/Yxglc+mglc)*Xv;
 Yammgln*(mu/Yxgln+alpha1*GLN/(alpha2+GLN))*Xv+Kdgln*GLN;
 (r2-r1*mu)*lambda*Xv;
 ];

# Jacobian of Model with respect to state variables
F = Symbolics.jacobian(dS,[Xv, Xt, GLC, GLN, LAC, AMM, MAb]) # jacobian(matrix with each function separated by ';', list with the dependent variables)
# P = initP

dP = F * P + P * F' + Qv # Defines the function dP

# Simulation / State prediction and filtering
# Replace all symbolic parameters with their respective numeric values where needed
# F = substitute(F,  Dict(mu_max=> 5.8e-2,  Kglc=> 0.75, Kgln=> 0.075, KIlac=> 171.756, KIamm=> 28.484, mu_dmax=> 3e-2, Kdamm=> 1.76, Klysis=> 0.05511, Yxglc=> 1.061e8, mglc=> 4.853e-14, Yxgln=> 5.57e8, alpha1=> 3.4e-13, alpha2=> 4, Kdgln=> 9.6e-3, Ylacglc=> 1.399, Yammgln=> 4.27e-1, r1=> 0.1, r2=> 2, lambda=> 7.21e-9));
# dS= substitute(dS, Dict(mu_max=> 5.8e-2,  Kglc=> 0.75, Kgln=> 0.075, KIlac=> 171.756, KIamm=> 28.484, mu_dmax=> 3e-2, Kdamm=> 1.76, Klysis=> 0.05511, Yxglc=> 1.061e8, mglc=> 4.853e-14, Yxgln=> 5.57e8, alpha1=> 3.4e-13, alpha2=> 4, Kdgln=> 9.6e-3, Ylacglc=> 1.399, Yammgln=> 4.27e-1, r1=> 0.1, r2=> 2, lambda=> 7.21e-9));
# dP= substitute(dP, Dict(mu_max=> 5.8e-2,  Kglc=> 0.75, Kgln=> 0.075, KIlac=> 171.756, KIamm=> 28.484, mu_dmax=> 3e-2, Kdamm=> 1.76, Klysis=> 0.05511, Yxglc=> 1.061e8, mglc=> 4.853e-14, Yxgln=> 5.57e8, alpha1=> 3.4e-13, alpha2=> 4, Kdgln=> 9.6e-3, Ylacglc=> 1.399, Yammgln=> 4.27e-1, r1=> 0.1, r2=> 2, lambda=> 7.21e-9));

dS= append!(dS,dP[:])

# dS= append!(dS,diag(dP)[:])



#
# println(1234)
# f = open("ODE_system.txt", "a")  # Open file in append mode

for i=1:56
    println("du[",i,"]=", dS[i] ,";")
    # write(f, dS[i])   # Append new content to the file

end
#
# close(f)
