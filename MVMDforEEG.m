    Fs =1024;
    win=Fs;
    [chn1,L1]=size(data);
    N=fix(L1/win);
    epochs1=zeros(N,chn1,win);
%     �ֶ�
    for i=1:N
        epochs1(i,:,:)=data(:,((i-1)*win+1):(i*win));
    end
%     ȥ����Ư��
       epochs1=epochs1-mean(epochs1,3);
     for j=1:N
       x1 = squeeze( epochs1(j,1,:))';
       t=1:length(x1);
       %--------- ����MVMD������������---------------
       alpha = 4000;       % moderate bandwidth constraint���ʶȵĴ���Լ��/�ͷ�����
       tau = 0;          % noise-tolerance (no strict fidelity enforcement)���������ޣ�û���ϸ�ı����ִ�У�
       K = 5;              % mode s���ֽ��ģ̬��
       DC = 0;             % no DC part imposed����ֱ������
       init = 1;           % initialize omegas uniformly  ��omegas�ľ��ȳ�ʼ��
       tol = 1e-6 ; 
       %--------------- Run actual VMD code:���ݽ���vmd�ֽ�---------------------------
       [u, u_hat, omega] = MVMD(x1, alpha, tau, K, DC, init, tol);
       fea_u1{j}=u;
       fea_omega1{j}=omega;
    end  

