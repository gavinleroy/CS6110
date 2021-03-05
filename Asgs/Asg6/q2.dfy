// Find the max in an array a[0]..a[a.Length-1]
// If the array length is 0, return 0
method maxarr(a: array?<int>) returns (max:int)
  requires a != null
  ensures forall i :: 0 <= i < a.Length ==> max >= a[i]
  //a- Introduce another ensures clause as requested.
  //a- You may want to make this ``ensures'' apply
  //a- for arrays of length > 0. You can use the abbreviation {\tt ``a[..]''}
  //a- which is a Dafny notation for the entire array being viewed as a sequence.
  //a- See the document dafny4-reference.pdf, page 52 (table at the bottom).
  /* ensures old(a[..]) == a[..] */
{ 
  max := 0;
  if (a.Length==0) { return; }
  var i := 0;
  while (i < a.Length)
    decreases a.Length - i
    invariant 0 <= i <= a.Length
    invariant forall j :: 0 <= j < i ==> max >= a[j]
    //a- place a new invariant corresponding to the new ``ensures''
    //a- Be sure to ``protect'' this invariant so that it does not run into undefined cases
    //a- (say, upon first visit or last visit)
    //
    //a- If you get stuck, ask me for hints on how I did this part.
  {
    if (a[i] > max) 
      { max := a[i]; }
    i := i + 1;
  }
}

