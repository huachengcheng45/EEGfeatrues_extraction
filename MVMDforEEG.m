    Fs =1024;
    win=Fs;
    [chn1,L1]=size(data);
    N=fix(L1/win);
    epochs1=zeros(N,chn1,win);
%     分段
    for i=1:N
        epochs1(i,:,:)=data(:,((i-1)*win+1):(i*win));
    end
%     去基线漂移
       epochs1=epochs1-mean(epochs1,3);
     for j=1:N
       x1 = squeeze( epochs1(j,1,:))';
       t=1:length(x1);
       %--------- 对于MVMD参数进行设置---------------
       alpha = 4000;       % moderate bandwidth constraint：适度的带宽约束/惩罚因子
       tau = 0;          % noise-tolerance (no strict fidelity enforcement)：噪声容限（没有严格的保真度执行）
       K = 5;              % mode s：分解的模态数
       DC = 0;             % no DC part imposed：无直流部分
       init = 1;           % initialize omegas uniformly  ：omegas的均匀初始化
       tol = 1e-6 ; 
       %--------------- Run actual VMD code:数据进行vmd分解---------------------------
       [u, u_hat, omega] = MVMD(x1, alpha, tau, K, DC, init, tol);
       fea_u1{j}=u;
       fea_omega1{j}=omega;
    end  

