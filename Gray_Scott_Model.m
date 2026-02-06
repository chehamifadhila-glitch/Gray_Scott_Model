% This script generates circular Turing patterns.

% Initialize the random seed for reproducibility
rng(10);

% Grid parameters
GridSize_x = 300;
GridSize_z = 300;

% Reaction-diffusion model parameters
f  = 0.036;     % Feed rate
k  = 0.065;     % Kill rate
d_U = 1;        % Diffusion coefficient for U
d_V = d_U/2;    % Diffusion coefficient for V

% Temporal parameters
dt = 1;

% Initial number of random spots
NumSpots = floor(GridSize_x/2);

% Iteration parameters
NumIterations = 100000;
FrameSpacing = round(logspace(log10(100), log10(NumIterations), 100));

% Initialize concentrations
U = single(ones(GridSize_x, GridSize_z));
V = single(zeros(GridSize_x, GridSize_z));

% Generate initial random spots
for i = 1:NumSpots
    xrand = randi([2, GridSize_x-2]);
    yrand = randi([2, GridSize_z-2]);

    V(xrand-1:xrand+1, yrand-1:yrand+1) = 1;
    U(xrand-1:xrand+1, yrand-1:yrand+1) = 0;
end

% Waveguide width
WG_width = 25;

% Visualization counter
cc = 1;

% Main iteration loop
for i = 1:NumIterations

    UV2 = U .* V.^2;

    U = U + dt * d_U .* laplacian(U) - UV2 + f .* (1 - U);
    V = V + dt * d_V .* laplacian(V) + UV2 - (f + k) .* V;

    %Apply a geometric constraint during pattern evolution to define a 90° waveguiding path
    V(floor(GridSize_x/2-WG_width/2):end, ...
        floor(GridSize_z/2-WG_width/2):floor(GridSize_z/2+WG_width/2)) = 0;

    V(floor(GridSize_x/2-WG_width/2):floor(GridSize_x/2+WG_width/2), ...
        floor(GridSize_z/2):end) = 0;



    if mod(i, FrameSpacing(cc)) == 0

        cc = cc + 1;

        figure(1);
        set(gcf, 'color', 'w');
        pcolor(V);
        shading flat;
        axis equal tight off;
        colorbar;
        title(['Iteration = ', num2str(i)]);
        drawnow;

    end
end

% Thresholding
Vn = V ./ max(abs(V(:)));
rho = 0.15;
binaryPattern = double(Vn > rho);

figure(2);
set(gcf, 'color', 'w');
pcolor(binaryPattern);
shading flat;
axis equal tight off;
colorbar;
drawnow;

% Discrete Laplacian operator
function L = laplacian(F)
L = -1 * F + ...
    0.2 * (circshift(F, 1, 1) + circshift(F, -1, 1) + ...
    circshift(F, 1, 2) + circshift(F, -1, 2)) + ...
    0.05 * (circshift(F, [1  1]) + circshift(F, [1 -1]) + ...
    circshift(F, [-1  1]) + circshift(F, [-1 -1]));
end

