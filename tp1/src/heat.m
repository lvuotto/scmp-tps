
function heat (D, dt, N, it, f = @(x) 0);
  
  dx = 1.0/N;
  vec_size = N;
  u = zeros(1, vec_size);
  v = zeros(1, vec_size);
  
  clf;
  hold on;
  
  v(1) = 10;
  for i = 2 : vec_size - 1
    v(i) = f(i*dx);
  end
  v(vec_size) = -5;
  
  error = 1;
  n = 1;
  r = dt/(dx^2);
  while error < 1e4 && error > 1e-3 && n <= it
    plot(linspace(0, 1, vec_size), v, 'b');
    
    u(1) = 10;
    for i = 2 : vec_size - 1
      u(i) = r*(v(i + 1) + v(i - 1)) + (1 - 2*r)*v(i);
    end
    u(vec_size) = -5;
    
    error = max(abs(u - v));
    v = u;
    n++;
  end
  
  printf("D=%f r=%f n=%d error=%f\n", D, r, n, error);
  
  hold off;
  
end
