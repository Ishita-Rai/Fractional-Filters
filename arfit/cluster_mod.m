%FOS

% Split the fractional eigenvectors of all subjects into 5 clusters
% [idx1,center1] = kmeans(abs(F_e.'),5);
% [idx1,center1] = kmeans(abs(V'),3);
% % Find the corresponding eigenvalues of all subjects
% idx11 = zeros(100,1*4);
% for i = 1:1*4
% idx11(:,i) = idx1((100*i-99):100*i,1);
% end
% 
% % F_d_cluster = F_d;
% F_d_cluster = D';
% F_d_cluster3 = zeros(100,1*4);
% for i = 1:100
%     F_d_cluster2 = F_d_cluster(i,:);
%     F_d_cluster2(find(F_d_cluster2==0))=[];
%     F_d_cluster3(i,:) = F_d_cluster2;
% end
% 
% F_d_cluster4 = zeros(100,5);
% F_d_cluster5 = zeros(100,5);
% F_d_cluster6 = zeros(5,100*4*1);
% for i = 1:1*4
%     for j = 1:100
%         F_d_idx = idx11(j,i);
%         F_d_cluster4(j,F_d_idx) = F_d_cluster3(j,i);
%         F_d_cluster5 = F_d_cluster4.';
%     end
%     F_d_cluster6(:,(100*i-99):100*i) = F_d_cluster5;
% end
% 
% for i = 1:5
%     F_d_cluster7 = F_d_cluster6(i,:);
%     X=real(F_d_cluster7);
%     Y=imag(F_d_cluster7);
%     scatter(X,Y,'*');
%     xlabel('Real Part')
%     ylabel('Imaginary Part')
%     legend('Cluster1','Cluster2','Cluster3','Cluster4','Cluster5')
%     hold on
% end
% hold off


% %LTI
% [idx2,center2] = kmeans(abs(l_e.'),5);
[idx2,center2] = kmeans(abs(V'),5);

idx22 = zeros(100,1*4);
for i = 1:1*4
idx22(:,i) = idx2((100*i-99):100*i,1);
end

l_d_cluster = D';
l_d_cluster3 = zeros(100,1*4);
for i = 1:100
    l_d_cluster2 = l_d_cluster(i,:);
    l_d_cluster2(find(l_d_cluster2==0))=[];
    l_d_cluster3(i,:) = l_d_cluster2;
end

l_d_cluster4 = zeros(100,5);
l_d_cluster5 = zeros(100,5);
l_d_cluster6 = zeros(5,100*4*98);
for i = 1:1*4
    for j = 1:100
        l_d_idx = idx22(j,i);
        l_d_cluster4(j,l_d_idx) = l_d_cluster3(j,i);
        l_d_cluster5 = l_d_cluster4.';
    end
    l_d_cluster6(:,(100*i-99):100*i) = l_d_cluster5;
end

for i = 1:5
    l_d_cluster7 = l_d_cluster6(i,:);
    X=real(l_d_cluster7);
    Y=imag(l_d_cluster7);
    scatter(X,Y,'*');
    xlabel('Real Part')
    ylabel('Imaginary Part')
    legend('Cluster1','Cluster2','Cluster3','Cluster4','Cluster5')
    hold on
end
hold off

corralation_cluster = corr(center1,center2);