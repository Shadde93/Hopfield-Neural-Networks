function [diff,conv,count,Xfinal] = randupdatee(X,W,Xgoal,limit)

conv = false;
count = 0;
n = size(X,2);
mu = size(X,1);
Xresh = reshape(X',1,n*mu);
fignum = 2;

while (not(conv) && count < limit)
    Xprev = X;
    order = randperm(n*mu);
    for i = order
        if i == n*mu
            row = fix(i/n);
        else
            row = fix(i/n)+1;
        end
        col = mod(i,n);
        w = W(row,:);
        Xresh(1,i) = sgn(X(row,:)*w');
    end
    X = reshape(Xresh,n,mu)';
    diff = Xgoal - X;
    if diff == 0
        conv = true;
    end
    %disp(diff);
    if mod(count,100) == 0
        figure(fignum);
        vis(X)
        fignum = fignum+1;
    end
    count = count + 1;

end

Xfinal = X;