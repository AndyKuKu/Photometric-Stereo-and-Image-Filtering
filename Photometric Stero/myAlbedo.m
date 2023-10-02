function N = myal(data, m)
LD = (data.s)';
[mask_h, mask_w,~] = size(data.mask);
All_Dir = zeros(length(m), 96);

for i = 1 : size(LD,2)
    img = data.imgs{i};
    img = rgb2gray(img);
    img = img(m);
    All_Dir(:, i) = img;
end
rho_nor = All_Dir * pinv(LD);
rho_s = zeros(size(rho_nor));

for i = 1 : length(m)
    for j=1;3
    rho_s1=rho_nor(i,j) .^2 ;
    rho_s2=rho_nor(i,j) .^2 ;
    rho_s3=rho_nor(i,j) .^2 ;
    end
    Al=sqrt(sum(rho_s1+rho_s2+rho_s3));
    for j = 1 : 3 
    rho_s(i,j)=rho_nor(i,j)/Al;      
    end
    
end

M_hw=mask_h * mask_w;
N = zeros(mask_h, mask_w, 3);
Nor = zeros(M_hw,1);
       
for i = 1: length(m)
    for j=1: 3
        Nor(m(i)) = rho_s(i,j);
    end   
end
        
for i = 1: 3
     Nor = reshape(Nor, mask_h, mask_w);
     N(:,:,i)=Nor; 
end
   N(isnan(N)) = 0;
