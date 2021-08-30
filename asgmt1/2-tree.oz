proc {Insert Key Value TreeIn ?TreeOut}
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

fun {Search Key TreeIn}
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
end

proc {FindMax TreeIn ParentNode ?MaxTree}
    case TreeIn
    of nil then MaxTree = ParentNode
    [] node(K1 V1 T1 T2) then MaxTree = {FindMax T2 TreeIn}
end

proc {Delete Key TreeIn ?TreeOut}
   case TreeIn
   of nil then TreeIn
   [] node(K1 V1 T1 T2) then 
      if Key == K1 then TreeOut = node(Key Value T1 T2)
      if Key < K1 then T in 
        TreeOut = node(K1 V1 T T2)
        {Delete K1 T1 T}
      elseif key > K1 then T in 
        TreeOut = node(K1 V1 T1 T)
        {Delete Key T2 T}
      else 
        if {And T1 == nil T2 == nil} then nil
        elseif {Not {And T1 == nil T2 == nil}} then MaxNode NewT1 in
            TreeOut = node(MaxNode.Key MaxNode.Value NewT1 T2)
            {Delete MaxNode.Key NewT1}
            {FindMax T1 node(K1 V1 T1 T2) MaxNode}
        elseif {Not T1 == nil} then TreeOut = T1
        elseif {Not T2 == nil} then TreeOut = T2
      end 
   end 
end