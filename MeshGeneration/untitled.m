Nx = 2;
Lx = 1.0;
Ny = 3;
Ly = 2.0;
Nz = 4;
Lz = 3.0;
m = createMesh3D(Nx, Ny, Nz, Lx, Ly, Lz);
[X, Y, Z] = ndgrid(m.cellcenters.x, m.cellcenters.y, m.cellcenters.z);
[Xf, Yf, Zf] = ndgrid(m.facecenters.x, m.facecenters.y, m.facecenters.z);
figure(4);
plot3(X(:), Y(:), Z(:), 'or')
hold on;
plot3(Xf(:), Yf(:), Zf(:), '+b')
legend('cell centers', 'cell corners');
hold off;