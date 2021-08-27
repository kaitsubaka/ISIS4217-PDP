/* Apply is the function that will be executed for each element -> F(X),
Xs is the BODY -> [], 
Condition is the conditional for the element -> F(X)*/ 
declare fun {Comprehend Apply Xs Condition} 
  case Xs
  of nil then Xs
  [] X|Xr then 
  if {Condition X} then 
    {Apply X}|{Comprehend Apply Xr Condition} 
    else 
    {Comprehend Apply Xr Condition} 
    end 
  end
 end

/*The same example as assignment*/
{Show {Comprehend fun {$ X} X*2 end [1 2 3 4 5 6 7 8 9] fun {$ X} X mod 2==0 end }}