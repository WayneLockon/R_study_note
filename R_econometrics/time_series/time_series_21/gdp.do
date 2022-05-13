clear all

use gdp

reg gdp L(1/3).gdp, r

* AIC comparison 
reg gdp if time>=tq(1948q4)
estimates store m0
reg gdp L.gdp if time>=tq(1948q4)
estimates store m1
reg gdp L(1/2).gdp if time>=tq(1948q4)
estimates store m2
reg gdp L(1/3).gdp if time>=tq(1948q4)
estimates store m3
reg gdp L(1/4).gdp if time>=tq(1948q4)
estimates store m4
reg gdp L(1/5).gdp if time>=tq(1948q4)
estimates store m5
reg gdp L(1/6).gdp if time>=tq(1948q4)
estimates store m6
estimates stats m0 m1 m2 m3 m4 m5 m6

summarize gdp if (time <= tq(1956q4))
summarize gdp if (time >= tq(1957q1))*(time <= tq(1976q4))
summarize gdp if (time >= tq(1977q1))*(time <= tq(1996q4))
summarize gdp if (time >= tq(1997q1))

reg gdp L.gdp if (time <= tq(1956q4)), r 
reg gdp L.gdp if (time >= tq(1957q1))*(time <= tq(1976q4)), r
reg gdp L.gdp if (time >= tq(1977q1))*(time <= tq(1996q4)), r
reg gdp L.gdp if (time >= tq(1997q1)), r
