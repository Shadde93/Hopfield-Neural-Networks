abc = sgn(randn(300,100));
w = zeros(100,100);
converge = zeros(1,size(w,1));
convergednum = zeros(1,size(w,1));
flipper = 0;


for i = 1:size(w,1)
    number = 0;
    dummy = abc(i,:);
    w = w + dummy'*dummy;
    w = w-diag(diag(w));
    for j = 1:i
        if flipper
            test = abc(j,:);
            flipped = flip(test,10);
            [diff,conv,count,Xfinal] = updatee(flipped,w,abc(j,:),5);
        else
            [diff,conv,count,Xfinal] = updatee(abc(j,:),w,abc(j,:),5);
        end
        if conv == 1
            number = number + 1;
        end
    end
    
    converge(i) = conv;
    convergednum(i) = number;
end

plot(1:size(w,1),convergednum)
max(max(convergednum))