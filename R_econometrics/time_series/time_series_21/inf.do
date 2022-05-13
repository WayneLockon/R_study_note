clear all
set more off

use gdp

gen inf = 400*(cpi/L.cpi-1)
label variable inf "Inflation Rate"
gen dinf = d.inf

reg dinf L(1/4).dinf L(1/4).ur if time<=tq(2016q3), r
testparm L(1/4).ur


reg dinf L.dinf L(1/1).ur if time>=tq(1950q1)
estimates store m11

reg dinf L.dinf L(1/2).ur if time>=tq(1950q1)
estimates store m12

reg dinf L.dinf L(1/3).ur if time>=tq(1950q1)
estimates store m13

reg dinf L.dinf L(1/4).ur if time>=tq(1950q1)
estimates store m14

reg dinf L(1/2).dinf L(1/1).ur if time>=tq(1950q1)
estimates store m21

reg dinf L(1/2).dinf L(1/2).ur if time>=tq(1950q1)
estimates store m22

reg dinf L(1/2).dinf L(1/3).ur if time>=tq(1950q1)
estimates store m23

reg dinf L(1/2).dinf L(1/4).ur if time>=tq(1950q1)
estimates store m24

reg dinf L(1/3).dinf L(1/1).ur if time>=tq(1950q1)
estimates store m31

reg dinf L(1/3).dinf L(1/2).ur if time>=tq(1950q1)
estimates store m32

reg dinf L(1/3).dinf L(1/3).ur if time>=tq(1950q1)
estimates store m33

reg dinf L(1/3).dinf L(1/4).ur if time>=tq(1950q1)
estimates store m34

reg dinf L(1/4).dinf L(1/1).ur if time>=tq(1950q1)
estimates store m41

reg dinf L(1/4).dinf L(1/2).ur if time>=tq(1950q1)
estimates store m42

reg dinf L(1/4).dinf L(1/3).ur if time>=tq(1950q1)
estimates store m43

reg dinf L(1/4).dinf L(1/4).ur if time>=tq(1950q1)
estimates store m44

reg dinf L(1/5).dinf L(1/1).ur if time>=tq(1950q1)
estimates store m51

reg dinf L(1/5).dinf L(1/2).ur if time>=tq(1950q1)
estimates store m52

reg dinf L(1/5).dinf L(1/3).ur if time>=tq(1950q1)
estimates store m53

reg dinf L(1/5).dinf L(1/4).ur if time>=tq(1950q1)
estimates store m54

reg dinf L(1/6).dinf L(1/1).ur if time>=tq(1950q1)
estimates store m61

reg dinf L(1/6).dinf L(1/2).ur if time>=tq(1950q1)
estimates store m62

reg dinf L(1/6).dinf L(1/3).ur if time>=tq(1950q1)
estimates store m63

reg dinf L(1/6).dinf L(1/4).ur if time>=tq(1950q1)
estimates store m64

estimates stats m11 m12 m13 m14 m21 m22 m23 m24 m31 m32 m33 m34 m41 m42 m43 m44 m51 m52 m53 m54 m61 m62 m63 m64

gen d2inf = inf - L2.inf
gen d3inf = inf - L3.inf
gen d4inf = inf - L4.inf
gen d5inf = inf - L5.inf
gen d6inf = inf - L6.inf
gen d7inf = inf - L7.inf
gen d8inf = inf - L8.inf
tsappend, add(8)

reg dinf L(1/4).dinf L(1/2).ur if time<=tq(2016q3)
predict y1
replace y1 = y1 + 2
predict sf1, stdf
gen y1L = y1-1.645*sf1
gen y1U = y1+1.645*sf1

reg d2inf L(2/5).dinf L(2/3).ur if time<=tq(2016q3)
predict y2
replace y2 = y2 + 2
predict sf2, stdf
gen y2L = y2-1.645*sf2
gen y2U = y2+1.645*sf2

reg d3inf L(3/6).dinf L(3/4).ur if time<=tq(2016q3)
predict y3
replace y3 = y3 + 2
predict sf3, stdf
gen y3L = y3-1.645*sf3
gen y3U = y3+1.645*sf3

reg d4inf L(4/7).dinf L(4/5).ur if time<=tq(2016q3)
predict y4
replace y4 = y4 + 2
predict sf4, stdf
gen y4L = y4-1.645*sf4
gen y4U = y4+1.645*sf4

reg d5inf L(5/8).dinf L(5/6).ur if time<=tq(2016q3)
predict y5
replace y5 = y5 + 2
predict sf5, stdf
gen y5L = y5-1.645*sf5
gen y5U = y5+1.645*sf5

reg d6inf L(6/9).dinf L(6/7).ur if time<=tq(2016q3)
predict y6
replace y6 = y6 + 2
predict sf6, stdf
gen y6L = y6-1.645*sf6
gen y6U = y6+1.645*sf6

reg d6inf L(7/10).dinf L(7/8).ur if time<=tq(2016q3)
predict y7
replace y7 = y7 + 2
predict sf7, stdf
gen y7L = y7-1.645*sf7
gen y7U = y7+1.645*sf7

reg d6inf L(8/11).dinf L(8/9).ur if time<=tq(2016q3)
predict y8
replace y8 = y8 + 2
predict sf8, stdf
gen y8L = y8-1.645*sf8
gen y8U = y8+1.645*sf8
 
egen p=rowfirst(y1 y2 y3 y4 y5 y6 y7 y8) if time>=tq(2017q1)
egen pL=rowfirst(y1L y2L y3L y4L y5L y6L y7L y8L) if time>=tq(2017q1)
egen pU=rowfirst(y1U y2U y3U y4U y5U y6U y7U y8U) if time>=tq(2017q1)
label variable p "forecast"
label variable pL "lower 80% forecast interval"
label variable pU "upper 80% forecast interval"
tsline inf p pL pU if time>=tq(2013q1), title(Inflation Rate Forecast from Phillips Curve) lpattern (solid dash longdash shortdash)

