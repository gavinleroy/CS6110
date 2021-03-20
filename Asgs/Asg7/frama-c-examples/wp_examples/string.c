#include "limits.h"

typedef unsigned int size_t;

void* memcpy(void* dest, void* src, size_t length) {
 for (size_t i = 0; i<length; i++) {
    ((char*)dest)[i] = ((char*)src)[i];
  }
  return dest;
}

size_t strlen(char* s) {
  unsigned int i = 0;
  while (s[i]) 
    i++;
  return i;
}

char* strcpy(char *s1, char* s2) {
  size_t i=0;
  while (s1[i]=s2[i])
    i++;
  return s1;
}

char *strncpy(char* s1, const char *s2, size_t n) {
  size_t i = 0;
  while (i < n && s2[i] !=0) {
    s1[i] = s2[i];
    i++;
  }
  while (i<n) {
    s1[i] = 0;
    i++;
  }
  return s1;
}

/*
Local Variables:
compile-command: "frama-c-gui string.c"
End:
*/
