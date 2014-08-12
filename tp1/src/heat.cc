
#include <iostream>
#include <cmath>
#include <cstdlib>
#include <vector>


using namespace std;


int main (int argc, char **argv) {
  
  if (argc != 5) {
    cout << "Uso: " << argv[0] << " D k h N" << endl;
    return 1;
  }
  
  double D, k, h, r;
  int N;
  
  D = atof(argv[1]);
  k = atof(argv[2]);
  h = atof(argv[3]);
  N = atoi(argv[4]);
  r = (D*k) / (h*h);
  
  vector<double> u, v;
  u.resize(N);
  v.resize(N);
  for (int i = 0; i < N; i++) {
    v[i] = 5*cos(50*i/(double) N);
  }
  
  double e = 1;
  for (int n = 0; n < N && e < 1e4 && e > 1e-3; n++) {
    
    u[0] = 0;
    u[N - 1] = 0;
    #pragma omp parallel for
    for (int i = 1; i < N - 1; i++) {
      u[i] = r*(v[i + 1] + v[i - 1]) + (1 - 2*r)*v[i];
    }
    
    e = abs(u[0] - v[0]);
    for (int i = 1; i < N; i++) {
      e = abs(u[i] - v[i]) > e ? abs(u[i] - v[i]) : e;
    }
    
    v = u;
    cout << u[5] << endl;
  }
  
  return 0;
  
}
