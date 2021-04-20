/* Gavin Gray
 * Bug 39861 tests
 * University of Utah
 * CS 6110, Spring 21
 * */

#include <cstdio>

/* transformation in question */
/* declare i1 @pv(i8 %x, i8 %y) { */
/*   %tmp0 = lshr i8 255, %y */
/*   %tmp1 = and i8 %tmp0, %x */
/*   %ret = icmp sge i8 %tmp1, %x */
/*   ret i1 %ret */
/* } */
/* => */
/* declare i1 @pv(i8 %x, i8 %y) { */
/*   %tmp0 = lshr i8 255, %y */
/*   %1 = icmp sge i8 %tmp0, %x */
/*   ret i1 %1 */
/* } */

bool src(char x, char y) {
//   %tmp0 = lshr i8 255, %y
  char tmp0 = (unsigned char)0b11111111 >> (unsigned char)y;
//   %tmp1 = and i8 %tmp0, %x
  char tmp1 = tmp0 & x;
//   %ret = icmp sge i8 %tmp1, %x
  bool ret = tmp1 >= x;
//   ret i1 %ret
  return ret;
}

bool tgt(char x, char y) {
//   %tmp0 = lshr i8 255, %y
  char tmp0 = (unsigned char)0b11111111 >> (unsigned char)y;
//   %1 = icmp sge i8 %tmp0, %x
  bool ret = tmp0 >= x;
//   ret i1 %1
  return ret;
}

int main() {
  int same = 0, diff = 0; 
  for( unsigned char x = 0; x < 255; x++ ) {
    for( unsigned char y = 0; y < 255; y++ ) {
      if( src(x, y) == tgt(x, y) ) same++;
      else {
        diff++;
        printf("src(%d, %d) = %d\n", x, y, src(x, y));
        printf("tgt(%d, %d) = %d\n\n", x, y, tgt(x, y));
      }
    }
  }
  if( src(255, 0) == tgt(255, 0) ) same++;
  else {
    diff++;
    printf("src(%d, %d) = %d\n", 255, 0, src(255, 0));
    printf("tgt(%d, %d) = %d\n\n", 255, 0, tgt(255, 0));
  }
  /* unsigned char x = 62, y = 0; */
  /* printf("src(%d, %d) = %d\n", x, y, src(x, y)); */
  /* printf("tgt(%d, %d) = %d\n\n", x, y, tgt(x, y)); */
  printf("similarity count : %d\ndifference count : %d\n", same, diff);
}

