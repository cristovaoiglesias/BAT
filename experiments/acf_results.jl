

using CSV, DataFrames
using Printf
using LinearAlgebra, Symbolics, DifferentialEquations
# using Plots; gr();
using Plots;
using Infiltrator
using Dates
using Distributions, Noise
using Measures
using LaTeXStrings, Turing

# Read the CSV file

println("\n ************************* chain_bat_r1_case2 BAT with large Uniform priors")
chain_bat_r1_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/bat/chain_bat_r1_case2.csv", DataFrame)
println(mean(chain_bat_r1_case2[:,4])," : X_V")
println(mean(chain_bat_r1_case2[:,5]), " : X_t")
println(mean(chain_bat_r1_case2[:,6]), " : GLC")
println(mean(chain_bat_r1_case2[:,7]), " : GLN")
println(mean(chain_bat_r1_case2[:,8]), " : LAC")
println(mean(chain_bat_r1_case2[:,9]), " : AMM")
println(mean(chain_bat_r1_case2[:,10]), " : mAb")
println(mean(chain_bat_r1_case2[:,11]), " : R")
println("\n ************************* BAT with specific priors ")
chain_bat_r1_specific_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/bat/chain_bat_r1_normal_case2.csv", DataFrame)
println(mean(chain_bat_r1_specific_case2[:,4])," : X_V")
println(mean(chain_bat_r1_specific_case2[:,5]), " : X_t")
println(mean(chain_bat_r1_specific_case2[:,6]), " : GLC")
println(mean(chain_bat_r1_specific_case2[:,7]), " : GLN")
println(mean(chain_bat_r1_specific_case2[:,8]), " : LAC")
println(mean(chain_bat_r1_specific_case2[:,9]), " : AMM")
println(mean(chain_bat_r1_specific_case2[:,10]), " : mAb")
println(mean(chain_bat_r1_specific_case2[:,11]), " : R")
println("\n ************************* Obj Function with MCMC (NUTs) specific priors")
chain_objF_mcmc_r1_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/pea/mcmc/chain_objF_mcmc_r1_case2.csv", DataFrame)
println(mean(chain_objF_mcmc_r1_case2[:,3])," : X_V")
println(mean(chain_objF_mcmc_r1_case2[:,4]), " : X_t")
println(mean(chain_objF_mcmc_r1_case2[:,5]), " : GLC")
println(mean(chain_objF_mcmc_r1_case2[:,6]), " : GLN")
println(mean(chain_objF_mcmc_r1_case2[:,7]), " : LAC")
println(mean(chain_objF_mcmc_r1_case2[:,8]), " : AMM")
println(mean(chain_objF_mcmc_r1_case2[:,9]), " : mAb")
println(mean(chain_objF_mcmc_r1_case2[:,10]), " : R")

println("\n *************************chain_bat_r2_case2 BAT with large Uniform priors")
chain_bat_r2_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/bat/chain_bat_r2_case2.csv", DataFrame)
println(mean(chain_bat_r2_case2[:,4])," : X_V")
println(mean(chain_bat_r2_case2[:,5]), " : X_t")
println(mean(chain_bat_r2_case2[:,6]), " : GLC")
println(mean(chain_bat_r2_case2[:,7]), " : GLN")
println(mean(chain_bat_r2_case2[:,8]), " : LAC")
println(mean(chain_bat_r2_case2[:,9]), " : AMM")
println(mean(chain_bat_r2_case2[:,10]), " : mAb")
println(mean(chain_bat_r2_case2[:,11]), " : R")
println("\n ************************* BAT with specific priors ")
chain_bat_r2_specific_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/bat/chain_bat_r2_normal_case221 Jan 2024 5:1:813.csv", DataFrame)
println(mean(chain_bat_r2_specific_case2[:,4])," : X_V")
println(mean(chain_bat_r2_specific_case2[:,5]), " : X_t")
println(mean(chain_bat_r2_specific_case2[:,6]), " : GLC")
println(mean(chain_bat_r2_specific_case2[:,7]), " : GLN")
println(mean(chain_bat_r2_specific_case2[:,8]), " : LAC")
println(mean(chain_bat_r2_specific_case2[:,9]), " : AMM")
println(mean(chain_bat_r2_specific_case2[:,10]), " : mAb")
println(mean(chain_bat_r2_specific_case2[:,11]), " : R")
println("\n ************************* Obj Function with MCMC (NUTs) specific priors")
chain_objF_mcmc_r2_case2 = CSV.read("/your_path/BAT/experiments/EKF/task1/pea/mcmc/chain_objF_mcmc_r2_case221 Jan 2024 5:1:005.csv", DataFrame)
println(mean(chain_objF_mcmc_r2_case2[:,3])," : X_V")
println(mean(chain_objF_mcmc_r2_case2[:,4]), " : X_t")
println(mean(chain_objF_mcmc_r2_case2[:,5]), " : GLC")
println(mean(chain_objF_mcmc_r2_case2[:,6]), " : GLN")
println(mean(chain_objF_mcmc_r2_case2[:,7]), " : LAC")
println(mean(chain_objF_mcmc_r2_case2[:,8]), " : AMM")
println(mean(chain_objF_mcmc_r2_case2[:,9]), " : mAb")
println(mean(chain_objF_mcmc_r2_case2[:,10]), " : R")




