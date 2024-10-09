library( rethinking )

# where is the file?
url <- "https://torkar.github.io/desharnais.csv"
# where should we place the file?
destFile <- "/app/scripts/desharnais.csv"
if(!file.exists(destFile)) {
  # d/l file
  download.file(url , destFile)
} else {
  # print("File exists")
}

# read the file into d
d <- read.csv (destFile)
# remove columns we don ’t need
d <- d[-c(1)]
str(d) # check format

d$ManagerExp_s <- scale( d$ManagerExp )
d$TeamExp_s <- scale( d$TeamExp )
str(d)