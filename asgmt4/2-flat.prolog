flatt([], []) :- !.
flatt([H|T], Z) :-
    !,
    flatt(H, L),
    flatt(T, R),
    append(L, R, Z).
flatt(X, [X]).

append([],X,X).
append([H|T],X,[H|Z]) :- append(T,X,Z).