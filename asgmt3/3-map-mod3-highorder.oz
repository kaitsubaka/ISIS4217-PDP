/* 
Alvaro javier Ayte Paz 201618951
 */

declare Apply
fun {Apply L F1 F2 F3}
    local Apply3 in
        fun {Apply3 I X}
            if I mod 3 == 1 then {F1 X}
            elseif I mod 3 == 2 then {F2 X}
            elseif I mod 3 == 0 then {F3 X}
            end
        end
    {List.mapInd L Apply3}
    end
end

local List = {NewCell nil} R = {NewCell nil} in
    List := [ 1 2 3 4 5 ]
    R := {Apply @List fun {$ X} X*2 end fun {$ X} X*3 end fun {$ X} X*4 end}
    {Show @R}
end