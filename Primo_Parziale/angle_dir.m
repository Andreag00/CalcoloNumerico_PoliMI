function [angle] = angle_dir(p1,p2,type)
% [angle] = angle_dir(p1,p2,type): Calcola angolo tra due direzioni p1 e p2
%
% p1: direzione 1
% p2: direzione 2
% type: 
%       deg: gradi
%       rad: radianti
%       Se non indicato -> radianti
%
% angle: angolo tra p1 e p2

if nargin == 2
    type = 'rad';
end

angle = acos(dot(p1,p2) / norm(p1) / norm(p2));

if(strcmp(type,'deg'))
    angle = angle * 180 / pi;
end

end

