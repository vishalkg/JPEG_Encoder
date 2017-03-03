clear all; close all

x = imread('sample_img.png'); 
x = im2double(x); 
N = size(x,1);

v = cell(1, N);  %cell containg 1D DCT basis vectors
for i=1:1:N
    v{1,i} = dct_basis(i-1,N);
end

phi = cell(N);  %cell containing 2D DCT basis vectors
for i=1:1:N
    for j=1:1:N
        phi{i,j} = v{1,i}*v{1,j}';
    end
end

for i=1:1:N
    for j=1:1:N
        T(i,j) = sum(sum(phi{i,j}.*x));
    end
end

% Since we have calculated a N point DCT and we also have the corresponding
% coeeficients; We can now take any no. of coefficients to approximate

subplot(2,3,1); imshow(x);
plot_count = 1;
for m = 40:10:80
    x_hat = zeros(N,N);
    for i=1:1:m
        for j=1:1:m
            x_hat = x_hat + T(i,j)*phi{i,j};
        end
    end
    plot_count = plot_count + 1;
    subplot(2,3,plot_count); imshow(x_hat);
    error(plot_count-1,:) = [i^2 abs(sum(sum(x-x_hat)))]; 
    clear x_hat;
end
figure; plot(error(:,1), error(:,2));
