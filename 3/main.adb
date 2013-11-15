---------------------------------------------------------------------------
-- Largest prime factor                                                  --
-- Problem 3                                                             --
--                                                                       --
-- The prime factors of 13195 are 5, 7, 13 and 29.                       --
-- What is the largest prime factor of the number 600851475143 ?         --
---------------------------------------------------------------------------

with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

procedure Main is

   package Math renames Ada.Numerics.Elementary_Functions;
   package IO   renames Ada.Text_IO;

   type Prime_Type is new Long_Long_Integer range 1..Long_Long_Integer'Last;

   function Is_Prime( Number_To_Test : Prime_Type ) return Boolean is
   begin
      for I in Prime_Type range 2..Number_To_Test-1 loop
         if Number_To_Test mod I = 0 then
            return false;
            -- no prime when number is divideable by any other numbers than 1 and the number itself
         end if;
      end loop;
      return true;
      -- prime when number is divideable by only 1 and itself
   end Is_Prime;

   Number_To_Check         : constant Prime_Type := 600851475143;
   Largest_Factorial_Found : boolean             := false; 
   Number                  : Prime_Type;

begin

   Number := Prime_Type( Math.Sqrt( Float( Number_To_Check ) ) );

   while 1 < Number and false = Largest_Factorial_Found loop
      if Number_To_Check mod Number = 0 then
         if Is_Prime( Number ) then
            Largest_Factorial_Found := true;
         end if;
      end if;
      Number := Number - 1;
   end loop;

   IO.Put_Line( "The largest factorial is" & Prime_Type'Image( Number ) );

end Main;
