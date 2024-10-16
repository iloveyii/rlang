# Linear prediction

## Run

- Copy file `cp src/linear/* scripts/`
- Copy & Run file `cp src/linear/* scripts/ && docker exec -ti dat246_rlang Rscript rsequence.r`
- SSH `docker exec -ti dat246_rlang /bin/bash`
- Run cmd `Rscript vars.r`

## Concepts

- We are interested in modeling how an outcome related to some other variable, the predictor
- Knowing a person weight help you predict height - (from plot), independent var / dependent var
- How do we take our Gaussian model from the previous section and incorporate predictor variables?
- The linear model strategy. The strategy is to make the parameter for the mean of a Gaussian distribution, μ, into a linear function of the predictor variable and other, new parameters that we invent. This strategy is often simply called the linear model. 
- Guassian distribution:
- hi ∼ Normal(μ, σ)       [likelihood]
- μ ∼ Normal(178, 20)     [μ prior]
- σ ∼ Uniform(0, 50)      [σ prior]
- Now how do we get weight into a Gaussian model of height?
- Let x be the name for the column of weight measurements i.e. d2$weight
- Let the average of the x values be  ̄x (x bar)
- Now we have a predictor variable x (which is a list of measures of the same length as h.)
- To get weight into the model, we define the mean μ as a function of the values in x.
- This is what it looks like, with explanation to follow: (page 96)
- hi ∼ Normal(μi, σ)  --- likelihood
- μi = α + β(xi −  ̄x) --- linear model
- α ∼ Normal(178, 20) --- a prior
- β ∼ Normal(0, 10)   --- b prior
- σ ∼ Uniform(0, 50)  --- [σ prior]

## Priors - p 97

plot( NULL , xlim=range(d2$weight) , ylim=c(-100,400) , 4.39 xlab="weight" , ylab="height" )

## Data sets

- library(gcookbook)
- myData<- heightweight
- head(myData)
- Get data from R interactive shell
- Write data to file: write.table(d2, "d2.txt", append=FALSE, quote=FALSE, row.names = FALSE, col.names = FALSE)