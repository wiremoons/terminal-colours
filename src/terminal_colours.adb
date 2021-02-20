-------------------------------------------------------------------------------
-- BUILD FILE  : Terminal_Colours.gpr                                         --
-- Description : Demo of Ada terminal color support                          --
-- Author      : Simon Rowe <simon@wiremoons.com>                            --
-- License     : MIT Open Source.                                            --
-------------------------------------------------------------------------------

-- Based on example source code from:
--    https://docs.adacore.com/gnatcoll-docs/terminals.html
--
-- to build:
--
--      gprbuild -P terminal_colours.gpr
--
-- to clean up:
--
--      gnatclean -P terminal_colours
--
-- to pretty format the code:
--
--     gnatpp -P terminal_colours.gpr
--

with Ada.Text_IO;       use Ada.Text_IO;
with GNATCOLL.Terminal; use GNATCOLL.Terminal;

procedure Terminal_Colours is

   Screen : Terminal_Info;

begin

   -- initialise screen outputs wanted
   Screen.Init_For_Stdout (Auto);
   Screen.Init_For_Stderr (Auto);

   Put_Line ("Checking for colour terminal support...");
   New_Line (1);
   Put_Line ("- Colour support: " & (if Screen.Has_Colors then "Ok" else "None"));
   Put_Line ("- ANSI support:   " & (if Screen.Has_ANSI_Colors then "Yes" else "No"));
   New_Line (1);
   Screen.Clear_To_End_Of_Line;

   -- Change Standard Output

   Put_Line ("Testing 'stdout':");
   Screen.Set_Color (Standard_Output, Blue, Yellow);
   Put_Line ("A blue on yellow line");
   Screen.Set_Style (Term => Standard_Output, Style => Bright);
   Put_Line ("A blue on yellow line with 'bright' style added");
   Set_Color (Self => Screen, Term => Standard_Output, Style => Reset_All, Foreground => Reset, Background => Reset);
   -- ensure the background colour is clearer properly before next output
   Screen.Beginning_Of_Line;
   Screen.Clear_To_End_Of_Line;

   Put_Line ("Reset all - as default now.");

   -- Normal colours
   New_Line (1);

   Screen.Set_Style (Style => Normal, Term => Standard_Output);
   Screen.Set_Fg (Color => Blue, Term => Standard_Output);
   Put_Line ("Normal blue text.");

   Screen.Set_Fg (Color => Green, Term => Standard_Output);
   Put_Line ("Normal green text.");

   Screen.Set_Fg (Color => Yellow, Term => Standard_Output);
   Put_Line ("Normal Yellow text.");

   Screen.Set_Fg (Color => Magenta, Term => Standard_Output);
   Put_Line ("Normal Magenta text.");

   Screen.Set_Fg (Color => Cyan, Term => Standard_Output);
   Put_Line ("Normal Cyan text.");

   Screen.Set_Fg (Color => Grey, Term => Standard_Output);
   Put_Line ("Normal Grey text.");

   Set_Color (Self => Screen, Term => Standard_Output, Style => Reset_All, Foreground => Reset, Background => Reset);
   Put_Line ("Reset all - as default now.");

   -- Bright colours
   New_Line (1);
   Screen.Set_Style (Style => Bright, Term => Standard_Output);
   Screen.Set_Fg (Color => Blue, Term => Standard_Output);
   Put_Line ("Bright blue text.");

   Screen.Set_Fg (Color => Green, Term => Standard_Output);
   Put_Line ("Bright green text.");

   Screen.Set_Fg (Color => Yellow, Term => Standard_Output);
   Put_Line ("Bright Yellow text.");

   Screen.Set_Fg (Color => Magenta, Term => Standard_Output);
   Put_Line ("Bright Magenta text.");

   Screen.Set_Fg (Color => Cyan, Term => Standard_Output);
   Put_Line ("Bright Cyan text.");

   Screen.Set_Fg (Color => Grey, Term => Standard_Output);
   Put_Line ("Bright Grey text.");

   Screen.Set_Color (Standard_Output, Style => Reset_All);
   Put_Line ("Reset all - as default now.");

   -- Change Standard Output
   New_Line (1);
   Put_Line ("Testing 'stderr':");
   Screen.Set_Color (Standard_Error, Red, Unchanged);
   Put_Line (Standard_Error, "A red on 'Unchanged' line");
   Screen.Set_Style (Style => Bright, Term => Standard_Error);
   Put_Line (Standard_Error, "A bright red on 'Unchanged' line");

   Screen.Set_Color (Standard_Error, Style => Reset_All);
   Put_Line ("Back to standard colors -- 'Reset_All'");

   New_Line (1);
   Put_Line ("Testing 'cursor management'");
   New_Line (1);
   Put_Line ("Increment to '40'...");
   for J in 1 .. 40 loop
      if J mod 10 = 0 then
         Put ("Processing file :");
         Screen.Set_Fg (Green);
         Put (J'Img);
         Screen.Set_Fg (Cyan);
         Put (" with long name");
         Screen.Set_Fg (Reset);
         delay 0.2;

      else
         Put ("Processing file :" & J'Img);
      end if;
      delay 0.2;
      Screen.Beginning_Of_Line;
      Screen.Clear_To_End_Of_Line;
   end loop;

   Put_Line ("End.");

end Terminal_Colours;
