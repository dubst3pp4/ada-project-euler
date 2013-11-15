with Ada.Text_IO;

procedure Main is

   First  : Integer := 1;
   Second : Integer := 1;
   Fib    : Integer := 1;
   Fib_Max : constant Integer := 4000000;
   Sum    : Integer := 0;

begin

   Fibonacci:
   while Fib < Fib_Max loop

      if Fib mod 2 = 0 then
         Sum := Sum + Fib;
      end if;

      Fib    := First + Second;
      -- calculate the Fibonacci sequence

      Ada.Text_IO.Put_Line( Integer'Image(Fib) );

      First  := Second;
      Second := Fib;

   end loop Fibonacci;

   Ada.Text_IO.Put_Line( "the sum of all even Fibonacci numbers is: " & Integer'Image( Sum ) );

end Main;