#https://docs.juliahub.com/MCMCChains/QRkwo/4.7.2/statsplots/#Autocorrelation

lws=3.5
gr( xtickfontsize=7, ytickfontsize=7, xguidefontsize=9, yguidefontsize=9, legendfontsize=8);

plot3=plot(autocor(chain_bat_r1_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r1_case2[:,4]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_bat_r1_case2[:,5]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_bat_r1_case2[:,6]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_bat_r1_case2[:,7]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_bat_r1_case2[:,8]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_bat_r1_case2[:,9]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_bat_r1_case2[:,10]), label =  L"Q_{AAV,AAV}")
plot!(autocor(chain_bat_r1_case2[:,11]), label =  L"R_{X_V,X_V}")
plot!(left_margin=0mm,bottom_margin=1mm, ylabel="ACF")
# annotate!(3., .75, text("R1 of Dataset B  - BAT with no specific priors", :left, 10, 14))
annotate!(3., .15, text("BAT-WP using training set A1-Reg1", :left, 10, 8))

plot4=plot(autocor(chain_bat_r1_specific_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r1_specific_case2[:,4]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_bat_r1_specific_case2[:,5]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_bat_r1_specific_case2[:,6]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_bat_r1_specific_case2[:,7]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_bat_r1_specific_case2[:,8]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_bat_r1_specific_case2[:,9]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_bat_r1_specific_case2[:,10]), label =  L"Q_{AAV,AAV}")
plot!(autocor(chain_bat_r1_specific_case2[:,11]), label =  L"R_{X_V,X_V}")
plot!(left_margin=0mm,bottom_margin=1mm)
# annotate!(3., .75, text("R1 of Dataset B  - BAT with specific priors", :left, 10, 14))
annotate!(3., .15, text("BAT using training set A1-Reg1", :left, 10, 8))


plot2_mcmc=plot(autocor(chain_objF_mcmc_r1_case2[:,3]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,4]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,5]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,6]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,7]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,8]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,9]), label = L"Q_{mAb,mAb}")
plot!(autocor(chain_objF_mcmc_r1_case2[:,10]), label =  L"R_{X_V,X_V}")
plot!(left_margin=0mm,bottom_margin=1mm)
annotate!(3., .15, text("OF-NUTS using training set A1-Reg1", :left, 10, 8))




plot5=plot(autocor(chain_bat_r2_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r2_case2[:,4]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_bat_r2_case2[:,5]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_bat_r2_case2[:,6]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_bat_r2_case2[:,7]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_bat_r2_case2[:,8]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_bat_r2_case2[:,9]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_bat_r2_case2[:,10]), label =  L"Q_{AAV,AAV}")
plot!(autocor(chain_bat_r2_case2[:,11]), label =  L"R_{X_V,X_V}")
plot!(left_margin=0mm,bottom_margin=1mm, xlabel="Lag",ylabel="ACF")
# annotate!(3., .75, text("R2 of Dataset B  - BAT with no specific priors", :left, 10, 14))
annotate!(3., .15, text("BAT-WP using training set A1-Reg2", :left, 10, 8))

plot6=plot(autocor(chain_bat_r2_specific_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r2_specific_case2[:,4]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_bat_r2_specific_case2[:,5]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_bat_r2_specific_case2[:,6]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_bat_r2_specific_case2[:,7]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_bat_r2_specific_case2[:,8]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_bat_r2_specific_case2[:,9]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_bat_r2_specific_case2[:,10]), label =  L"Q_{AAV,AAV}")
plot!(autocor(chain_bat_r2_specific_case2[:,11]), label =  L"R_{X_V,X_V}")
plot!(left_margin=0mm,bottom_margin=1mm, xlabel="Lag")
# annotate!(3., .75, text("R2 of Dataset B  - BAT with specific priors", :left, 10, 14))
annotate!(3., .15, text("BAT using training set A1-Reg2", :left, 10, 8))

