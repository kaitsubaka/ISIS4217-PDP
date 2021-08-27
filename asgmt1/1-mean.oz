/*
Data is the list -> []
Total is the Total sum of the elements of the list -> Float
Count is the number of elements in the list -> Float
 */
declare fun {Mean Data Total Count}
  case Data
  of nil then if Count > 0.0 then Total/Count else Total end
  [] X|Xr then {Mean Xr Total+X Count+1.0}
  end
end

/* the output should be 5.5 */
{Show {Mean [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0] 0.0 0.0}}
