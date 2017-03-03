% Function to calculate DCT
function [v_n] = dct_basis(n,N)
    for i=1:1:N
        if (n == 0)
            v_n(i) = sqrt(1/N)*cos((pi*n/N)*(i-0.5));
        else
            v_n(i) = sqrt(2/N)*cos((pi*n/N)*(i-0.5));
        end
    end
    v_n = v_n';
end