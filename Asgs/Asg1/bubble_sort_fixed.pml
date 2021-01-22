#define Size 5
#define aMinIndx 1
#define aMaxIndx (Size-1)
/* Gonna "waste" a[0] because Sedgewick uses 1-based arrays*/
active proctype bubsort()
{ 
  byte j, t, c;
  bit a[Size];
  /* Nondeterministic array initialization */
  do ::break ::a[1]=1 ::a[2]=1 ::a[3]=1 ::a[4]=1 od;              

  t=a[aMinIndx];
  j=aMinIndx+1;

  do
  :: (j > (aMaxIndx)) -> break
  :: (j <= (aMaxIndx)) -> 
    if
    :: (a[j-1] > a[j]) -> t=a[j-1]; a[j-1]=a[j]; a[j]=t; c++
    :: (a[j-1]<= a[j])
    fi;
    j++
  od;

  do
  :: c!=0 -> t=a[aMinIndx]; j=aMinIndx+1; c=0
    do
    :: (j > (aMaxIndx)) -> break
    :: (j <= (aMaxIndx)) -> 
      if
      :: (a[j-1] > a[j]) -> t=a[j-1]; a[j-1]=a[j]; a[j]=t; c++
      :: (a[j-1] <= a[j])
      fi;
    j++                       
    od;                      
  :: c==0 -> break
  od; 

  /*  Comb from location-1 to look for sortedness  */
  t=1;                                                        
  do
  :: t < aMaxIndx-1 -> t++
  :: t > aMinIndx -> t--
  :: a[t] > a[t+1] -> assert(0)
  od;
}

