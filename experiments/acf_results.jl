

using CSV, DataFrames
using Printf
using LinearAlgebra, Symbolics, DifferentialEquations
# using Plots; gr();
using Plots;
using Infiltrator
using Dates
using Distributions, Noise
using Measures
using LaTeXStrings

# Read the CSV file
chain_bat_large = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset1/bat/chain_bat_large.csv", DataFrame)
chain_bat_specific = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset1/bat/chain_bat_specific.csv", DataFrame)
chain_bat_r1_case2 = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset2/bat/chain_bat_r1_case2.csv", DataFrame)
chain_bat_r1_normal_case2 = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset2/bat/chain_bat_r1_normal_case2.csv", DataFrame)
chain_bat_r2_case2 = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset2/bat/chain_bat_r2_case2.csv", DataFrame)
chain_bat_r2_normal_case2 = CSV.read("/Users/cristovao/PhD_courses/Thesis/BAT/experiments/dataset2/bat/chain_bat_r2_normal_case2.csv", DataFrame)




#https://docs.juliahub.com/MCMCChains/QRkwo/4.7.2/statsplots/#Autocorrelation

lws=3.5
gr( xtickfontsize=13, ytickfontsize=13, xguidefontsize=16, yguidefontsize=16, legendfontsize=13);

plot1=plot(autocor(chain_bat_large[:,3]), label = "σ")
plot!(autocor(chain_bat_large[:,4]), label = "Q1")
plot!(autocor(chain_bat_large[:,5]), label = "Q2")
plot!(autocor(chain_bat_large[:,6]), label = "Q3")
plot!(autocor(chain_bat_large[:,7]), label = "Q4")
plot!(autocor(chain_bat_large[:,8]), label = "Q5")
plot!(autocor(chain_bat_large[:,9]), label = "Q6")
plot!(autocor(chain_bat_large[:,10]), label = "Q7")
plot!(autocor(chain_bat_large[:,11]), label = "R")
annotate!(17., .75, text("A", :left, 10, 17))
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")

# chain_bat_specific=DataFrame(chain)
plot2=plot(autocor(chain_bat_specific[:,3]), label = "σ")
plot!(autocor(chain_bat_specific[:,4]), label = "Q1")
plot!(autocor(chain_bat_specific[:,5]), label = "Q2")
plot!(autocor(chain_bat_specific[:,6]), label = "Q3")
plot!(autocor(chain_bat_specific[:,7]), label = "Q4")
plot!(autocor(chain_bat_specific[:,8]), label = "Q5")
plot!(autocor(chain_bat_specific[:,9]), label = "Q6")
plot!(autocor(chain_bat_specific[:,10]), label = "Q7")
plot!(autocor(chain_bat_specific[:,11]), label = "R")
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")
annotate!(17., .75, text("B", :left, 10, 17))

plot3=plot(autocor(chain_bat_r1_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r1_case2[:,4]), label = "Q1")
plot!(autocor(chain_bat_r1_case2[:,5]), label = "Q2")
plot!(autocor(chain_bat_r1_case2[:,6]), label = "Q3")
plot!(autocor(chain_bat_r1_case2[:,7]), label = "Q4")
plot!(autocor(chain_bat_r1_case2[:,8]), label = "Q5")
plot!(autocor(chain_bat_r1_case2[:,9]), label = "Q6")
plot!(autocor(chain_bat_r1_case2[:,10]), label = "Q7")
plot!(autocor(chain_bat_r1_case2[:,11]), label = "R")
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")
annotate!(17., .75, text("C", :left, 10, 17))

plot4=plot(autocor(chain_bat_r1_normal_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r1_normal_case2[:,4]), label = "Q1")
plot!(autocor(chain_bat_r1_normal_case2[:,5]), label = "Q2")
plot!(autocor(chain_bat_r1_normal_case2[:,6]), label = "Q3")
plot!(autocor(chain_bat_r1_normal_case2[:,7]), label = "Q4")
plot!(autocor(chain_bat_r1_normal_case2[:,8]), label = "Q5")
plot!(autocor(chain_bat_r1_normal_case2[:,9]), label = "Q6")
plot!(autocor(chain_bat_r1_normal_case2[:,10]), label = "Q7")
plot!(autocor(chain_bat_r1_normal_case2[:,11]), label = "R")
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")
annotate!(17., .75, text("D", :left, 10, 17))

