/* 
Alvaro javier Ayte Paz 201618951
 */
declare
fun {Apply L F1 F2 F3}
    local ApplyMod3 in
        fun {ApplyMod3 Xs F1 F2 F3 INDEX} 
            case Xs
              of nil then nil
                [] X|Xr andthen INDEX mod 3 == 0 then
                    {F1 X}|{ApplyMod3 Xr F1 F2 F3 INDEX+1}
                [] X|Xr andthen INDEX mod 3 == 1 then
                    {F2 X}|{ApplyMod3 Xr F1 F2 F3 INDEX+1}
                [] X|Xr andthen INDEX mod 3 == 2 then
                    {F3 X}|{ApplyMod3 Xr F1 F2 F3 INDEX+1}
                else Xs 
            end 
        end
        {ApplyMod3 L F1 F2 F3 0}
    end
end

local R = {NewCell nil} in
    List = [0 1 2 3]
    R := {Apply List fun {$ X} X*2 end fun {$ X} X-2 end fun {$ X} X+2 end}
    {Show @R}
end