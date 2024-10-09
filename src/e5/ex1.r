library( rethinking )
data( NWOGrants )
d <- NWOGrants
# Check data
head(d)

# Pre process
dat_list <- list(
  awards = as.integer(d$awards),
  apps = as.integer( d$applications ),
  gid = ifelse( d$gender =="m" , 1L , 2L ) )

dat_list

# let
# alist <- alist(
#   awards ~ binomial( apps , p ),
#   logit(p) <- a[gid],
#   a[gid] ~ normal (-1,1)
#   )
print("#########################")
alist
#
# Model it
m1_total <- ulam(
  alist(
  awards ~ binomial( apps , p ),
  logit(p) <- a[gid],
  a[gid] ~ normal (-1,1)
  ), data=dat_list , chains =4, cmdstan=TRUE )


precis(m1_total ,2)

post <- extract.samples(m1_total)
diff <- inv_logit ( post$a [,1] ) - inv_logit ( post$a [,2] )
precis( list( diff=diff ) )
# So a small 3% difference on average

# Now for the direct influence of gender, we condition on discipline as well:
# head(d, 20)
dat_list$disc <- as.integer( d$discipline ) # Assign category to the string value of discipline

dat_list

m1_direct <- ulam(
  alist(
    awards ~ binomial( apps , p ),
    logit(p) <- a[gid] + d[disc],
    a[gid] ~ normal (-1,1),
    d[disc] ~ normal (0 ,1) ),
    data= dat_list , chains =4 , cores =4 , cmdstan=TRUE )
  
precis(m1_direct ,2)

#  On the relative scale:
post <- extract.samples( m1_direct )
diff_a <- post$a [,1] - post$a [,2]
precis( list( diff_a=diff_a ) )

# Interpretation
postcheck(m1_direct)
