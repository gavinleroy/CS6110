// Find the max in an array a[0]..a[a.Length-1]
// If the array length is 0, return 0
method maxarr(a: array?<int>) returns (max: int)
  requires a != null // (1)
  ensures forall i :: 0 <= i < a.Length ==> max >= a[i] // (2)
  ensures (a.Length == 0) || (exists i :: (0 <= i < a.Length) && max == a[i]) // (8)
{ 
  max := 0; // (3)
  if (a.Length == 0) { return; }
  var i := 1; // (10)
  max := a[0]; // (11)
  while (i < a.Length)
    decreases a.Length - i // (4)
    invariant 0 <= i <= a.Length // (5)
    invariant forall j :: 0 <= j < i ==> max >= a[j] // (6)
    invariant exists j :: 0 <= j < i && max == a[j] // (9)
  {
    if (a[i] > max) 
      { max := a[i]; } // (7)
    i := i + 1;
  }
}

