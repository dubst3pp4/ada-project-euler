---------------------------------------------------------------------------
-- Largest palindrome product                                            --
-- Problem 4                                                             --
--                                                                       --
-- A palindromic number reads the same both ways. The largest palindrome --
-- made from the product of two 2-digit numbers is 9009 = 91 × 99.       --
-- Find the largest palindrome made from the product of two 3-digit      --
-- numbers.                                                              --
---------------------------------------------------------------------------

with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Main is

   package IO renames Ada.Text_IO;
   package SF renames Ada.Strings.Fixed;

   function Reverse_String( Item : String ) return String is
      Item_Reverse : String( Item'Range );
   begin
      for I in Item'Range loop
         Item_Reverse( Item_Reverse'Last - I + Item'First ) := Item( I );
      end loop;
      return Item_Reverse;
   end Reverse_String;

   function Is_Palindrome( Item : String ) return Boolean is
      Half_Length        : constant Integer := Integer( Float'Floor( Float(Item'Length) / Float(2) ) );
      Part_A             : constant String  := Item( Item'First..Half_Length );
      Part_A_Lower_Bound : constant Integer := Item'Last - Half_Length;
      Part_B             : constant String  := Item( Part_A_Lower_Bound+1..Item'Last );
   begin
      if Half_Length = 1 then
         return true;
      end if;
      if Part_A = Reverse_String( Part_B ) then
         return true;
      end if;
      return false;
   end Is_Palindrome;

   Max_Factor         : constant Integer := 999;
   Factor_A           : Integer          := 0;
   Factor_B           : Integer          := 0;
   Product            : Integer          := 0;
   Largest_Palindrome : Integer          := 0;

begin

   A_Loop:
   for I in reverse 100..Max_Factor loop

      B_Loop:
      for J in reverse 100..I loop

         Product  := I * J;
         if Is_Palindrome( 
               SF.Trim( Integer'Image( Product ), Ada.Strings.Left) 
            ) then
            if Product > Largest_Palindrome then
               Factor_A           := I;
               Factor_B           := J;
               Largest_Palindrome := Product;
            end if;
         end if;

      end loop B_Loop;

   end loop A_Loop;

   IO.Put_Line( "the largest palindrom made by a product of 2 three-digit numbers is"
                & " the product of"
                & Integer'Image( Factor_A ) & " *" & Integer'Image( Factor_B )
                & " ="
                & Integer'Image( Largest_Palindrome ) 
   );

end Main;
