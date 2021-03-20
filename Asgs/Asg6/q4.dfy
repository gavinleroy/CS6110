// Sum an array a[0]..a[a.Length-1] i.e. sum [0..Max)
// The following is the specification for the summation program
function recsum(a: array?<int>,Max:nat) : int 
  reads a             // This is necessary - see dafny4-reference.pdf
  requires a != null  
  requires 0 <= Max <= a.Length
  decreases Max
{ 
  if a.Length == 0 then 0
  else if 0 == Max then 0
  else a[Max - 1] + recsum(a, Max-1) // (1)
}

method sumarr(a: array?<int>) returns (sum:int)
  requires a != null
  ensures sum == recsum(a,a.Length)
{
  sum := 0;
  if (a.Length==0) {return;}
  var i : int := 0;
  while (i < a.Length)
  invariant 0 <= i <= a.Length // (2)
  invariant sum == recsum(a, i) // (3)
  decreases a.Length - i // (4)
  {
    sum := sum + a[i]; i:=i+1;
  }
}

