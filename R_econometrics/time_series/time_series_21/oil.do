clear all
use prices

gen dg = 100*(gasoline/L.gasoline - 1)
gen db = 100*(brent/L.brent - 1)

ac dg

reg dg db

reg dg db, r

newey dg db, lag(12)

newey dg L(0/6).db, lag(12)

newey dg L(0/5).d.db L6.db, lag(12)

