int x,y;

void main (int c) {
     if (c) { x = 10; } else { x = 33; }
     if (!c) { x++; } else { x--; }

     if (c<=0) { y = 42; } else { y = 36; }
     if (c>0) { y++; } else { y--; }
}

/*
Local Variables:
compile-command: "frama-c -val slevel.c"
End:
*/
