%Amplitude-phase coupling cross high and low frequence
for j=1:100
    
    % 计算低频和高频频段信号的希尔伯特变换
    h_eeg_dipin= hilbert(fea_U{1,j}');
    h_eeg_gaopin = hilbert(fea_U1{1,j}');
    
    % 计算theta和gamma频段信号的相位和幅度
    phase_dipin = angle(h_eeg_dipin );
    amp_gaopin = abs(h_eeg_gaopin);
    
    % 计算相-幅耦合值
    coupling = amp_gaopin .* exp(1i * phase_dipin);
    
    % 统计分析
    mean_coupling(j)= mean(coupling);
    std_coupling(j) = std(coupling);
    corr_coupling{j}= corrcoef(abs(coupling), angle(coupling));
end