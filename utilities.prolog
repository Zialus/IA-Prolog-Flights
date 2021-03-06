%========================%
%= @@ console utilities =%
%========================%
pressEnterToContinue:-
	write('Press <Enter> to continue.'), nl,
	waitForEnter, !.

waitForEnter:-
	get_char(_).

clearConsole:-
	clearConsole(5), !.

clearConsole(0).
clearConsole(N):-
	nl,
	N1 is N-1,
	clearConsole(N1).

getChar(Input):-
	get_char(Input),
	get_char(_).

getCode(Input):-
	get_code(TempInput),
	get_code(_),
	Input is TempInput - 48.

getInt(Input):-
	get_code(TempInput),
	Input is TempInput - 48.

discardInputChar:-
	get_code(_).
