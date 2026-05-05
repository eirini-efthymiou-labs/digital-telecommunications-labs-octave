
clear ;


% Askisi_8


 % Speed of light  m/s
c = 3e8;

% Ask the user to enter frequencies in GHz
disp('Give  values  as a row vector, for example: [15 30]');
f_GHz = input('Enter frequencies in GHz, for example [1 2 3 4 5 6 7 8 9 10]: ');
f_Hz = f_GHz * 1e9;

% Calculate wavelength
lambda = c ./ f_Hz;



fprintf('\nFrequency (GHz)     Wavelength (m)\n');
fprintf('-----------------------------------\n');

for i = 1:length(f_GHz)
    fprintf('%10.2f          %10.6f\n', f_GHz(i), lambda(i));

end




% f_Hz contains many frequency values, so we use ./ for element-by-element division.
% This calculates one wavelength value for each frequency.
%
% disp simply prints the values as Octave decides.
% fprintf gives better control and makes the output look like a clean table.





% ============================================================
% Askisi_9

% Exercise statement:
%
% In a microwave link, the transmitter power is Pt = 10 W.
% The transmitter cable has attenuation At = 0.7 dB.
% The transmitter antenna gain is Gt = 13 dB.
% The free space path loss is Lfs = 137 dB.
% The receiver antenna gain is Gr = 11 dB.
% The receiver cable loss is Ar = 1.4 dB.
%
% We need to calculate the received power in mW.
% The program must also calculate the result for Pt = 20 W
% using an input prompt.

% Ask the user to enter transmitter power in W
disp('Give  values  as a row vector, for example: [15 30]');
Pt_W = input('Enter transmitter power Pt in W: ');


% Given values in dB
At_dB = 0.7;      % Transmitter cable attenuation/loss
Gt_dB = 13;       % Transmitter antenna gain
Lfs_dB = 137;     % Free space path loss
Gr_dB = 11;       % Receiver antenna gain
Ar_dB = 1.4;      % Receiver cable loss

% Convert transmitter power from W to mW
Pt_mW = Pt_W * 1000;

% Convert transmitter power from mW to dBm
Pt_dBm = 10 * log10(Pt_mW);

% Link budget:
% Gains are added and losses are subtracted.
Pr_dBm = Pt_dBm - At_dB + Gt_dB - Lfs_dB + Gr_dB - Ar_dB;

% Convert received power from dBm to mW
Pr_mW = 10.^(Pr_dBm / 10);

fprintf('\nPt(W)        Pt(dBm)        Pr(dBm)          Pr(mW)\n');
fprintf('----------------------------------------------------------\n');

for i = 1:length(Pt_W)
    fprintf('%8.2f     %10.2f     %10.2f     %14.10f\n', ...
        Pt_W(i), Pt_dBm(i), Pr_dBm(i), Pr_mW(i));

end

% ============================================================
% Askisi_10

% ------------------------------------------------------------
% Askisi_10

% Exercise statement:
%
% The user enters the wavelength lambda in cm.
% The program calculates the frequency in Hz, kHz, MHz and GHz.
% Given wavelength values: lambda = 15 cm and 30 cm.

% Speed of light in m/s
c = 3e8;

% Ask the user to enter wavelength values in cm
disp('Give wavelength values in cm as a row vector, for example: [15 30]');
lambda_cm = input('Enter wavelength values in cm: ');

% Convert wavelength from cm to m
lambda_m = lambda_cm / 100;

% Calculate frequency in Hz
% We use ./ because lambda_m may contain more than one value.
f_Hz = c ./ lambda_m;

% Convert frequency to kHz, MHz and GHz
f_kHz = f_Hz / 1e3;
f_MHz = f_Hz / 1e6;
f_GHz = f_Hz / 1e9;

% Display results in a clean table
fprintf('\nWavelength(cm)   Wavelength(m)        Hz              kHz             MHz          GHz\n');
fprintf('--------------------------------------------------------------------------------------\n');

for i = 1:length(lambda_cm)
    fprintf('%10.2f      %10.4f      %12.2f    %12.2f    %10.2f    %8.2f\n', ...
        lambda_cm(i), lambda_m(i), f_Hz(i), f_kHz(i), f_MHz(i), f_GHz(i));
end


% If I divide by a vector, for example a list of numbers,
% I use ./ because the division must be done element by element.
%
% If I divide by a single number, I can use / because the dot is not needed.


