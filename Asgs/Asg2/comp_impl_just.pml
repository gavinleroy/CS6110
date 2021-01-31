// Promela program for Asg2-1
bit x,y;
// Proctype to test all possible combinations of
// {x, y}
active proctype test() 
{ do
  :: x=!x
  :: y=!y
  od
}

never  {    /* !(([]<>x -> []<>y) -> (<>[]x -> []<>y)) */
T0_init:
	do
	:: (! ((y)) && (x)) -> goto T0_S918
	:: (! ((y)) && (x)) -> goto T0_S1228
	:: (! ((y))) -> goto T0_S939
	:: (! ((x)) && ! ((y))) -> goto T0_S1181
	:: (! ((y))) -> goto T0_S1236
	:: ((x)) -> goto T0_S968
	:: ((x)) -> goto T0_S796
	:: (1) -> goto T0_S997
	:: (! ((x))) -> goto T0_S1199
	:: (1) -> goto T0_S1168
	od;
T0_S796:
	do
	:: (! ((y)) && (x)) -> goto T0_S1228
	:: ((x)) -> goto T0_S796
	od;
T0_S918:
	do
	:: (! ((y)) && (x)) -> goto T0_S918
	od;
T0_S939:
	do
	:: (! ((y)) && (x)) -> goto T0_S918
	:: (! ((y))) -> goto T0_S939
	od;
T0_S968:
	do
	:: (! ((y)) && (x)) -> goto T0_S918
	:: ((x)) -> goto T0_S968
	od;
T0_S997:
	do
	:: (! ((y))) -> goto T0_S939
	:: (1) -> goto T0_S997
	:: (! ((y)) && (x)) -> goto T0_S918
	:: ((x)) -> goto T0_S968
	od;
T0_S1181:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S1181
	od;
T0_S1199:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S1181
	:: (! ((x))) -> goto T0_S1199
	od;
T0_S1168:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S1181
	:: ((x)) -> goto T0_S796
	:: (! ((x))) -> goto T0_S1199
	:: (1) -> goto T0_S1168
	:: (! ((y)) && (x)) -> goto T0_S1228
	:: (! ((y))) -> goto T0_S1236
	od;
T0_S1228:
	do
	:: (! ((y)) && (x)) -> goto T0_S1228
	od;
T0_S1236:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S1181
	:: (! ((y)) && (x)) -> goto T0_S1228
	:: (! ((y))) -> goto T0_S1236
	od;
}

