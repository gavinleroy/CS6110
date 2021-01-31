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

never  {    /*  ! ((<>[]x -> []<>y) -> ([]<>x -> []<>y))  */
T0_init:
	do
	:: (! ((y)) && (x)) -> goto T2_S1319
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((y))) -> goto T0_S1319
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y))) -> goto T0_S2338
	:: (1) -> goto T0_S977
	:: (1) -> goto T0_S2766
	:: ((x)) -> goto T0_S1941
	od;
accept_S739:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T0_S2258
	:: (! ((y))) -> goto T0_S739
	od;
accept_S2032:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T0_S2258
	:: (! ((y)) && (x)) -> goto T0_S739
	:: (! ((y))) -> goto T0_S2338
	od;
T2_S739:
	do
	:: (! ((x)) && ! ((y))) -> goto accept_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((x)) && ! ((y))) -> goto accept_S739
	:: (! ((y))) -> goto T2_S739
	od;
T2_S1319:
	do
	:: (! ((y))) -> goto T2_S1319
	od;
T2_S2258:
	do
	:: (! ((x)) && ! ((y))) -> goto accept_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((x)) && ! ((y))) -> goto accept_S739
	:: (! ((y))) -> goto T2_S2338
	od;
T2_S2338:
	do
	:: (! ((x)) && ! ((y))) -> goto accept_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((x)) && ! ((y))) -> goto accept_S739
	:: (! ((y)) && (x)) -> goto T2_S739
	:: (! ((y))) -> goto T2_S2338
	od;
T0_S739:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((y))) -> goto T0_S739
	:: (! ((y)) && (x)) -> goto T2_S739
	od;
T0_S1319:
	do
	:: (! ((y)) && (x)) -> goto T2_S1319
	:: (! ((y))) -> goto T0_S1319
	od;
T0_S977:
	do
	:: (! ((y))) -> goto T0_S1319
	:: (! ((y)) && (x)) -> goto T2_S1319
	:: (1) -> goto T0_S977
	od;
T0_S2032:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((y)) && (x)) -> goto T2_S739
	:: (! ((y))) -> goto T0_S2338
	od;
T0_S2258:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((x)) && ! ((y))) -> goto T0_S739
	:: (! ((y))) -> goto T0_S2338
	od;
T0_S2338:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((x)) && ! ((y))) -> goto T0_S739
	:: (! ((y)) && (x)) -> goto T2_S739
	:: (! ((y))) -> goto T0_S2338
	od;
T0_S2766:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (1) -> goto T0_S2766
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((y)) && (x)) -> goto T2_S2338
	:: (! ((y))) -> goto T0_S2338
	:: ((x)) -> goto T0_S1941
	od;
T0_S1941:
	do
	:: (! ((x)) && ! ((y))) -> goto T0_S2032
	:: (! ((y)) && (x)) -> goto T2_S2258
	:: (! ((y))) -> goto T0_S2338
	:: (1) -> goto T0_S2766
	:: ((x)) -> goto T0_S1941
	od;
}

