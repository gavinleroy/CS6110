int S=0;

int T[5];

int main(void) {
     int i;
     int *p = &T[0] ;
     for (i = 0; i < 5; i++) {
          Frama_C_dump_each();
          Frama_C_show_each_loop(i,p,S);
          S = S + i; *p++ = S; 
     }
     return S;
}

/*
Local Variables:
compile-command: "frama-c -val simple_show.c"
End:
*/
