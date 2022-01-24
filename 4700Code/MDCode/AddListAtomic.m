%clear
clearvars
clearvars -GLOBAL
close all
format shorte

Atomic(X0, Y0, Z0, VX0, VY0, VZ0, Types, InitDist, Temp)
global C
global x y z  AtomSpacing
global nAtoms
global AtomType Vx Vy Vz Mass0 Mass1 Mass2,

xp = X0;
yp = Y0;
zp = Z0;
numAtoms = length(X0);

x(nAtoms + 1:nAtoms+numAtoms) = xp + (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist;
y(nAtoms + 1:nAtoms+numAtoms) = yp + (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist;
z(nAtoms + 1:nAtoms+numAtoms) = zp + (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist;

iTypes = Types == 1;
Mass = ones(1,numAtoms)*Mass0;
Mass(iTypes) = Mass1;

AtomType(nAtoms + 1:nAtoms + numAtoms) = Types;


if Temp == 0
    Vx(nAtoms + 1:nAtoms + numAtoms) = 0;
    Vy(nAtoms + 1:nAtoms + numAtoms) = 0;
    Vz(nAtoms + 1:nAtoms + numAtoms) = 0;
else
    std0 = sqrt(C.kb * Temp ./ Mass);

    Vx(nAtoms + 1:nAtoms + numAtoms) = std0 .* randn(1, numAtoms);
    Vy(nAtoms + 1:nAtoms + numAtoms) = std0 .* randn(1, numAtoms);
    Vz(nAtoms + 1:nAtoms + numAtoms) = std0 .* randn(1, numAtoms);
end

Vx(nAtoms + 1:nAtoms + numAtoms) = Vx(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vx(nAtoms + 1:nAtoms + numAtoms)) + VX0;
Vy(nAtoms + 1:nAtoms + numAtoms) = Vy(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vy(nAtoms + 1:nAtoms + numAtoms)) + VY0;
Vz(nAtoms + 1:nAtoms + numAtoms) = Vz(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vy(nAtoms + 1:nAtoms + numAtoms)) + VZ0;


nAtoms = nAtoms + numAtoms;


