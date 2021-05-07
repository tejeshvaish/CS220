
     int mult3( int *dst, int *src)
    {
        int sum = 0;
        int i;
           int n; // no.of element in arrary
           cin>>n;
        for (i = 0; i < n; i++)
           sum += dst[i] * src[i];
       return sum;
   }
