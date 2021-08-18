#The functions A(x) and S(x) can also be inter- preted as the probability of finding a molecule of the active substance or a molecule of the solvent in the medicine. 
# x-dependent functions A(x) and S(x) in the time-dependent form as follows:
# Potentization time with 10 time-points each say with 1 hour
t <- c(1:100)
# Concentration of active substance
# At <- 10 ^ -x(t)
output_list = list()
for(val in t){
  At = 10 ^ -val
# store in list
  output_list[[val]] = log(At)
}

# Concentration of solvent
# St <- 1 - 10 ^ -x(t)
output_list2 = list()
for(val in t){
  St = 1 - 10 ^ -val
# store in list
  output_list2[[val]] = log(St)
}

options(scipen = 999)
x <- 1:100
plot(x, output_list, type = "S", pch = 19, 
     col = "red", xlab = "Potentization Time (Hours)", ylab = "Concentration (Grams)", xlim=c(0,16), ylim=c(-50,1))

# Add a second line
lines(x, output_list2, pch = 18, col = "blue", type = "S", lty = 2)
# Add a legend to the plot
legend("bottomleft", legend=c("Active Substance A(t)", "Solvent Concentration S(t)"),
       col=c("red", "blue"), lty = 1:2, cex=0.8)
text(x, output_list, round(as.numeric(output_list), 2), cex=0.45)
text(x, output_list2, round(as.numeric(output_list2), 6), cex=0.45)

