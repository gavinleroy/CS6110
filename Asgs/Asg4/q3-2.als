-- Asg4 Q3.2
-- (E x: E y: p2(x,y)) => (E x: p2(x,x))

some sig U { P2: U } -- universe

--sig S1 extends U {} -- set for p2

pred p2[x: U, y: U] { x->y in P2 }

assert A1 {
	((some x: U | some y: U |  p2[x, y]) => (some x: U | p2[x,x]))
}

assert nA1 {
	!((some x,y: U | p2[x, y]) => (some x: U | p2[x, x]))
}

check A1 for 8 U
--check nA1
