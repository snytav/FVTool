clc; clear; % clear the screen and memory
L = 0.01; % a 1 cm domain
Ly = L/10;
Lz = L/10;
Nx = 3; % number of cells %%%%%
Ny = 1;
Nz = Ny;
m = createMesh3D(Nx,Ny,Nz,L, Ly,Lz); % create the mesh
BC = createBC(m); % construct the BC structure (Neumann by default)

BC.left.a(:) = 0; BC.left.b(:) = 1; BC.left.c(:) = 1; % Left boundary to Dirichlet
BC.right.a(:) = 0; BC.right.b(:) = 1; BC.left.c(:) = 1; % right boundary to Dirichlet

D = createCellVariable(m, 1e-5); % assign a constant value of 1e-5 to diffusivity value on each cell

D_face = harmonicMean(D); % average diffusivity value on the cell faces

M_diff = diffusionTerm(D_face); % matrix of coefficients for diffusion term
[M_bc, RHS_bc] = boundaryCondition(BC); % matrix of coefficient and RHS vector for the boundary condition

c = solvePDE(m, M_diff+M_bc, RHS_bc);

%visualizeCells(c); % just for simplified case with Ny = Nz = 1
xx = L/Nx:L/Nx:L;
plot(xx,c.value(2:end-1,2:end-1,2:end-1),'o');
xlabel('X');
title('Diffusion for 10x1x1 mesh');
