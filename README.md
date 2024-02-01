# BAT: Batch Bayesian Auto-Tuning for Nonlinear Kalman Estimators

We study how to enhance the auto-tuning process of all Nonlinear Kalman Estimators (NKEs) components by using additional information about all state variables.
Traditional auto-tuning approaches based on Normalized Estimation Error Squared or Normalized Innovation Squared can not efficiently estimate all NKE components because they rely on a true model (which is impossible in most cases) or on only measured data to produce the innovation errors.
In this work, we introduce an approach called Batch Bayesian Auto-Tuning (BAT) for NKEs that enables the use of all available measured data (y) (not just those selected for generating innovation errors) during the tuning process.
This is done using a posterior distribution of all NKE components given y, outside of the NKE recursive process, based on the equivalence between the posterior distributions used in batch and recursive Bayesian inference.
We validate our theoretical studies with empirical experiments conducted on a synthetic dataset representing a bioprocess production, confirming the efficacy of the BAT over the baselines. 




## Experiments with BAT 
[Link](https://github.com/cristovaoiglesias/BAT/tree/main/experiments/EKF)

We executed detailed experiments to answer the following three questions and understand the effectiveness of the proposed approach: Q1) How does the performance of BAT compare with the performance of baseline methods? Q2) Does the  BAT posterior density  enable an efficient sampling with MCMC?  Q3) What is the impact of prior distributions on the performance of BAT?

## Ilustrative application of BAT with UKF and CKF: Pendulum Case

[Link for UKF](https://github.com/cristovaoiglesias/BAT/tree/main/experiments/UKF)

[Link for CKF](https://github.com/cristovaoiglesias/BAT/tree/main/experiments/CKF)


