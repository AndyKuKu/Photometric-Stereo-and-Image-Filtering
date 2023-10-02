function [img1] = myImageFilter(img0, H)
img0 = im2single(img0);
H = im2single(H);
[R, C]=size(img0);
[H_R, H_C] = size(H);
CX = floor(H_R/2);
CY = floor(H_C/2);
img1 = zeros(R, C);
for i=1 : R
 for j=1 : C
 S = 0;
 for k=1:H_R
   kp = H_R - k;
   for l=1:H_C
     lp= H_C - l;                
       ip = i + (k - CX);
         jp = j + (l - CY);
       if ((jp < C && jp >= 1) && (kp>0) && (ip < R && ip >= 1) && (kp>0) && (lp>0)) 
          S = S +(img0(ip,jp)* H(kp,lp));                
      end
    end
   img1(i,j) = S;
  end       
 end
end