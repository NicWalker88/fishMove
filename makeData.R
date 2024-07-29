library(RNetLogo)

NLStart("C:/Program Files/NetLogo 5.3.1/app", gui = TRUE)
#setwd()
NLLoadModel("attractor.nlogo")
pars <- read.csv("par_vals.csv")

NLCommand("random-seed 12345")
NLCommand("setup")
NLCommand('set alpha', pars[[1]])
NLCommand('set sigma', pars[[2]])
data <- NLGetAgentSet(c("ticks","who","xcor","ycor"), "turtles")
for (yr in 1:100){
  NLCommand("go")
  data <- rbind(data, NLGetAgentSet(c("ticks","who","xcor","ycor"), "turtles"))
}
NLQuit()

write.csv(data, file="data.csv", row.names=FALSE)
