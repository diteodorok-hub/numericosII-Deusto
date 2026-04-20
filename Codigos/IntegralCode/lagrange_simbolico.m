function P = lagrange_simbolico(x_data, y_data)

    syms x
    n = length(x_data);
    P = 0;

    for i = 1:n
        L = 1;
        for j = 1:n
            if j ~= i
                L = L * (x - x_data(j)) / (x_data(i) - x_data(j));
            end
        end
        P = P + y_data(i)*L;
    end

    P = expand(P);

end