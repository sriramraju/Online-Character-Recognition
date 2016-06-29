clc;
% clear all;
close all;

% in_im = rgb2gray(imread('2.jpg'));
% im = imresize(in_im,[300 200]);
% BW = im2bw(im);
% % imshow(BW);
% 
% % % Create structural element
% % se = strel('square',25);
% % out_img = imerode(~BW,se);
% % 
% z=bwmorph(~BW,'skel',20);
% figure;
% imshow(z);

% gn=cell(1,10);

% for num=0:9
x=[];y=[];a=[];chainCode=[];theta=[];seg=[];chara=[];
n=0;
but = 1;

imshow(zeros(300,200));hold on;
while but == 1
[x,y,but] = ginput(1);
n=n+1;
a(n,1)=round(x);
a(n,2)=round(y);

plot(a(:,1),a(:,2),'w');
end
hold off;


len = length(a(:,1));
for i=2:len

    delx = a(i,1) - a(i-1,1);
    dely = a(i,2) - a(i-1,2);
    
    [theta(i-1) chainCode(i-1)] = angleDetermine(dely,delx);
    
end

count = 1;
k=1;
seg(1,1)=chainCode(1);
for i=2:length(chainCode)
    
    
    if abs(chainCode(i) - chainCode(i-1)) <= 1 || abs(chainCode(i) - chainCode(i-1)) == 7
        k=k+1;
        seg(count,k) = chainCode(i);
    else
        count=count+1;
        k=1;
        seg(count,k) = chainCode(i);
    end

end

[m n]= size(seg);
k=0;

for i=1:m
    count_nz(i)=0;
    count(i)=0;
    for j=1:n
        if seg(i,j) ~= 0
           count_nz(i) = count_nz(i)+1;
           if seg(i,1) == seg(i,j)
               count(i) = count(i)+1;
           end
        end
    end
    
    % Line / Curve
        % 2-line , 1 anticlock , -1 clock , 0 both
    
    if count_nz(i) > 1
        k=k+1;
        if count(i) == count_nz(i)
            chara(k,1) = 2;
            chara(k,2) = seg(i,1);
            
        else
            sig=grad(seg(i,1:count_nz(i)));
            if sig == 1
                chara(k,1) = 1;
                chara(k,2)=0;
                % Add
            elseif sig == -1
                chara(k,1) = -1;
                chara(k,2)=0;
            else 
                chara(k,1) = 0;
                chara(k,2)=0;
            end
        end
    end
end

% gn{10}=chara;
% clearvars a but chainCode chara count count_nz delx dely i j k len m n seg theta x y sig;
% 
% close all;
% end
%     
% save dataset.mat;

num_Detected=Match(chara,a);
fig = imread(sprintf('%d.jpg',num_Detected));
imshow(fig);
