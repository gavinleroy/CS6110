typedef unsigned int size_t;

/*@ requires \valid(((char *)dest)+(0..length-1));
  requires \valid_read(((char *)src)+(0..length-1));
  requires \separated(((char *)dest)+(0..length-1),((char *)src)+(0..length-1));
  assigns ((char *)dest)[0..length-1];
  ensures \forall integer i; 0<=i<length ==>
  ((char *)dest)[i] == ((char *)src)[i];
  ensures \result == dest;
 */
void* memcpy(void* dest, void* src, size_t length) {
  /*@ 
    loop invariant 0<=i<=length;
    loop invariant \forall integer j; 0<=j<i ==> ((char *)dest)[j] == ((char *)src)[j];
    loop assigns i,((char*)dest)[0..i-1];
    loop variant length - i;
  */
  for (size_t i = 0; i<length; i++) {
    ((char*)dest)[i] = ((char*)src)[i];
  }
  return dest;
}

/*@
axiomatic String_length {
logic size_t strlen{L}(char *s) reads \at(s[0..],L);
axiom strlen_null{L}: \forall char *s; s[strlen(s)] == 0;
axiom strlen_first{L}: \forall char *s, integer i; 0<=i<strlen(s) ==> s[i] != 0;
}
*/

/* @
  lemma len_zero_contra{L}: \forall size_t i, char* s; 
  s[i] != 0 ==> i != strlen(s);
*/

/*@ predicate valid_string{L}(char *s) = \valid(s+(0..strlen(s))); */

/*@ requires valid_string(s);
  ensures \result == strlen(s);
  assigns \nothing;
*/
size_t strlen(char* s) {
  unsigned int i = 0;
  /*@ loop invariant \forall integer j; 0<= j < i ==> s[j] !=0;
    loop invariant 0<= i <= strlen(s);
    loop assigns i;
    loop variant strlen(s) - i;
  */
  while (s[i]) //@ assert i!=strlen(s); 
    i++;
  return i;
}

/*@ requires valid_string(s2);
    requires \valid(s1+(0..strlen(s2)));
    requires \separated(s1+(..),s2+(..));
    assigns s1[0..strlen(s2)];
    ensures \result == s1;
    ensures \forall integer i; 0<=i<=strlen(s2) ==> s1[i] == s2[i];
*/
char* strcpy(char *s1, char* s2) {
  size_t i=0;
  /*@ loop invariant 0<=i<=strlen{Pre}(s2);
      loop invariant strlen(s2) == strlen{Pre}(s2);
      loop invariant \forall integer j; 0<=j< i ==> s2[j] != 0;
      loop invariant \forall integer j; 0<=j< i ==> s1[j] == s2[j];
      loop assigns i,s1[0..strlen{Pre}(s2)];
      loop variant strlen{Pre}(s2) - i;
  */
  while (s1[i]=s2[i])
    //@ assert i != strlen{Pre}(s2);
    i++;
  return s1;
}

/*@ requires valid_string(s2);
    requires \valid(s1+(0..n-1));
    requires \separated(s1+(..),s2+(..));
    assigns s1[0..n-1];
    ensures \result == s1;
    behavior s2_short:
    assumes strlen(s2)<n;
    ensures \forall integer i; 0<=i<strlen{Pre}(s2) ==> s1[i] == s2[i];
    ensures \forall integer i; strlen{Pre}(s2)<=i<n ==> s1[i] == 0;
    behavior s2_long:
    assumes strlen(s2)>=n;
    ensures \forall integer i; 0<=i<n ==> s1[i] == s2[i];
    complete behaviors;
    disjoint behaviors;
*/
char *strncpy(char* s1, const char *s2, size_t n) {
  size_t i = 0;
  /*@ 
    loop invariant 0<=i<=n;
    loop invariant i<=strlen{Pre}(s2);
    loop invariant strlen(s2) == strlen{Pre}(s2);
    loop invariant \forall integer j; 0<=j<i ==> s2[j] !=0;
    loop invariant \forall integer j; 0<=j<i ==> s1[j] == s2[j];
    loop assigns i,s1[0..n-1];
    loop variant n-i;
  */
  while (i < n && s2[i] !=0) {
    s1[i] = s2[i];
    i++;
  }
  /*@ for s2_short: assert s2[i] == 0; */
  /*@ for s2_short: assert i == strlen{Pre}(s2); */
  /*@ for s2_short: assert i<n; */
  /*@
    loop invariant 0<=i<=n; //only for RTE
    loop assigns i,s1[0..n-1]; //only for RTE
    for s2_short: loop invariant \forall integer j;
    0<= j < strlen{Pre}(s2) ==> s1[j] == s2[j];
    for s2_short: loop invariant strlen{Pre}(s2)<=i<=n;
    for s2_short: loop invariant \forall integer j; strlen{Pre}(s2)<=j<i ==> s1[j] == 0;
    for s2_short: loop assigns i,s1[strlen{Pre}(s2)..i-1];
    for s2_long: loop invariant i == n;
    for s2_long: loop invariant \forall integer j; 0<=j<n ==> s1[j] == s2[j];
    for s2_long: loop assigns \nothing;
    loop variant n-i;
  */
    while (i<n) {
    s1[i] = 0;
    i++;
  }
  return s1;
}

/*
Local Variables:
compile-command: "frama-c-gui string.c"
End:
*/
