-- Asg4 Q
-- $(E y: V x: p2(x,y)) => (V x: E y: p2(x,y))

some sig U { P2: U } -- universe

pred p2[x: U, y: U] { x->y in P2 }

assert A1 {
	((some y: U | all x: U | p2[x, y]) =>
		(all x: U | some y: U | p2[x,y]))
}

assert nA1 {
	!((some y: U | all x: U | p2[x, y]) =>
		(all x: U | some y: U | p2[x,y]))
}

check A1 for 8 U
check nA1
