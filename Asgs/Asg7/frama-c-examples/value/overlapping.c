
int c,x;

char t[6];

void main(void) {
     t[0] = c ? 1 : 2;
     *(int*)(t+1) = c ? 3 : 4;
     *(t+3) = 5;
     x = *(int*)(t+1);
}

/*
Local Variables:
compile-command: "frama-c -val overlapping.c -lib-entry"
End:
*/
