insert(I, -, t(-, I, -)).
insert(I, t(L, X, R), t(P, Y, Q)) :-
    (   I < X
    ->  insert(I, L, U),
        (P, Y, Q) = (U, X, R)
    ;   I > X
    ->  insert(I, R, U),
        (P, Y, Q) = (L, X, U)
    ;   (P, Y, Q) = (L, X, R) 
    ).

bulk_insert([N|Ns], T0, T) :-
    insert(N, T0, T1),
    bulk_insert(Ns, T1, T).
bulk_insert([], T, T).