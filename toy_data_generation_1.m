function [X] = toy_data_generation_1(Nf,N,K)
    
    colors = ["*r";"*g";"*b";"*y";"*m";"*c";"*w";"*k"];
    n      = 1:N/2; 
    tao    = n/N; 
    v      = 0;
    s      = 7;
    X = [];
    xt     = ... 
        [abs(cos(2*pi*tao))';... 
        -abs(cos(2*pi*tao))']; 

    for t = 1:Nf

        yt     = ... 
        [abs(t*sin(2*pi*tao))';... 
        abs(t*sin(2*pi*tao))']; 
        seed(s);
        yt += v*rand(length(yt),1);

        X = [X; xt yt];

        %plot(xt,yt,'*r'), hold on, pause(0.1) 
        %axis([min(xt) max(xt) 1 10]) 
    endfor
    
    % Perform clustering
    [idx, centers] = newkmeans (X, K);
    
    %plotting data with clustering
    figure;
    for i = 1:K
      plot (X (idx==i, 1), X (idx==i, 2), colors(i,:));
      hold on;
      plot (centers (:, 1), centers (:, 2), 'kv', 'markersize', 10);
      pause(0.1)
    endfor
    hold off;
   % fprintf([repmat('%f\t', 1, size(X, 2)) '\n'], X');
    print -djpg clustering31.png
endfunction
