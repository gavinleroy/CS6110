int R;
void abs(int x) {
     R = x >= 0 ? x : -x;
}

/*
Local Variables:
compile-command: "frama-c -val -main abs -lib-entry abs.c"
End:
*/