plot3_mcmc=plot(autocor(chain_objF_mcmc_r2_case2[:,3]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,4]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,5]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,6]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,7]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,8]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,9]), label = L"Q_{mAb,mAb}")
plot!(autocor(chain_objF_mcmc_r2_case2[:,10]), label =  L"R_{X_V,X_V}")
annotate!(3., .15, text("OF-NUTS using training set A1-Reg2", :left, 10, 8))
plot!(xlabel="Lag")


pp=plot(plot3,plot4, plot2_mcmc, plot5,plot6, plot3_mcmc, left_margin=3mm,bottom_margin=1mm, layout=(2,3),size = (1000,600))
plot!(legend=:topright)
display(pp)
png("all_ACF_plots_task1")





#
#
#
#
# path_folder="/your_path/"
#
# println("\n res ")
#
# println("\n ************************* BAT with specific priors ")
# chain_bat_r1_case1_all_params = CSV.read(path_folder*"BAT/experiments/EKF/task2/case1/chain_bat_for_all_params_runC_20 Jan 2024 23:1:131.csv", DataFrame)
# println(mean(chain_bat_r1_case1_all_params[:,10]))
# println(mean(chain_bat_r1_case1_all_params[:,11]))
# println(mean(chain_bat_r1_case1_all_params[:,12]))
# println(mean(chain_bat_r1_case1_all_params[:,13]))
# println(mean(chain_bat_r1_case1_all_params[:,14]))
# println(mean(chain_bat_r1_case1_all_params[:,15]))
# println(mean(chain_bat_r1_case1_all_params[:,16]))
# println(mean(chain_bat_r1_case1_all_params[:,17]))
# println(mean(chain_bat_r1_case1_all_params[:,18]))
# println(mean(chain_bat_r1_case1_all_params[:,19]))
# println(mean(chain_bat_r1_case1_all_params[:,20]))
# println(mean(chain_bat_r1_case1_all_params[:,21]))
# println(mean(chain_bat_r1_case1_all_params[:,22]))
#
# lws=3.5
# gr( xtickfontsize=7, ytickfontsize=7, xguidefontsize=9, yguidefontsize=9, legendfontsize=8);
# plot1=plot(autocor(chain_bat_r1_case1_all_params[:,10]), label = L"Q_{X_V,X_V}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,11]), label = L"Q_{X_t,X_t}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,12]), label = L"Q_{GLC,GLC}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,13]), label = L"Q_{GLN,GLN}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,14]), label = L"Q_{LAC,LAC}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,15]), label = L"Q_{AMM,AMM}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,16]), label = L"Q_{mAb,mAb}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,17]), label =  L"R_{X_V,X_V}")
# plot!(autocor(chain_bat_r1_case1_all_params[:,18]), label =  L"Ylacglc")
# plot!(autocor(chain_bat_r1_case1_all_params[:,19]), label =  L"Yammgln")
# plot!(autocor(chain_bat_r1_case1_all_params[:,20]), label =  L"lambda")
# plot!(autocor(chain_bat_r1_case1_all_params[:,21]), label =  L"u0_LAC")
# plot!(autocor(chain_bat_r1_case1_all_params[:,22]), label =  L"u0_MAb")
# annotate!(3., .75, text("A", :left, 10, 8))
# # annotate!(3., .75, text("Estimating all params - R1C1 with BAT", :left, 10, 8))
# plot!(xlabel="Lag",ylabel="ACF")
# plot!(legend=:topright,size = (1000,1000),label = false)
#
# println("\n ************************* Obj Function with MCMC (NUTs) specific priors")
#
#
# chain_objf_r1_case1_all_params = CSV.read(path_folder*"BAT/experiments/EKF/task2/case1/pea_mcmc_for_all_params_r1_case1_runC20 Jan 2024 22:1:67.csv", DataFrame)
# println(mean(chain_objf_r1_case1_all_params[:,3]))
# println(mean(chain_objf_r1_case1_all_params[:,4]))
# println(mean(chain_objf_r1_case1_all_params[:,5]))
# println(mean(chain_objf_r1_case1_all_params[:,6]))
# println(mean(chain_objf_r1_case1_all_params[:,7]))
# println(mean(chain_objf_r1_case1_all_params[:,8]))
# println(mean(chain_objf_r1_case1_all_params[:,9]))
# println(mean(chain_objf_r1_case1_all_params[:,10]))
# println(mean(chain_objf_r1_case1_all_params[:,11]))
# println(mean(chain_objf_r1_case1_all_params[:,12]))
# println(mean(chain_objf_r1_case1_all_params[:,13]))
# println(mean(chain_objf_r1_case1_all_params[:,14]))
# println(mean(chain_objf_r1_case1_all_params[:,15]))
#
# lws=3.5
# gr( xtickfontsize=7, ytickfontsize=7, xguidefontsize=9, yguidefontsize=9, legendfontsize=8);
# plot2=plot(autocor(chain_objf_r1_case1_all_params[:,3]), label = L"Q_{X_V,X_V}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,4]), label = L"Q_{X_t,X_t}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,5]), label = L"Q_{GLC,GLC}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,6]), label = L"Q_{GLN,GLN}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,7]), label = L"Q_{LAC,LAC}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,8]), label = L"Q_{AMM,AMM}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,9]), label = L"Q_{mAb,mAb}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,10]), label =  L"R_{X_V,X_V}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,11]), label =  L"Ylacglc")
# plot!(autocor(chain_objf_r1_case1_all_params[:,12]), label =  L"Yammgln")
# plot!(autocor(chain_objf_r1_case1_all_params[:,13]), label =  L"lambda")
# plot!(autocor(chain_objf_r1_case1_all_params[:,14]), label =  L"u0_{LAC}")
# plot!(autocor(chain_objf_r1_case1_all_params[:,15]), label =  L"u0_{mAb}")
# annotate!(3., .75, text("B", :left, 10, 8))
# # annotate!(3., .75, text("Estimating all params - R1C1 with OF-MCMC(NUTs)", :left, 10, 8))
# plot!(xlabel="Lag",ylabel="ACF")
# plot!(legend=:topright,size = (1000,1000))
#
#
#
# pp=plot(plot1,plot2, left_margin=0mm,bottom_margin=0mm,layout=(1,2),size = (450,380))
# plot!(legend=:topright)
# display(pp)
# png("all_parameters_ACF_plots")









