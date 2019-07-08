didconverge = 0;
for i = 1:20
    clear y;
    for k = 1:i
        a = [a;flip(-ones(1,1000),100)];
    end
Patterns = t0(flip(-ones(5,1000),100));

N = size(Patterns,2);
P = size(Patterns,1);
bias = 0.5;

rho = 1/(N*P)*sum(sum(Patterns))

W = (Patterns'-rho)*(Patterns-rho);

%Update

conv = false;
count = 0;
Xgoal = Patterns(1);
X = t0(flip(a(2,:),1));
limit = 100;


while (not(conv) && count < limit)
    %Xprev = X;
    X = 0.5 + 0.5*sgn(X*W - bias);
    diff = Xgoal - X;
    if diff == 0
        conv = true;
        didconverge = [didconverge 1];
    end
    %disp(diff);
    count = count + 1;
end
if conv == 0
    didconverge = [didconverge 0];
end
end
Xfinal = X;
