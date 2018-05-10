minesweeper(Rows) :-
	minesweeperboard(Rows),
	asatisfied(I, Rows),
	num_anchors(N),
	I ins 1...N.	

asatisfied(I, M) :-
	anchor(I, X, Y, V),
	madjlist(X, Y, M, L),
	frequency(E, L, V),
	E is 1.

minesweeperboard(Rows) :-
	maplist(same_length(L), Rows),
        append(Rows, Values), Values ins 0..1.

madjlist(X, Y, M, L) :-
	minesweeperboard(M),
	adjlist(X, Y, LX, LY),
	listpos(LX, LY, L, M).

listpos(LX, LY, LE, M) :-
	minesweeperboard(M),
	same_length(LX, LY),
	nth0(I, LE, E),
	nth0(I, LX, X),
	nth0(I, LY, Y),
	position(X, Y, M, E).

position(X, Y, M, E) :-
	minesweeperboard(M),
	nth0(Y, M, R),
	nth0(X, M, E).

adjlist(X, Y, LX, LY) :-
	LX = (X1, X2, X3, X1, X2, X1, X2, X3),
	LY = (Y1, Y1, Y1, Y2, Y2, Y3, Y3, Y3),
	X1 is X-1,
	X2 is X,
	X3 is X+1,
	Y1 is Y-1,
	Y2 is Y,
	Y3 is Y+1.

madjacent(X1, Y1, X2, Y2) :-
	mordd(X1, X2),
	mordd(Y1, Y2),
	\+mand(X1 = X2, Y1 = Y2).

mordd(A, B) :-
	A is B+1;
	A is B;
	A is B-1.

mand(A, B) :- A,B.

ladjacent(X, Y, L) :- nextto(X, Y, L).
ladjacent(X, Y, L) :- nextto(Y, X, L).

frequency(_, [], 0).
frequency(X, [H|T], N) :- X \= H, frequency(X, T, N).
frequency(X, [X|T], N) :- frequency(X, T, M), N is M+1.

distinct_iops(A, B, C, D) :-
	A \= C;
	B \= D.

iop(X, Y) :-
	integer(X),
	integer(Y).