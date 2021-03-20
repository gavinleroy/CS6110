int S=0;

int T[5];

int main(void) {
     int i;
     int *p = &T[0] ;
     for (i = 0; i < 5; i++) {
          S = S + i; *p++ = S; 
     }
     return S;
}

/*
Local Variables:
compile-command: "frama-c -val simple.c"
End:
*/
