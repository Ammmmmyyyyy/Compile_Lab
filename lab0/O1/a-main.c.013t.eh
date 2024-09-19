
;; Function main (main, funcdef_no=23, decl_uid=2545, cgraph_uid=24, symbol_order=23)

int main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.2556;

  a = 0;
  b = 1;
  i = 1;
  printf ("\xe8\xaf\xb7\xe8\xbe\x93\xe5\x85\xa5\xe4\xb8\x80\xe4\xb8\xaa\xe6\x95\xb0\xe5\xad\x97\xef\xbc\x9a");
  scanf ("%d", &n);
  printf ("%d\n", a);
  printf ("%d\n", b);
  goto <D.2553>;
  <D.2554>:
  t = b;
  b = a + b;
  printf ("%d\n", b);
  a = t;
  i = i + 1;
  <D.2553>:
  n.0_1 = n;
  if (i < n.0_1) goto <D.2554>; else goto <D.2552>;
  <D.2552>:
  D.2556 = 0;
  goto <D.2558>;
  <D.2558>:
  n = {CLOBBER};
  goto <D.2557>;
  D.2556 = 0;
  goto <D.2557>;
  <D.2557>:
  return D.2556;
}



;; Function printf (<unset-asm-name>, funcdef_no=15, decl_uid=964, cgraph_uid=16, symbol_order=15)

__attribute__((artificial, gnu_inline, always_inline))
__attribute__((nonnull (1), format (printf, 1, 2)))
int printf (const char * restrict __fmt)
{
  int D.2559;

  D.2559 = __printf_chk (1, __fmt, __builtin_va_arg_pack ());
  goto <D.2560>;
  <D.2560>:
  return D.2559;
}


