int extv;

main() {
  int a,b,c;
  char d,e,f;
  static statv;
  unsigned u;

  a=b>>1;
  a=b>>2;
  a=b>>3;
  a=b>>4;
  a=b>>5;
  a=b>>8;
  a=b>>9;
  a=b>>10;
  a=b>>11;
  a=b>>12;
  a=b>>c;
  a=(a+b)>>c;
  a=b>>(b+c);
  a=(a+b)>>(b+c);
  a=b>>d;
  a=(b+c)>>d;
  a=statv>>b;
  a=u>>2;
  a=u>>b;
  d=e>>1;
  d=e>>2;
  d=e>>3;
  d=e>>7;
  d=e>>8;
  d=e>>9;
  d=e>>f;
  d=e>>(e+f);
  d=(e+f)>>(e+f);
  d=(e+f)>>e;
  d=e>>a;

  a=b<<1;
  a=b<<2;
  a=b<<3;
  a=b<<4;
  a=b<<5;
  a=b<<8;
  a=b<<9;
  a=b<<10;
  a=b<<11;
  a=b<<12;
  a=b<<c;
  a=(a+b)<<c;
  a=b<<(b+c);
  a=(a+b)<<(b+c);
  a=b<<d;
  a=(b+c)<<d;
  a=statv<<b;
  a=u<<2;
  a=u<<b;
  d=e<<1;
  d=e<<2;
  d=e<<3;
  d=e<<7;
  d=e<<8;
  d=e<<9;
  d=e<<f;
  d=e<<(e+f);
  d=(e+f)<<(e+f);
  d=(e+f)<<e;
  d=e<<a;
}
