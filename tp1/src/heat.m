
function u = heat (D, k, h, N, f = @(x) 5*cos(50*x));
  
  u = zeros(N, N);
  error = 1;
  r = k*D/h^2;
  
  for i = 2 : N-1
    u(1, i) = f((i - 1)/N);
  end
  
  clf;
  hold on;
  
  n = 1;
  while error < 1e4 && error > 1e-6 && n <= N
    
    plot(1:N, u(n,:));
    
    for i = 2 : N - 1
      u(n + 1, i) = r*(u(n, i + 1) + u(n, i - 1)) + (1 - 2*r)*u(n, i);
    end
    
    error = max(abs(u(n + 1, :) - u(n, :)));
    n++;
    
  end
  
  hold off;
  
end
