%Amplitude-phase coupling cross high and low frequence
for j=1:100
    
    % �����Ƶ�͸�ƵƵ���źŵ�ϣ�����ر任
    h_eeg_dipin= hilbert(fea_U{1,j}');
    h_eeg_gaopin = hilbert(fea_U1{1,j}');
    
    % ����theta��gammaƵ���źŵ���λ�ͷ���
    phase_dipin = angle(h_eeg_dipin );
    amp_gaopin = abs(h_eeg_gaopin);
    
    % ������-�����ֵ
    coupling = amp_gaopin .* exp(1i * phase_dipin);
    
    % ͳ�Ʒ���
    mean_coupling(j)= mean(coupling);
    std_coupling(j) = std(coupling);
    corr_coupling{j}= corrcoef(abs(coupling), angle(coupling));
end