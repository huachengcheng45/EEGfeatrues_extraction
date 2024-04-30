%% ÅÅÁĞìØPermutation Entropy
for j=1:100
    m=5;
    t=1;
    pe(j) =PermutationEntropy(fea_U{1,j}', m, t);
end
%% Ä£ºıìØFuzzyEntropy
for j=1:100
    m=2;
    r = 0.2*std(fea_U{1,j});
    FuzEn(j)=FuzzyEntropy(fea_U{1,j}', m, r,2,1);
end
%% ½üËÆìØApproximateEntropy
for j=1:100
    m=2;
    r=0.2*std(fea_U{1,j});
    apen(j)=ApproximateEntropy(m,r,fea_U{1,j}');
end