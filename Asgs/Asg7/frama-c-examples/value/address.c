int* x;
const char* y;
int* z;
int* t;

int p[3];
const char* string = "foobar";

void f(int c) {
     if (c) { x = &p[1]; } else  { x = &p[2]; }
     
     y = string;
     
     z = (int*)1024;

     t = (int*) ((int)x | 4096);
}

/*
Local Variables:
compile-command: "frama-c -val -main f address.c"
End:
*/
