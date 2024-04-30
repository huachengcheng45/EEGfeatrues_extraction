% ������صĺ���
function appEn = ApproximateEntropy(dim, r, data, tau)
%   �������㷨������ߣ�Pincus S M . Approximate entropy as a measure of system complexity[J]. Proceedings of the National Academy of Sciences ,1991,88(6):2297��2301.
%   Input:
%       dim��Ƕ��ά��(һ��ȡ1����2)
%       r����������( ͨ��ȡ0.1*Std(data)~0.25*Std(data) )
%       data��ʱ���������ݣ�data��Ϊ1xN�ľ���
%       tau���²����ӳ�ʱ�䣨��Ĭ��ֵΪ1������£��û����Ժ��Դ��
%   Output:
%       appEn���������ݵĽ�����

if nargin < 4
    tau = 1;
end
if tau > 1
    data = downsample(data, tau);
end

N = length(data);
result = zeros(1,2);

for m = dim:dim+1
    Bi = zeros(N-m+1,1);
    dataMat = zeros(N-m+1,m);
    
    % �������ݾ��󣬹����mά��ʸ��
    for i = 1:N-m+1
        dataMat(i,:) = data(1,i:i+m-1);
    end
    
    % ���þ����������ģʽ��
    for j = 1:N-m+1
        % �����б�ѩ����룬������ƥ�����
        dist = max(abs(dataMat - repmat(dataMat(j,:),N-m+1,1)),[],2);
        % ͳ��distС�ڵ���r����Ŀ
        D = (dist <= r);
        % ������ƥ�����
        Bi(j,1) = sum(D)/(N-m+1);
    end
 
    % ������Bi�ľ�ֵ
    result(m-dim+1) = sum(log(Bi))/(N-m+1);
	
end
% ����õ��Ľ�����ֵ
appEn = result(1)-result(2);

end
