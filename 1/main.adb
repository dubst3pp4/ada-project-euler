---------------------------------------------------------------------------
-- Multiples of 3 and 5                                                  --
-- Problem 1                                                             --
--                                                                       --
-- If we list all the natural numbers below 10 that are multiples of 3   --
-- or 5 we get 3, 5, 6 and 9. The sum of these multiples is 23,          --
--                                                                       --
-- Find the sum of all the multiples of 3 or 5 below 1000.               --
---------------------------------------------------------------------------

with Ada.Text_IO;

procedure Main is

   Multiple_One : constant Integer := 3;
   Multiple_Two : constant Integer := 5;
   Loop_Range   : Integer range 1..999;
   Sum          : Integer := 0;

begin

   for I in Integer range 1..999 loop

      if I mod Multiple_One = 0 or I mod Multiple_Two = 0 then

         Ada.Text_IO.Put_Line( Integer'image(Sum) & " +" & Integer'image(I) );
         Sum := Sum + I;

      end if;

   end loop;
   Ada.Text_IO.Put_Line("The sum is" & Integer'image(Sum) );
   
end Main;
