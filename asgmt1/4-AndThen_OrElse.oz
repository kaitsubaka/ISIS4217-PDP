/*
F is the first logic function that will be evaluated
G is the second logic function that will be evaluated
Return the evaluation of F and G if F returns true, otherwise return false.
 */
declare 
fun {AndThen F G}
    if {F} then {G}
    else false end 
end
{Show {AndThen fun {$} false end fun {$} true end }}

/*
F is the first logic function that will be evaluated
G is the second logic function that will be evaluated
Returns the evaluation of F if F returns true, G if F return false
 */
declare 
fun {OrElse F G}
    if {F} then true
    else {G} end
end
{Show {OrElse fun {$} false end fun {$} true end }}
/*
How do these procedures compare with the andthen
and orelse expressions of Mozart?

this procedures are similar because they makes a short circuit,
this means that if the evaluation of the first expression do not satisfies 
the condition (true for AndThen and false for OrElse) then the second expression will be not evaluated.
In other hand, the mozart built in expressions are logical operators that can be
bitwise, while the procedures uses traditional logical operators like and and or.
In addition, the mozart built in expressions are optimized in memory while this procedures are not.
*/