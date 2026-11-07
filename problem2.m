N = 20;
n = -N:N;

% Complex Fourier coefficients
c = zeros(size(n));
c(n == 0) = 1/2;

idx = (n ~= 0);
c(idx) = (1 - (-1).^n(idx)) ./ (1i * 2*pi*n(idx));

% Phase is not meaningful when the coefficient is zero
phase = angle(c);
phase(abs(c) < 1e-12) = NaN;

subplot(2,1,1)
stem(n, abs(c), 'filled')
xlabel('n')
ylabel('|c_n|')
title('Magnitude Spectrum')
grid on

subplot(2,1,2)
stem(n, phase, 'filled')
xlabel('n')
ylabel('Phase (radians)')
title('Phase Spectrum')
grid on
