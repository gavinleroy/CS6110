method Abs(x: int) returns (x': int)
  ensures x' >= 0
  ensures (x < 0 && x' == x*-1) || x' == x
{
  x' := x;
  if(x' < 0) { x' := x' * -1;  }
}
