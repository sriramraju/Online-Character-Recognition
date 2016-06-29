clc;
clear all;
close all;

p = ones(300,200);
d = ones(300,200);

p(50:250,75) = 0;
d(50:250,75) = 0;

% imshow(p);figure;imshow(d);

cd = [150 75];
cp = [100 75];

%  P
for i=-100:100
    for j=1:200
        if i^2 + j^2 >= 2950 && i^2 + j^2 <= 3050
            temp = [i j];
            c = cp + temp;
            p(c(1),c(2))=0;
        end
    end
end

imshow(p);

% D
for i=-100:100
    for j=1:200
        if i^2 + j^2 >= 10000 && i^2 + j^2 <=  10200
            temp = [i j];
            c = cd + temp;
            d(c(1),c(2))=0;
        end
    end
end
figure;
imshow(d);