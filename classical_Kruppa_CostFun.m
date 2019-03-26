function cost = classical_Kruppa_CostFun(c)

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
        
        % epipole of the ith camera in the image of jth camera
        [u, s, v] = svd(Fij');
        eji = v(:,3);
        eji_x = crossmat(eji);
        
        term1 = (Fij * w * Fij');
        term2 = (eji_x*w*eji_x');
        
        if (norm(term1, 'fro') ~= 0) && (norm(term2, 'fro') ~= 0)
            d = term1/norm(term1, 'fro') - term2/norm(term2, 'fro');
            cost = [cost d(1,:) d(2,2:3) d(3,3)];
        end
    end
end

end
