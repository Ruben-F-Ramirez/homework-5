t = linspace(-pi, pi, 2001);
f = zeros(size(t));
f(t < 0) = t(t < 0);

Ns = [10 30 50];
plot(t, f, 'k', 'LineWidth', 2);
hold on

for N = Ns
    n = (1:N)';
    an = (1 - (-1).^n) ./ (pi*n.^2);
    bn = (-1).^(n+1) ./ n;

    S = -pi/4 + sum(an .* cos(n*t) + bn .* sin(n*t), 1);
    plot(t, S, 'LineWidth', 1.2);
end

legend('Exact function', 'N=10', 'N=30', 'N=50', ...
       'Location', 'eastoutside');

grid on
hold off
