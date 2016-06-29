function [ num ] = Match( chara , a)
    d=sqrt((a(1,1)-a(end,1))^2+(a(1,2)-a(end,2))^2); % for distinguishing 0 and 6
    [m n]=size(chara);
    load data_Gan.mat
    for i=1:10
        [a b]=size(gn{i});
        if a==m && b==n
            if chara == gn{i}
                num=i-1;
                if num==6 && d<=10
                    num=0;
                end
%             else
%                 num=-1;
            end
%         else
%             num=-1;
        end
    end

end

