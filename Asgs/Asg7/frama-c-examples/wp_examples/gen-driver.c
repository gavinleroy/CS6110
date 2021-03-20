
#define N 10

/*@ requires 0 <= n && \valid(a+(0..n-1));
  assigns \nothing;
  ensures \result == -1
   ==> (\forall integer i; 0 <= i < n ==> a[i] != v);
  ensures 0 <= \result < n ==> a[\result] == v;
  ensures -1 <= \result < n;
*/

int find(int n, const int a[], int v){
int i;
/*@ loop invariant 0 <= i <= n;
loop invariant \forall integer j; 0 <= j < i ==> a[j] != v;
loop assigns i;
loop variant n - i;
*/
for (i=0; i < n; i++) {
  if (a[i] == v) { return i; }
}
return -1;
}

int main(void)
 { int a[N];
   int i, n, result;

   for (i = 0; i < N; i++)
   a[i] = Frama_C_interval(-2147483647, 2147483648);
   
   while (1) {
   n = Frama_C_interval(0, N);
   result = find(n, a, 0);
   }
   return 0;
}
