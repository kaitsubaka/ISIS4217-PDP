/* 
Alvaro javier Ayte Paz 201618951
 */
declare
fun {MakeTree Tree}
    local MakeTree in 
        fun {MakeTree Tree L}
            case Tree of tree(value: V left: nil right: nil) then {Append L [V]}
            [] tree(value: _ left: LT right: RT) then
                case LT of nil then {MakeTree RT L}
                [] tree(value: _ left: _ right: _) then
                    case RT of nil then {MakeTree LT L}
                    [] tree(value: _ left: _ right: _) then
                        {MakeTree RT {MakeTree LT L}}
                    else nil end
                else nil end
            else nil end
        end
        {MakeTree Tree {MakeList 0}}
    end
end

declare
fun {Segment V LT RT}
    tree(value: V left: LT right: RT)
end

local Tree = {NewCell nil} R = {NewCell nil} in
    Tree := {Segment 'A' {Segment 'B' nil nil} {Segment 'C' {Segment 'D' nil nil} {Segment 'E' nil nil}}}
    R := {MakeTree @Tree}
    {Show @R}

    Tree := {Segment 'A' nil {Segment 'B' {Segment 'C' nil nil} {Segment 'D' {Segment 'E' nil nil} nil}}}
    R := {MakeTree @Tree}
    {Show @R}
end