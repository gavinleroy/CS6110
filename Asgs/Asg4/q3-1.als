-- Asg4 Q3.1
-- p1(x) => q1(y)
some sig U {} -- define a non-empty universe

sig S1 extends U {} -- help define p1
sig S2 extends U {} -- help define q1

pred p1[x: U] { x in S1 }
pred q1[x: U] { x in S2 }

-- Assert for the Existential Case
assert A1   { (all x: U | p1[x]) => (some y: U | q1[y]) }
-- 
assert nA1 { !(all x: U | p1[x]) => (some y: U | q1[y]) }


-- Assert for the Universal Case
assert B1   { (all x: U | p1[x]) => (all y: U | q1[y]) }
-- 
assert nB1 { !(all x: U | p1[x]) => (all y: U | q1[y]) }


check A1 for 8 U
check nA1

check B1 for 8 U
check nB1
