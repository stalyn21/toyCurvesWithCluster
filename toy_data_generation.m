function [X] = toy_data_generation(Nf,N) 

    n      = 1:N/2; 
    tao    = n/N; 
    v      = 0.05;
    s      = 7;
    X = [];
    xt     = ... 
        [abs(cos(2*pi*tao))';... 
        -abs(cos(2*pi*tao))']; 

    for t      = 1:Nf

        yt     = ... 
        [abs(t*sin(2*pi*tao))';... 
        abs(t*sin(2*pi*tao))']; 

        X = [X; xt yt];

        plot(xt,yt,'*r'), hold on, pause(0.1) 
        axis([min(xt) max(xt) 1 10]) 
    end

   % fprintf([repmat('%f\t', 1, size(X, 2)) '\n'], X');

end