path_folder="yourpath"

println("\n res ")

println("\n ************************* BAT with specific priors ")
chain_bat_r1_case1_all_params = CSV.read(path_folder*"BAT/experiments/EKF/task2/case1/chain_bat_for_all_params_runC_20 Jan 2024 23:1:131.csv", DataFrame)
println(mean(chain_bat_r1_case1_all_params[:,10]))
println(mean(chain_bat_r1_case1_all_params[:,11]))
println(mean(chain_bat_r1_case1_all_params[:,12]))
println(mean(chain_bat_r1_case1_all_params[:,13]))
println(mean(chain_bat_r1_case1_all_params[:,14]))
println(mean(chain_bat_r1_case1_all_params[:,15]))
println(mean(chain_bat_r1_case1_all_params[:,16]))
println(mean(chain_bat_r1_case1_all_params[:,17]))
println(mean(chain_bat_r1_case1_all_params[:,18]))
println(mean(chain_bat_r1_case1_all_params[:,19]))
println(mean(chain_bat_r1_case1_all_params[:,20]))
println(mean(chain_bat_r1_case1_all_params[:,21]))
println(mean(chain_bat_r1_case1_all_params[:,22]))


println("\n ************************* Obj Function with MCMC (NUTs) specific priors")


chain_objf_r1_case1_all_params = CSV.read(path_folder*"BAT/experiments/EKF/task2/case1/pea_mcmc_for_all_params_r1_case1_runC20 Jan 2024 22:1:67.csv", DataFrame)
println(mean(chain_objf_r1_case1_all_params[:,3]))
println(mean(chain_objf_r1_case1_all_params[:,4]))
println(mean(chain_objf_r1_case1_all_params[:,5]))
println(mean(chain_objf_r1_case1_all_params[:,6]))
println(mean(chain_objf_r1_case1_all_params[:,7]))
println(mean(chain_objf_r1_case1_all_params[:,8]))
println(mean(chain_objf_r1_case1_all_params[:,9]))
println(mean(chain_objf_r1_case1_all_params[:,10]))
println(mean(chain_objf_r1_case1_all_params[:,11]))
println(mean(chain_objf_r1_case1_all_params[:,12]))
println(mean(chain_objf_r1_case1_all_params[:,13]))
println(mean(chain_objf_r1_case1_all_params[:,14]))
println(mean(chain_objf_r1_case1_all_params[:,15]))



