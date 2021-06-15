clc;clear all ;close all;

%讀取圖片
Image = imread('test.jpg');

%把圖片灰階
Gray=rgb2gray(Image);

%取圖片的RGB值
R=Image(:,:,1);
G=Image(:,:,2); 
B=Image(:,:,3);

% 設置紅、綠、藍三種顏色提取閾值（越大越嚴格）
diff_R=0; 
diff_G=0;
diff_B=0;  
%% 
%紅色處理
Image_R=Image;
RP_R=Image(:,:,1);
RP_G=Image(:,:,2); 
RP_B=Image(:,:,3);

%綠色處理
Image_G=Image;
GP_R=Image(:,:,1);
GP_G=Image(:,:,2); 
GP_B=Image(:,:,3);

%藍色處理
Image_B=Image;
BP_R=Image(:,:,1);
BP_G=Image(:,:,2);
BP_B=Image(:,:,3);

% 提取紅色條件是R分量與G、B分量差值大於設定
XYR=~((R-G)>diff_R&(R-B)>diff_R); 
% 提取綠色條件是G分量與R、B分量差值大於設定
XYG=~((G-R)>diff_G&(G-B)>diff_G);
% 提取藍色條件是G分量與R、B分量差值大於設定
XYB=~((B-R)>diff_B&(B-G)>diff_B); 

% 使得非紅色區域變爲灰色
RP_R(XYR)=Gray(XYR);
RP_G(XYR)=Gray(XYR);
RP_B(XYR)=Gray(XYR);
% 使得非綠色區域變爲灰色
GP_R(XYG)=Gray(XYG);
GP_G(XYG)=Gray(XYG);
GP_B(XYG)=Gray(XYG); 
% 使得非藍色區域變爲灰色
BP_R(XYB)=Gray(XYB); 
BP_G(XYB)=Gray(XYB); 
BP_B(XYB)=Gray(XYB);  
%%
Image_R(:,:,1)=RP_R;
Image_R(:,:,2)=RP_G;
Image_R(:,:,3)=RP_B;
Image_G(:,:,1)=GP_R;
Image_G(:,:,2)=GP_G; 
Image_G(:,:,3)=GP_B;
Image_B(:,:,1)=BP_R;
Image_B(:,:,2)=BP_G; 
Image_B(:,:,3)=BP_B;
%%
% 顯示原圖與R/G/B三色提取結果對比圖並顯示標籤
subplot(2,2,1),imshow(Image);title('Image');
subplot(2,2,2),imshow(Image_R);title('Red Pass');
subplot(2,2,3),imshow(Image_G);title('Green Pass');
subplot(2,2,4),imshow(Image_B);title('Blue Pass');
