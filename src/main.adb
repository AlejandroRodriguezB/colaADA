with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
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

   dnom: String(1..50);  --String temp para la creacion de jugadors
   f_entrada : File_Type;
   jugador : tjugador;
   c: cola;
   i:Natural; --numero de pasades
begin
   Put_Line("Listado de jugadores:");
   Open(f_entrada, Mode => In_File, Name => "jugadores.txt"); --abrimos el fichero que contiene los jugadres
   while not End_Of_File(f_entrada) loop
      get_line(f_entrada, dnom, jugador.l); --lee una linea
      Put_Line(dnom(1..jugador.l));
      jugador.nom:=tnom(dnom);
      poner(c,jugador); --añade el jugador a la cola
   end loop;
   Close(f_entrada);--cerramos el fichero de los jugadores

   Put_Line("Elije el numero de pasadas: ");
   Get(i);  --Leemos por texto el numero de saltos

   while not is_last_item(c) loop --loop hasta que solo quede un jugador

      for j in 1..i loop --loop para pasar jugadores
         jugador:= coger_primero(c);
         Put_Line("Pasada:" & jugador.nom(1..jugador.l));
         borrar_primero(c); --borramos el jugador del primero
         poner(c,jugador); -- y lo ponemos el ultimo
      end loop;

      jugador:= coger_primero(c); --eliminamos un jugador permanentemente
      Put_Line("Eliminado: " & jugador.nom(1..jugador.l));
      borrar_primero(c);
   end loop;

   jugador:= coger_primero(c); --imprimimos el ultimo jugador
   Put_Line("Ultimo jugador: " & jugador.nom(1..jugador.l));



end Main;
