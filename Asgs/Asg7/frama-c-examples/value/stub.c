void getchar(char* p);

int main(char* string) {
     char c;
     int idx = 0;
     getchar(&c);
     while(string[idx]) {
          if (string[idx] == c) return idx;
          idx++;
     }
     return -1;
}

/*
Local Variables:
compile-command: "frama-c -val stub.c"
End:
*/
