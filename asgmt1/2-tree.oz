declare
proc{Insert Key Value TreeIn ?TreeOut}
   case TreeIn
   of nil then TreeOut = node(Key Value nil nil)
   [] node(K1 V1 T1 T2) then 
      if Key == K1 then TreeOut = node(Key Value T1 T2)
      elseif Key < K1 then T in 
        TreeOut = node(K1 V1 T T2)
        {Insert Key Value T1 T}
      else T in 
        TreeOut = node(K1 V1 T1 T)
        {Insert Key Value T2 T}
      end 
   end 
end


declare
fun{Search Key TreeIn}
    case TreeIn 
        of nil then TreeIn
        [] node(K1 V1 T1 T2) then 
            if Key == K1 then TreeIn
            elseif Key < K1 then 
                {Search K1 T1}
            else 
                {Search K1 T2}
        end
    end
end


declare
proc {FindMax ParentNode ?MaxTree}
    if ParentNode.1 == nil then
        MaxTree = ParentNode
    else
        {FindMax ParentNode.3 MaxTree}
    end
end



declare
proc {Delete Key TreeIn ?TreeOut}
   case TreeIn
   of nil then TreeOut=TreeIn
   [] node(K1 V1 T1 T2) then 
      if Key == K1 then TreeOut = node(Key Value T1 T2)
      elseif Key < K1 then T in 
        TreeOut = node(K1 V1 T T2)
        {Delete K1 T1 T}
      elseif key > K1 then T in 
        TreeOut = node(K1 V1 T1 T)
        {Delete Key T2 T}
      else 
        if {And T1 == nil T2 == nil} then TreeOut = nil
        elseif {Not T1 == nil} then TreeOut = T1
        elseif {Not T2 == nil} then TreeOut = T2
        else MaxNode NewT1 in
            TreeOut = node(MaxNode.Key MaxNode.Value NewT1 T2)
            {Delete  MaxNode.Key T1 NewT1 }
            {FindMax node(K1 V1 T1 T2) MaxNode}
        end
      end 
   end 
end
