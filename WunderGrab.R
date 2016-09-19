#+#+#+#+#+#+#
# Purpose: Grab yesterday's local weather data from Wunderground.com.

#+#+#+#
# Determine yesterday's date and reformat components

yest <- Sys.Date() - 1

year0 <- as.numeric(format(yest, '%Y'))
month0 <- as.numeric(format(yest, '%m'))
day0 <- as.numeric(format(yest, '%d'))

#_#_#_#


#+#+#+#
# Define the url path and the file name

url.comps <- c('https://www.wunderground.com/history/airport/KDCA/', year0, '/',
  month0, '/', day0, '/DailyHistory.html?format=1')

url0 <- paste(url.comps, collapse = '')

out.name <- paste('/home/jessejeter/Wundat/data', '-', year0, '-', month0, '-', 
  day0, '.csv', sep = '')

out.name.err <- paste('/home/jessejeter/Wundat/data', '-', year0, '-', month0, '-', 
  day0, '-err.csv', sep = '')

#_#_#_#


#+#+#+#
# Import table and write to file

df0 <- read.table(url0, sep = ',')

if(is.data.frame(df0)) {
  write.table(df0, out.name)
} else {
  write.table('Error', out.name.err)
}

#_#_#_#_#_#_#

