function [ p ] = grad( seg )
p=0;
for i=2:length(seg)
    temp(i-1) =  seg(i)-seg(i-1);
    
    if temp(i-1) == 7
        temp(i-1) = -1;
    elseif temp(i-1) == -7
        temp(i-1) = 1;
    end
    
    
end
    if temp >= 0
        p=1;
    elseif  temp <= 0
        p=-1;
    else
        p=0;
    end

end
