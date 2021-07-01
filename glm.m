% script to find the spatial correlation between RSNs defined by Yeo et al. and
% cluster centroids
%  Create regressor matrix
load('Yeo_Networks.mat');
X=[];
for sys= 1:7 % totall number of RSN systems
tmm=double(Yeo_Network(:,2)==sys);    
X=[X (tmm)];
 
end

clear  b bint r rint stats y
for clust1 = 1:5   % total number of kmean clusters
% norm_center2 is the cluster centroid vector
y=norm_center2(clust1,:)';
[b{clust1},bint{clust1},r{clust1},rint{clust1},stats{clust1}] = regress(y,X);
end
F = [b{1,1} b{1,2} b{1,3} b{1,4} b{1,5}];
F = F';
imagesc(F);