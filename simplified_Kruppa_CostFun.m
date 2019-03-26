function cost = simplified_Kruppa_CostFun(c)

global Fs;

% structure of c
%c = [A(1, 1), A(2, 2), A(1, 2), A(1, 3), A(2, 3)] ;
A = zeros(3, 3);
A(1, 1) = c(1); 
A(2, 2) = c(2);
A(1, 2) = c(3);
A(1, 3) = c(4); 
A(2, 3) = c(5);
A(3, 3) = 1;

w = A*A';

% compute the cost
cost = [];
for i = 1:size(Fs, 3) - 1
    for j = i+1:size(Fs, 3)
        Fij = Fs(:,:,i, j);
        
        % epipole of the first camera in the image of the second
        [u, s, v] = svd(Fij');
        r = s(1, 1);
        s = s(2, 2);
        
        
        
        a = (r^2*v(:,1)'*w*v(:,1)) * (-u(:,1)'*w*u(:,2));
        b = (r*s*v(:,1)'*w*v(:,2)) * (u(:,2)'*w*u(:,2));
        c = (r*s*v(:,1)'*w*v(:,2)) * (u(:,1)'*w*u(:,1));
        d = (s^2*v(:,2)'*w*v(:,2)) * (-u(:,1)'*w*u(:,2));
        
        cost = [cost, (a - b) / (a + b), (c - d) / (c + d)];
        
    end
end



end
