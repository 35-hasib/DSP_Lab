function X = ang(x,N)
    X = zeros(1,N);
    for k = 1:N
        xr = real(x(k));
        xi = imag(x(k));
        if abs(xr) < 1e-6
            xr = 0;
        end
        if abs(xi) < 1e-6
            xi = 0;
        end
        X(k) = rad2deg(atan(xi/xr));
    end
    X(isnan(X)) = 0;
end