lws=3.5
gr( xtickfontsize=7, ytickfontsize=7, xguidefontsize=9, yguidefontsize=9, legendfontsize=8);
plot1=plot(autocor(chain_bat_r1_case1_all_params[:,10]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_bat_r1_case1_all_params[:,11]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_bat_r1_case1_all_params[:,12]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_bat_r1_case1_all_params[:,13]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_bat_r1_case1_all_params[:,14]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_bat_r1_case1_all_params[:,15]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_bat_r1_case1_all_params[:,16]), label = L"Q_{mAb,mAb}")
plot!(autocor(chain_bat_r1_case1_all_params[:,17]), label =  L"R_{X_V,X_V}")
plot!(autocor(chain_bat_r1_case1_all_params[:,18]), label =  L"Ylacglc")
plot!(autocor(chain_bat_r1_case1_all_params[:,19]), label =  L"Yammgln")
plot!(autocor(chain_bat_r1_case1_all_params[:,20]), label =  L"lambda")
plot!(autocor(chain_bat_r1_case1_all_params[:,21]), label =  L"u0_LAC")
plot!(autocor(chain_bat_r1_case1_all_params[:,22]), label =  L"u0_MAb")
annotate!(3., .75, text("A", :left, 10, 8))
# annotate!(3., .75, text("Estimating all params - R1C1 with BAT", :left, 10, 8))
plot!(xlabel="Lag",ylabel="ACF")
plot!(legend=false,label = false,size = (100,100))

plot2=plot(autocor(chain_objf_r1_case1_all_params[:,3]), label = L"Q_{X_V,X_V}")
plot!(autocor(chain_objf_r1_case1_all_params[:,4]), label = L"Q_{X_t,X_t}")
plot!(autocor(chain_objf_r1_case1_all_params[:,5]), label = L"Q_{GLC,GLC}")
plot!(autocor(chain_objf_r1_case1_all_params[:,6]), label = L"Q_{GLN,GLN}")
plot!(autocor(chain_objf_r1_case1_all_params[:,7]), label = L"Q_{LAC,LAC}")
plot!(autocor(chain_objf_r1_case1_all_params[:,8]), label = L"Q_{AMM,AMM}")
plot!(autocor(chain_objf_r1_case1_all_params[:,9]), label = L"Q_{mAb,mAb}")
plot!(autocor(chain_objf_r1_case1_all_params[:,10]), label =  L"R_{X_V,X_V}")
plot!(autocor(chain_objf_r1_case1_all_params[:,11]), label =  L"Ylacglc")
plot!(autocor(chain_objf_r1_case1_all_params[:,12]), label =  L"Yammgln")
plot!(autocor(chain_objf_r1_case1_all_params[:,13]), label =  L"lambda")
plot!(autocor(chain_objf_r1_case1_all_params[:,14]), label =  L"u0_{LAC}")
plot!(autocor(chain_objf_r1_case1_all_params[:,15]), label =  L"u0_{mAb}")
annotate!(3., .75, text("B", :left, 10, 8))
# annotate!(3., .75, text("Estimating all params - R1C1 with OF-MCMC(NUTs)", :left, 10, 8))
plot!(xlabel="Lag")
plot!(legend=false,label = false,size = (100,100))

plot3=plot([NaN], label = L"Q_{X_V,X_V}")
plot!([NaN], label = L"Q_{X_t,X_t}")
plot!([NaN], label = L"Q_{GLC,GLC}")
plot!([NaN], label = L"Q_{GLN,GLN}")
plot!([NaN], label = L"Q_{LAC,LAC}")
plot!([NaN], label = L"Q_{AMM,AMM}")
plot!([NaN], label = L"Q_{mAb,mAb}")
plot!([NaN], label =  L"R_{X_V,X_V}")
plot!([NaN], label =  L"Ylacglc")
plot!([NaN], label =  L"Yammgln")
plot!([NaN], label =  L"lambda")
plot!([NaN], label =  L"u0_{LAC}")
plot!([NaN], label =  L"u0_{mAb}")
plot!(legend=:topleft,xaxis=false, yaxis=false, grid=false)
# plot3 = plot(plot3, alpha=0)


pp=plot(plot1,plot2,plot3, left_margin=0mm,bottom_margin=0mm,layout=(1,3),size = (400,260))
# plot!(legend=:topright)
display(pp)
png("task2_ACF_plots")
