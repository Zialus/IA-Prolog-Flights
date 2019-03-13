:- op(50, xfy, :).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Problem 1 not-so-especific stuff%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% directFlight(+, +, -)
directFlight(Place1, Place2, DayList) :-
	findall(Day,flight(Place1, Place2, Day,_,_,_),DayList1),
	sort(DayList1, DayList).

% flight(+,+,?,-,-,-)
flight(DepAirport, ArrAirport, Day, FlightNum, DepTime, ArrTime) :-
	timetable(DepAirport, ArrAirport, FlightList),
	member(DepTime/ArrTime/FlightNum/DaysList, FlightList),
	containsDay(DaysList,Day).

% containsDay(+,+)
containsDay(DaysList, Day):- member(Day, DaysList).
containsDay(alldays, Day):- member(Day, [mo,tu,we,th,fr,sa,su]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%Problem 2 especific stuff%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% indirectFlight(+, +, ?, -)
indirectFlight(Place1, Place2, Day, Route) :-
	route(Place1, Place2, Day, [Place1],Route, 00:00).

% route(+, +, ?, -)
route(Place1, Place2, Day, _Visitados, LastRouteElem, TimeArr) :-
	flight(Place1, Place2, Day, Fnum, Deptime, _Arrtime),
	LastRouteElem = [Place1-Place2:Fnum:Deptime],
	transfer(TimeArr, Deptime).

route(Place1, Place2, Day, Visitados, RouteList, TimeArr) :-
	flight(Place1, Place3, Day, FNum13, Dep13, Arr13),
	RouteElem = (Place1-Place3:FNum13:Dep13),
	RouteList = [ RouteElem | RestList],
	transfer(TimeArr, Dep13),
	\+member(Place3 ,Visitados),
	route(Place3, Place2, Day, [Place3 | Visitados], RestList, Arr13).

% depTime(Route,DepTime) :- Route = [_/_/_/DepTime/_|_].
% arrTime(Route,ArrTime) :- Route = [_/_/_/_/ArrTime|_].

% transfer(+,+)
transfer(Time1,Time2) :-
	Time1 = Hours1:Mins1,
	Time2 = Hours2:Mins2,
	% format('~w:~w vs (~w:~w+00:40)',[Hours1,Mins1,Hours2,Mins2]),
	(Hours1*60+Mins1)+40 =< (Hours2*60+Mins2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%Problem 3 especific stuff%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% nextday(+,-)
nextday(mo, tu).
nextday(tu, we).
nextday(we, th).
nextday(th, fr).
nextday(fr, sa).
nextday(sa, su).
nextday(su, mo).

% findCircuit(+, +, +, -)
findCircuit(Placei, Day, DestList, Route) :- path(Placei, Placei, Day, DestList, Route).

% path(+,+,+,+,-,)
path(Placei, Placef, Day, [], [Placei / Placef / Fnum / Day / Deptime]) :-
    flight(Placei, Placef, Day, Fnum, Deptime, _).

path(Placei,Placef, Day, DestList, [Placei / NextDest / FNumi / Day / Deptimei | RestList]) :-
    member(NextDest, DestList),
    flight(Placei, NextDest, Day, FNumi, Deptimei, _),
    nextday(Day, NextDay),
    delete(DestList, NextDest, UpdatedDestList),
    path(NextDest,Placef, NextDay, UpdatedDestList, RestList).
