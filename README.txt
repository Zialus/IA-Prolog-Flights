Só é garantido que o código funcione bem em SWI-Prolog
$ swipl

Para usar a versão simples basta consultar os ficheiros flights e timetables:
?- [flights,timetables].

Os predicados a usar são:

directFlight/3

directFlight(+Partida, +Destino, -Dias)

indirectFlight/4

indirectFlight(+Partida, +Destino, ?Dia, -Rota)

findCircuit/4

findCircuit(+Partida_e_Destino, +Dia_de_Partida, +Lista_de_Cidades_a_Visitar, -Rota)


Para usar a versão com menu é necessario consultar tambem os ficheiros menu e utilities:
?- [flights,timetables,menu,utilities].

Nesse caso basta chamar o predicado: mainMenu/0.
