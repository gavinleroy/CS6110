int abs (int x)
{ int __retres;
  if (x<0) {
    /*@ assert rte: signed_overflow: -2147483647 <= x; */
    __retres = -x;
    goto return_label;
  }
  else
    {
      __retres = x;
  goto return_label;
    }
 return_label: /* internal */ return __retres;
}

int main (int v) {
  int tmp;
  tmp = abs(v);
  return tmp;
}
