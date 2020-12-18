function [X] = toy_data_generation_1(Nf,N,K)
  
    colors = [".r";".g";".b";".y";".m";".c";".k";".w"];
    n      = 1:N/2; 
    tao    = n/N; 
    v      = 0.0;
    s      = 13;
    X = [];
    xt     = ... 
        [abs(cos(2*pi*tao))';... 
        -abs(cos(2*pi*tao))']; 

    for t = 1:Nf

        yt     = ... 
        [abs(t*sin(2*pi*tao))';... 
        abs(t*sin(2*pi*tao))']; 
        %seed(s);
        yt = yt + v*rand(length(yt),1);

        X = [X; xt yt];

        %plot(xt,yt,'*r'), hold on, pause(0.1) 
        %axis([min(xt) max(xt) 1 10]) 
    end
    
    %Normalize matrix X
    X = X./repmat(max(abs(X)),size(X,1),1);
    
    % Perform clustering
    [idx, centers] = newkmeans (X, K);
    
    %Compute Fisher Criterion J
    J_n = 0; 
    J_d = 0;
    for i = 1:K
       J_n = J_n + (trace( (X(idx==i)-mean(X))*(X(idx==i)-mean(X))'));
       J_d = J_d + trace(cov(X(idx==i)));
    end
    J = J_n / J_d;
    
    %plotting data with clustering
    figure;
    for i = 1:K
      axis([-1, 1, -0.1, 1.1]);
      plot (X (idx==i, 1), X (idx==i, 2), colors(i,:));
      hold on;
      %plot (centers (:, 1), centers (:, 2), 'kv', 'markersize', 10);
      pause(0.1)
    end
    hold off;
   %fprintf([repmat('%f\t', 1, size(X, 2)) '\n'], X');
   %print -djpg clustering.jpg
   %print -djpg experiment1_8_0.jpg
end