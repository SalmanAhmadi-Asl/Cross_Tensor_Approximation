clc;clear all
addpath(genpath(pwd))
X=double(imread('peppers.bmp'));
%%%%%%%%%%%%%%%%Parameters%%%%%%%%%%%%
R_1=50;
R_2=40;
R_3=3;
M=50;
N=5*M;
Epsilon=1e-2;
%%%%%%%%%%%%%%%%LSS Algorithm%%%%%%%
Y=LSS(X,R_1);
subplot(2,4,1)
imshow(uint8(Y))
title('LSS Algorithm')

disp(['LSS Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%%TP_TCTA Algorithm%%%%
subplot(2,4,2)
Y=TP_TCTA(X,R_1,R_2);
imshow(uint8(Y))
title('TP\_TCTA Algorithm')

disp(['TP_TCTA Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%%%F_TCT Algorithm%%%%
subplot(2,4,3)
Y=F_TCT(X,R_1,R_2);
imshow(uint8(Y))
title('F\_TCT Algorithm')

disp(['F_TCTA Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%FSTD Algorithm%%%%
subplot(2,4,4)
Y=FSTD(X,R_1,R_2,R_3);
imshow(uint8(Y))
title('FSTD Algorithm')

disp(['FSTD Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%AFS Algorithm%%%%
subplot(2,4,5)
Y=AFS(X,R_1,Epsilon);
imshow(uint8(Y))
title('AFS Algorithm')

disp(['AFS Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%STucker Algorithm%%%%
subplot(2,4,6)
Y=STucker(X,R_1,R_2,R_3);
imshow(uint8(Y))
title('STucker Algorithm')

disp(['STucker Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])
%%%%%%%%%%%%%%%CTA_FS Algorithm%%%%
Y=reshape(X,[64,48,64]);
tic
[Y]=CTA_FS(Y,M,N);
toc
Y_est=reshape(Y,[256,256,3]);
subplot(2,4,7)
imshow(uint8(Y_est))
title('CTA\_FS')

disp(['CTA_FS Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y_est,X)), ', SSIM=',num2str(SSIM(Y_est,X))])
%%%%%%%%%%%%%%%HOID Algorithm%%%%
Y=HOID(X,R_1,R_2,R_3);
subplot(2,4,8)
imshow(uint8(Y))
title('HOID Algorithm')

disp(['HOID Algorithm:'])
disp(['PSNR=',num2str(PSNR(Y,X)), ', SSIM=',num2str(SSIM(Y,X))])