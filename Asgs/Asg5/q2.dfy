// Gavin Gray
// University of Utah
// CS 6110,  Asg5, Q2

method g30(m: nat, n: nat) returns (PROD: nat)
  ensures PROD == m * n
{
  var M: nat;
  M := m;
  PROD := 0;
  while M > 0 
    decreases M
    invariant PROD == n * (m - M)
  {
    PROD := PROD + n;
    M := M - 1;
  }
}

