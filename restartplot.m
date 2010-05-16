clear all
close all

function y = exp_2par(t, par)
  y = par(1) .* exp(par(2).*t);
end

A=[3.287e-04 4.6564e-04 5.8610e-04 0.001 0.0013 0.0016 0.0131 0.026 0.0678; 3.999 2.94 2.3645 1.3553 2.004 1.2288 0.4542 0.4103 0.4319; 342 244.69 192.6491 108.67 89.3383 69.87 8.6932 4.3 1.6460];

for p=1:9
  B(1,p)=A(1,p);
  C(1,p)=(A(3,p)/A(2,p));
end

# B und C muessen spaltenvektoren sein ...
[f1,p1,kvg1,iter1] = leasqr(B.', C.', [80 -100],"exp_2par",1e-6,30)

x = linspace(B(1), B(length(B)), 500);
efu = p1(1) .* exp(p1(2).*x);

plot(B,C,'o')
hold on
plot(x,efu)

