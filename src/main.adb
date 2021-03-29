with Ada.Text_IO;use Ada.Text_IO;
procedure Main is
   f_entrada : File_Type;
   tnom : String(1..50);
   l: Natural;

begin
   Open(f_entrada, Mode => In_File, Name => "jugadores.txt");
   while not End_Of_File(f_entrada) loop
      get_line(f_entrada, tnom, l);
      Put_Line(tnom(1..l));
   end loop;

   Close(f_entrada);

end Main;
