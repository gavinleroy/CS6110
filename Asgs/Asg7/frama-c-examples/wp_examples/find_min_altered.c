/*@ requires length > 0 && \valid(a+(0..length-1));
    assigns \nothing;
    ensures 0<=\result<length &&
      (\forall integer j; 0<=j<length ==> a[\result]<=a[j]);*/
int find_min(int* a, int length) {
  int min, min_idx;
  min_idx = 0;
  min = a[0];
  /*@ loop invariant 0<=i<=length && 0<=min_idx<length;
      loop invariant \forall integer j; 0<=j<i ==> min<=a[j];
      loop invariant a[min_idx]==min;
      loop assigns min, min_idx, i;
      loop variant length - i; */
  for (int i = 1; i<length; i++) {
    if (a[i] < min) {
      min_idx = i;
      min = a[i];
    }
  }
  return min_idx;
}

/*@ requires length > 0 && \valid(a+(0..length-1));
    assigns \nothing;
    ensures \result == 1 || \result == 0
    ensures (\result == 1) ==> find_min(a, lenght) > 4 
    ensures (\result == 0) ==> find_min(a, lenght) <= 4 */
int is_g_four(int* a, int length) {
  int is_lt_four = 0, t;
  /*@ loop invariant 1<=i<=length
      loop invariant \forall integer j; 0<=j<i ==> t<=a[j];
      loop assigns t, i
      loop variant length - i; 
      ensures t > 4 ==> is_lt_four == 1
      ensures t <= 4 ==> is_lt_four == 0 */
  for (int i = 1; i<=length; i++)
    t = find_min(a, i);
  return is_lt_four;
}
