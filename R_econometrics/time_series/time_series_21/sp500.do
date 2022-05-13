clear all

use prices
* sp500 index downloaded from Yahoo Finance on 12/26/2016
* Weekly, Friday closing price

gen return = 100*(sp500/L.sp500-1)

reg return L(1/2).return ,r
testparm L(1/2).return

reg return L(1/2).return 
testparm L(1/2).return
