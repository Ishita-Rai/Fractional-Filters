clear all
close all
clc

%[verts,faces] = freesurfer_read_surf('lh.white');                          % read in surface verts and faces
[verts,faces] = freesurfer_read_surf('lh.pial');                          % read in surface verts and faces
[vertices,label,colortable] = read_annotation('lh.aal626.annot');          % read in labels and colortable

% each brain region is listed in colortable.struct_names and has a
% corresponding label colortable.table(:,end). you need to match the brain
% regions in your network to the correct regions in
% colortable.struct_names. once you've done this, you'll know each region's
% label name and you can find all of the vertices assigned to that region
% in the "label" variable.
%
% Example:
% the 10th region in the list can be accessed as
% colortable.struct_names{10} and it tells us that it is Precentral_L_9.
% its label is colortable.table(10,end) = 14661273 (the label number itself
% is arbitrary as far as i can tell). now you do something like this:
% label(label == 14661273) = x where x is the value you want all
% Precentral_L_9 surface vertices to have.

th = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),label);                % make surface -- each unique label gets its own color
set(th,...
    'edgecolor','none');
axis image;
camlight headlight
material dull