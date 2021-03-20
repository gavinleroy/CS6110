int X,Y;

int*p;

void f(int c) {
     int x,y;
     if (c<=0) x = 2;
 L:  if (c<=0) y = x + 1;
     X = x;
     Y = y;
     p = c ? &X : &x;
}

int main(int c) {
     f(c);
     return 0;
}

/*
Local Variables:
compile-command: "frama-c -val  address_written.c"
End:
*/
