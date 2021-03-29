with Ada.Text_IO;use Ada.Text_IO;
with dcola;
procedure Main is
   subtype  tnom is  String (1..50);
   type  tjugador  is
      record
         nom: tnom;
         l: natural;
      end  record;
   package dcola_jugador is new dcola(tjugador);
   use dcola_jugador;

   dnom: String(1..50); --temp
   f_entrada : File_Type;
   jugador : tjugador;
   c: cola;
begin
   Open(f_entrada, Mode => In_File, Name => "jugadores.txt");
   while not End_Of_File(f_entrada) loop
      get_line(f_entrada, dnom, jugador.l);
      Put_Line(dnom(1..jugador.l)); --pruebas
      jugador.nom:=tnom(dnom);
      poner(c,jugador);
   end loop;

   while not is_last_item(c) loop
      jugador:= coger_primero(c);

      Put_Line(jugador.nom(1..jugador.l)); --pruebas
      borrar_primero(c);
   end loop;

   Close(f_entrada);


end Main;
