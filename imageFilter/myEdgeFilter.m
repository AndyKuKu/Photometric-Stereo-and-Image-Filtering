function [I_M, I_O, I_X, I_Y] = myEdgeFilter(img, sigma)
  img = myImageFilter(img,fspecial('gaussian',[3,3],sigma));
   j = [-1,0,1;-2,0,2;-1,0,1];
   k = [1,2,1;0,0,0;-1,-2,-1];  
    I_X = myImageFilter(double(img),j);
    I_Y = myImageFilter(double(img),k);
    I_O = atan(I_Y./I_X);                
    I_O(I_O<0) = I_O(I_O<0)+pi;           
    I_O = I_O*180/pi;     
    I_M = I_X + I_Y;
   edgeImage = uint8((I_M > 50) * 255); 
   subplot(3,1,2);imshow(edgeImage);
end   