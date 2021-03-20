#define N 10
int main(void){
int a[N] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int i, n, result;
for (i=0; i < N; i++)
  { result = find(N, a, i);
  //@ assert result == i;
  }
return 0;
}
  
