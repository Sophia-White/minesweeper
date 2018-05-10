minesweeper(Rows) :-
	minesweeperboard(Rows),
	
asatisfied(I) :-
	anchor(I, X, Y, V),
	
	

minesweeperboard(Rows) :-
	maplist(same_length(L), Rows),
        append(Rows, Values), Values ins 0..1.

position(X, Y, M, E) :-
	minesweeperboard(M),
	nth0(Y, M, R),
	nth0(X, M, E).

madjlist(X, Y, LX, LY) :-
	length(LX, 8),
	length(LY, 8),
	

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

distinct_iops(A, B, C, D) :-
	A \= C;
	B \= D.

iop(X, Y) :-
	integer(X),
	integer(Y).