a = int (raw_input())
def fib(a):
   if a <= 2:
       return a
   else:
       return (fib(a-1) +fib(a-2))

b = fib(a)
if b != 55:
    print "Sorry Try again"
else:
    print "So you got that one.Try this one"

   
