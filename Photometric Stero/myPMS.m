function N = L2_PMS(data, m)
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
    rho_s1=rho_nor(i,1) .^2 ;
    rho_s2=rho_nor(i,2) .^2 ;
    rho_s3=rho_nor(i,3) .^2 ;
    Al=sqrt(sum(rho_s1+rho_s2+rho_s3));
    for j = 1 : 3 
    rho_s(i,j)=rho_nor(i,j)/Al;      
    end
end

N=zeros(mask_h, mask_w, 3);
M_hw=mask_h * mask_w;

for i = 1: 3
    Nor = zeros(M_hw,1);
    for j=1: length(m)
        Nor(m(j)) = rho_s(j,i);
    end   
    
      Nor = reshape(Nor, mask_h, mask_w);
     N(:,:,i)=Nor; 
end