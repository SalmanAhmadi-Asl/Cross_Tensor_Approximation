% #########################################################################
% Written by C. Caiafa, 2010.
% email: ccaiafa@gmail.com (http://web.fi.uba.ar/~ccaiafa/Cesar/Cesar.html)
% Fiber Sampling Tensor Decomposition type 1 (FSTD1) for higher dimensional
% tensors (N>2) as an extension of the algorithm described in the paper
% "Generalizing the Column-Row Matrix Decomposition to Multi-way Arrays" by
% C. Caiafa and C. Cichocki, Linear Algebra and its Applications, Vol. 433,
% pp. 557–573, 2010 (Elsevier). The indices are selected in an optimal way.
% This program requires to have the Tensor Toolbox installed: Brett W. Bader and Tamara G. Kolda, MATLAB Tensor Toolbox Version 2.4, http://csmr.ca.sandia.gov/~tgkolda/TensorToolbox/, March 2010.

function [Yaprox,ssub,index] = AFS(Y,k,epsilon)
% Y: tensor to be decomposed
% k: Number of indices to select

I=size(Y); % mode sizes
N=size(I,2); % dimensions

index=cell(1,N); % initial random indices for each mode n=1,2,...,N
for n=1:N
    index{n}=ceil(rand*I(n));
end

ssub=1; % size of sub-tensor, initially it is [1,1,...,1]
for n=2:N
    ssub=[ssub,1];
end

%start a loop for n-mode fibers
p=2;
completed=zeros(1,N);
while p<=k && prod(completed)==0
    for n=1:N
        if completed(n)==0
            if (p==2 && n==1)
                index{n}=[index{n},ceil(rand*I(n))];
                ssub(n)=ssub(n)+1;
            else
                if norm(Yres,'fro')/norm(FIBred{next},'fro')>epsilon
                    index{n}=[index{n},inew(Yres)];
                    ssub(n)=ssub(n)+1;
%                     disp(['ranks= ', num2str(ssub)]);
                else
                    completed(n)=1;
                end
            end
            W=tensor(Y(index{:}),ssub);
            for m=1:N
                Wpinv{m}=pinv(double(tenmat(W,m)));
                ind=index;
                ind{m}=1:I(m);
                FIB{m}=double(tenmat(Y(ind{:}),m));            
            end
            U=ttensor(W,Wpinv{:});
        end
       
        if n==N
            next=1;
        else
            next=n+1;
        end

        if completed(next)==0
            %compute fiber residual in next mode
            for m=1:N
                FIBred{m}=FIB{m}(index{m},:);
            end
        
            ind=index;
            ind{next}=1:I(next);
            FIBred{next}=FIB{next};
            smat=ssub;
            smat(next)=I(next);
            Yres=double(tenmat(tensor(Y(ind{:}),smat)-double(ttensor(U,FIBred)),next));
        end
    end
    p=p+1;
end
Yaprox=double(ttensor(U,FIB{:})); 
end

%% Search for the best row to add
function [ind]=inew(C)
%norm(C,'fro')
%size(C)

n=size(C,1);
vec=zeros(n,1);
for i=1:n
    vec(i)=norm(C(i,:),'fro');
end

[value,ind]=max(abs(vec));
%[value,ind]=max(abs(C)); 
end