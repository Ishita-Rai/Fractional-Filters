close all
% open Yeo_100_Surface folder before running this file
Vector_num=1;

% V(:,1)=rand(100,1);                 %  V is the vector that you want to plot 
V(:,1)=norm_center2(5,:);
CMIN=min((V(:,Vector_num)));
CMAX=max((V(:,Vector_num)));

% [verts,faces] = freesurfer_read_surf('lh.white');                          % read in surface verts and faces
[verts,faces] = freesurfer_read_surf('lh.pial');                          % read in surface verts and faces
[vertices,label,colortable] = read_annotation('lh.Schaefer2018_100Parcels_17Networks_order.annot');          % read in labels and colortable
label1=label;

for roi = 1:51
    index=colortable.table(roi,end);

    if roi==1
        label1(label == index) = nan;
    else
        
        label1(label == index) =  abs(V(roi-1,Vector_num));
        
    end
    
end

subplot(223);th = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),label1); % make surface -- each unique label gets its own color
 colorbar
% caxis([0 1])

set(th,'edgecolor','none');
axis image;
camlight headlight
material dull
grid off
set(gca,'visible','off')
lightangle(90,0)
view([90 0]);

caxis([CMIN CMAX]);
% climm{V}=[min(abs(V(:,Vector_num))) max(abs(V(:,Vector_num)))];




subplot(221);th = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),label1); % make surface -- each unique label gets its own color
colorbar
% caxis([0 1])
set(th,'edgecolor','none');
axis image;
camlight headlight
material dull
grid off
set(gca,'visible','off')

lightangle(-145,0)
view([-90 0]);

caxis([CMIN CMAX]);



% [verts,faces] = freesurfer_read_surf('rh.white');                          % read in surface verts and faces
[verts,faces] = freesurfer_read_surf('rh.pial');                          % read in surface verts and faces
[vertices,label,colortable] = read_annotation('rh.Schaefer2018_100Parcels_17Networks_order.annot');          % read in labels and colortable
label1=label;

for roi = 1:51
    index=colortable.table(roi,end);
   
    if roi==1
        label1(label == index) = nan;
    else
        label1(label == index) =  abs(V(roi+49,Vector_num));
        
    end
    
end


subplot(222); th = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),label1);                % make surface -- each unique label gets its own color
set(th,'edgecolor','none');
axis image;
camlight headlight
material dull
grid off
set(gca,'visible','off')

caxis([CMIN CMAX]);

lightangle(90,0)
view([90 0]);
colorbar
% caxis([0 1])

subplot(224); th = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),label1);                % make surface -- each unique label gets its own color
set(th,'edgecolor','none');
axis image;
camlight headlight
material dull
grid off
set(gca,'visible','off')

lightangle(-145,0)
view([-90 0]);

caxis([CMIN CMAX]);

colormap(jet)
colorbar
% caxis([0 1])
