%% �������㷨
function [pe ,hist] = PermutationEntropy(y,m,t)

%  Calculate the permutation entropy(PE)
%  �������㷨������ߣ�Bandt C��Pompe B. Permutation entropy:a natural complexity measure for time series[J]. Physical Review Letters,2002,88(17):174102.

%  Input:   y: time series;
%           m: order of permuation entropy Ƕ��ά��
%           t: delay time of permuation entropy,�ӳ�ʱ��

% Output: 
%           pe:    permuation entropy
%           hist:  the histogram for the order distribution
ly = length(y);
permlist = perms(1:m);
[h,~]=size(permlist);
c(1:length(permlist))=0;

 for j=1:ly-t*(m-1)
     [~,iv]=sort(y(j:t:j+t*(m-1)));
     for jj=1:h
         if (abs(permlist(jj,:)-iv))==0
             c(jj) = c(jj) + 1 ;
         end
     end
 end
hist = c;
c=c(c~=0);
p = c/sum(c);
pe = -sum(p .* log(p));
% ��һ��
pe=pe/log(factorial(m));
end