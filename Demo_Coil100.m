clc;clear all
addpath(genpath(pwd))
randn('state',1); rand('state',1); 
A=load('coil100');
A_1=double(A.X(:,:,:,1:30,1:30));
A_Resh=reshape(A_1,[320,180,768]);

M=300;
N=50*M;
R_1=30;
R_2=60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%LSS Algorithm
tic
[Y]=LSS(A_Resh,R_1);
toc

A_est=reshape(Y,[128,128,3,30,30]);

disp(['LSS Algorithm:'])
disp(['Relative error=',num2str(norm(A_est(:)-A_1(:))/norm(A_1(:))),'Compression ratio=', ...
    num2str(LSS_Comp_Ratio(A_Resh,R_1))])

for i=1:30
imshow(uint8(A_est(:,:,:,i,5)))
pause
end

%%%%%%%%%%%%%%%%TP_TCTA Algorithm%%%%

Y=TP_TCTA(A_Resh,R_1,R_2);

A_est=reshape(Y,[128,128,3,30,30]);


disp(['TP_TCTA Algorithm:'])
disp(['Relative error=',num2str(norm(A_est(:)-A_1(:))/norm(A_1(:))),'Compression ratio=', ...
    num2str(TP_TCTA_Comp_Ratio(A_Resh,R_1,R_2))])

for i=1:30
imshow(uint8(A_est(:,:,:,i,5)))
pause
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%CTA_FS Algorithm
tic
[Y]=CTA_FS_Faster(A_Resh,M,N);
toc

A_est=reshape(Y,[128,128,3,30,30]);

disp(['CTA_FS Algorithm:'])
disp(['Relative error=',num2str(norm(A_est(:)-A_1(:))/norm(A_1(:))),'Sampling ratio=', ...
    num2str(CTA_FS_Comp_Ratio(A_Resh,M,N))])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