plot5=plot(autocor(chain_bat_r2_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r2_case2[:,4]), label = "Q1")
plot!(autocor(chain_bat_r2_case2[:,5]), label = "Q2")
plot!(autocor(chain_bat_r2_case2[:,6]), label = "Q3")
plot!(autocor(chain_bat_r2_case2[:,7]), label = "Q4")
plot!(autocor(chain_bat_r2_case2[:,8]), label = "Q5")
plot!(autocor(chain_bat_r2_case2[:,9]), label = "Q6")
plot!(autocor(chain_bat_r2_case2[:,10]), label = "Q7")
plot!(autocor(chain_bat_r2_case2[:,11]), label = "R")
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")
annotate!(17., .75, text("E", :left, 10, 17))

plot6=plot(autocor(chain_bat_r2_normal_case2[:,3]), label = "σ")
plot!(autocor(chain_bat_r2_normal_case2[:,4]), label = "Q1")
plot!(autocor(chain_bat_r2_normal_case2[:,5]), label = "Q2")
plot!(autocor(chain_bat_r2_normal_case2[:,6]), label = "Q3")
plot!(autocor(chain_bat_r2_normal_case2[:,7]), label = "Q4")
plot!(autocor(chain_bat_r2_normal_case2[:,8]), label = "Q5")
plot!(autocor(chain_bat_r2_normal_case2[:,9]), label = "Q6")
plot!(autocor(chain_bat_r2_normal_case2[:,10]), label = "Q7")
plot!(autocor(chain_bat_r2_normal_case2[:,11]), label = "R")
plot!(left_margin=25mm,bottom_margin=25mm, xlabel="Lag",ylabel="ACF")
annotate!(17., .75, text("F", :left, 10, 17))


pp=plot(plot1,plot2,plot3,plot4,plot5,plot6, layout=(6,1),size = (1000,2000))
plot!(legend=:outertopright)
display(pp)
png("/Users/cristovao/PhD_courses/Thesis/BAT/ACF_plots")



#
# lws=3.5
# gr( xtickfontsize=13, ytickfontsize=13, xguidefontsize=16, yguidefontsize=16, legendfontsize=13);
# plot1=plot(tProcess_total,online_Xv_noise_7_5min_Htiter,color="lightblue", ylim = [0, 2.2e9], label = "Xv online noise", ylabel=L"Xv (Cell/L)" ,xlabel=L"time(h)" , lw=lws)
# plot!(tProcess,result_classic[1], label = "JEKF-Classic",color=:purple , lw=lws)
# plot!(tProcess,result_santo[1], label = "JEKF-Classic",color=:blue  , lw=lws)
# plot!(tProcess,result_KPH2[1], label = "JEKF-Classic",color=:green  , lw=lws)
# plot!(sol2.t,sol2[1,:],color=:red ,  ls=:dot, label = "Ground truth", lw=lws)
# plot!(legend=:outertopright)
# annotate!(15, 2e9, text("A", :left, 10, 17))
#
# plot2=hline([9.21e-9] ,color=:red , ls=:dot, label = "Ground truth" ,xlabel=L"time(h)", ylabel=L"QmAb (mg/(cell~h))", lw=lws)
# plot!(tProcess,result_classic[8], label = "JEKF-Classic",color=:purple, lw=lws )
# plot!(tProcess,result_santo[8], label = "JEKF-SANTO",color=:blue , lw=lws )
# plot!(tProcess,result_KPH2[8], label = "JEKF-KPH2",color=:green , lw=lws )
# plot!(legend=:outertopright)
# annotate!(15, 8e-9, text("B", :left, 10, 17))
#
# plot3=plot(sol2.t,sol2[7,:], color=:red , ls=:dot, label = "Ground truth" ,xlabel=L"time(h)", ylabel=L"mAb (mg/L)", lw=lws)
# plot!(tProcess,result_classic[7], label = "JEKF-Classic",color=:purple, lw=lws )
# plot!(tProcess,result_santo[7], label = "JEKF-SANTO",color=:blue , lw=lws )
# plot!(tProcess,result_KPH2[7], label = "JEKF-KPH2",color=:green , lw=lws )
# plot!(legend=:topleft)
# annotate!(15, 500, text("C", :left, 10, 17))
#
# pp=plot(plot1,plot2,plot3, layout=(3,1),size = (900,800))
# display(pp)
# png("SDT_B_with_MRDE_PU_and_SPECIFIC_P0")
