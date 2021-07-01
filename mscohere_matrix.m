function [cxy] = mscohere_matrix(A,fs)
% Function to compute coherence between each column of
% matrix. Since coherence between (i,j) and (j,i) is same, therefore, only
% half matrix is computed. Columns of A represent variables and the
% rows represent observations. Mean value across all possible frequencies
% (measure functional connectivity) is stored in one element.
cxy = zeros(size(A,2));
    for i = 1:size(A,2)
        for j = 1:size(A,2)
            if j < i
               cxy(i,j) = cxy(j,i);
            else
%                coherence = max(mscohere(A(:,i),B(:,j),[],[],[],fs)); 
               coherence = mean(mscohere(A(:,i),A(:,j),[],[],[],fs)); 
               cxy(i,j) = coherence;
            end
        end    
    end
end