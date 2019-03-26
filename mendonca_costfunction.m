function cost = mendonca_costfunction(c)

global Fs;

% c_init = [A(1, 1), A(2, 2), A(1, 2), A(1, 3), A(2, 3)] ;
A = zeros(3, 3);
A(1, 1) = c(1); 
A(2, 2) = c(2);
A(1, 2) = c(3);
A(1, 3) = c(4); 
A(2, 3) = c(5);
A(3, 3) = 1;


% compute the cost
cost = [];
for i = 1:size(Fs, 3) - 1
    for j = i+1:size(Fs, 3)
        % for each fundamental matrix
        Fij = Fs(:,:,i, j);
        % compute the corresponding essential matrix
        Eij = A'*Fij*A;
        
        % find its singular values
        [u, s, v] = svd(Eij);
        
        % add difference of first and second singular values to cost vector    
        cost = [cost, (s(1, 1)-s(2, 2))/(s(1, 1)+s(2, 2))];
        
    end
end

end
