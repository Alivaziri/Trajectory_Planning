function R=Rotation(axis , Teta)
axis = upper(axis);
if (axis == 'X')
    R=[1 0 0 0; 0 cosd(Teta) -sind(Teta) 0; 0 sind(Teta) cosd(Teta) 0; 0 0 0 1];
end
if (axis == 'Y') 
    R=[cosd(Teta) 0 sind(Teta) 0; 0 1 0 0; -sind(Teta) 0 cosd(Teta) 0; 0 0 0 1]; 
end
if(axis =='Z')
    R=[cosd(Teta) -sind(Teta) 0 0; sind(Teta) cosd(Teta) 0 0; 0 0 1 0;0 0 0 1];
end 
end
