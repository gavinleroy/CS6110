#include <iostream>

#define N 5
#define minI 1

using namespace std;

void print_arr(int a[]) {
  for(int i = minI; i < N; i++) 
    cout << a[i] << " ";
  cout << endl;
}

int main() {

  int t, aa[] = {0, 1, 1, 0, 0};

  do {
    t = aa[minI];

    print_arr(aa);

    for(int j = minI+1; j < N; j++) {
      if (aa[j-1] > aa[j]) {
        t = aa[j-1];
        aa[j-1] = aa[j];
        aa[j] = t;
      }
    }
  } while(t != aa[minI]);

  print_arr(aa);

  return 0;
}
