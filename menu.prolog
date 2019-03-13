%=================%
%= @@ main menus =%
%=================%
mainMenu:-
	printMainMenu,
	getChar(Input),
	(
		Input = '1' -> chooseModeMenu, mainMenu;
		Input = '2' -> helpMenu, mainMenu;
		Input = '3' -> aboutMenu, mainMenu;
		Input = '4';

		nl,
		write('Error: invalid input.'), nl,
		pressEnterToContinue, nl,
		mainMenu
	).

printMainMenu:-
	clearConsole,
	write('================================='), nl,
	write('=       ..:: Flights ::..       ='), nl,
	write('================================='), nl,
	write('=                               ='), nl,
	write('=   1. Choose Mode              ='), nl,
	write('=   2. README                   ='), nl,
	write('=   3. About                    ='), nl,
	write('=   4. Exit                     ='), nl,
	write('=                               ='), nl,
	write('================================='), nl,
	write('Choose an option:'), nl.

chooseModeMenu:-
	printModeMenu,
	getChar(Input),
	(
		Input = '1' -> startDirectFlight;
		Input = '2' -> startIndirectFlight;
		Input = '3' -> startCircuitFinder;
		Input = '4';

		nl,
		write('Error: invalid input.'), nl,
		pressEnterToContinue, nl,
		chooseModeMenu
	).

printModeMenu:-
	clearConsole,
	write('================================='), nl,
	write('=     ..:: Search Mode ::..     ='), nl,
	write('================================='), nl,
	write('=                               ='), nl,
	write('=   1. Direct Flight            ='), nl,
	write('=   2. Indirect Flight          ='), nl,
	write('=   3. Find Circuit             ='), nl,
	write('=   4. Back                     ='), nl,
	write('=                               ='), nl,
	write('================================='), nl,
	write('Choose an option:'), nl.

startDirectFlight:-
	write('Enter the first city: '),
	read(InputA),
	write('Enter the second city: '),
	read(InputB),
	directFlight(InputA,InputB,Output),
	write('Here is the result : '), write(Output),nl.
startIndirectFlight:-
	write('Enter the first city: '),
	read(InputA),
	write('Enter the second city: '),
	read(InputB),
	write('Enter the day for the flight: '),
	read(InputC),
	indirectFlight(InputA,InputB,InputC,Output),
	write('Here is the result : '), write(Output),nl.
startCircuitFinder:-
	write('Enter the starting city: '),
	read(Placei),
	write('Enter the day when the journey begins: '),
	read(Day),
	write('Enter the list of cities to visit: '),
	read(Destlist),
	findCircuit(Placei, Day, Destlist, Route),
	write('Here is the result : '), write(Route),nl.

helpMenu:-
	clearConsole,
	write('==================================================================='), nl,
	write('=                        ..:: READ ME ::..                        ='), nl,
	write('==================================================================='), nl,
	write('=                                                                 ='), nl,
	write('=   With this amazing flight planner you can:                     ='), nl,
	write('=   1: Search for direct flights                                  ='), nl,
	write('=                                                                 ='), nl,
	write('=   2: Search for indirect flights                                ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=   3: Search for Circuits                                        ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('=                                                                 ='), nl,
	write('==================================================================='), nl,
	pressEnterToContinue, nl.

aboutMenu:-
	clearConsole,
	write('================================='), nl,
	write('=        ..:: About ::..        ='), nl,
	write('================================='), nl,
	write('=                               ='), nl,
	write('=   Authors:                    ='), nl,
	write('=    > Raul Ferreira            ='), nl,
	write('=    > José Castro              ='), nl,
	write('=                               ='), nl,
	write('=                               ='), nl,
	write('================================='), nl,
	pressEnterToContinue, nl.
