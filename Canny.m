clear all;clc
im=imread('lena.bmp');
im=rgb2gray(im);
% imshow(im)
im=imresize(im,[256 256]);
[m n]=size(im);

%Smoothing
b=[2 4 5 4 2;4 9 12 9 4;5 12 15 12 5;4 9 12 9 4;2 4 5 4 2]./159;
x=[-1 0 1;-2 0 2;-1 0 1];
y=x';

for i=3:m-2
    for j=3:n-2
        sm(i-2,j-2)= round(sum(sum(double(im(i-2:i+2,j-2:j+2)).*b)));
    end
end
[m n]=size(sm);
for i=2:m-1
    for j=2:n-1
        gx(i-1,j-1)= round(sum(sum(double(sm(i-1:i+1,j-1:j+1)).*x)));
        gy(i-1,j-1)= round(sum(sum(double(sm(i-1:i+1,j-1:j+1)).*y)));
    end
end
grad=round(sqrt(gx.^2+gy.^2));
d=atan(gy./gx)*180/pi;

[m n]=size(d);
for i=2:m-1
    for j=2:n-1
        if -22.5<d(i,j)<=22.5
            a=grad(i-1:i+1,j);
        elseif 22.5<d(i,j)<=67.5
            a=[grad(i+1,j-1) grad(i,j) grad(i-1,j+1)];
        elseif 67.5<d(i,j)<=90 && -90<d(i,j)<=-67.5
            a=grad(i,j-1:j+1);
        else
            a=[grad(i-1,j-1) grad(i,j) grad(i+1,j+1)];
        end
        
        if a(2)>a(1) && a(2)>a(3)
            sup(i-1,j-1)=a(2);  % suppressed
        else
            sup(i-1,j-1)=0;
        end
    end
end

[m n]=size(sup);

for i=1:m
    for j=1:n
        if sup(i,j)>40
            th(i,j)=255;    % Thresholding
        elseif sup(i,j)<20
            th(i,j)=0;
        else
            th(i,j)=sup(i,j);
        end
    end
end
figure;imshow(th,[]);
for i=2:m-1
    for j=2:n-1
        a=th(i-1:i+1,j-1:j+1);
        if max(max(a))==255 && 20<th(i,j)<40
            hy(i-1,j-1)=255;
        else
            hy(i-1,j-1)=0;
        end
    end
end

figure;imshow(hy,[]);
        
            
            

















