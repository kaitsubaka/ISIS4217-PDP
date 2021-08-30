/* 
Alvaro javier Ayte Paz 201618951
 */
/*
Data is the list -> []
 */
declare 
fun{Avg Data}
  fun {InnerCalculus Data Total Count}
    case Data
      of nil then if Count > 0 then {Int.toFloat Total}/{Int.toFloat Count} else {Int.toFloat Total} end
      [] X|Xr then {InnerCalculus Xr Total+X Count}
    end
  end
in
  "The average is: "#{Float.toString {InnerCalculus Data 0 {List.length Data}}}
end

/* the output should be 5.5 */
{System.showInfo {Avg [1 2 3 4 5 6 7 8 9 10]}}