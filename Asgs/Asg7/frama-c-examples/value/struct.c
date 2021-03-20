struct S {
     int* mypointer;
     short myshort;
} S;

char T[sizeof(struct S)];

int x;

void main (int c) {
     if(c) { x = 3; } else { x = 24; }
     S.mypointer = &x;
     S.myshort = 12;
     *(int*)T = &x;
     *(short *)((int*)T + 1) = 12;
}

/*
Local Variables:
compile-command: "frama-c -val struct.c"
End:
*/
