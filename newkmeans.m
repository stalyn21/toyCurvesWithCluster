function  [assignments, centers] = newkmeans(X, k)
  centers = 0; 
  maxiter = 200;
  s = 4;
  if (centers == 0)
    %seed(s);
    centerRows = randperm(size(X,1));
    centers = X(centerRows(1:k), :);
  end
  numOfRows = length(X(:,1));
  numOfFeatures = length(X(1,:));
  assignments = ones(1, numOfRows);

  for iter = 1:maxiter
    clusterTotals = zeros(k, numOfFeatures);
    clusterSizes = zeros(k, 1);
    for rowIx = 1:numOfRows
     minDist = realmax;
     assignTo = 0;
     for centerIx = 1:k 
      % Euclidian distance is used.
      dist = sqrt(sum((X(rowIx, : ) - centers(centerIx, :)).^2));
      if dist < minDist
       minDist = dist;
       assignTo = centerIx;
      end
     end
     assignments(rowIx) = assignTo;

     % Keep these information to calculate cluster centers.
     clusterTotals(assignTo, :) = clusterTotals(assignTo, :) + X(rowIx, :);
     clusterSizes(assignTo) = 1 + clusterSizes(assignTo);
    end

    % This process is called 'singleton' in terms of Matlab. 
    % If a cluster is empty choose a random data point as new 
    % cluster cener.
    for clusterIx = 1:k
     if (clusterSizes(clusterIx) == 0)
       %seed(s);
       randomRow = round(1 + rand() * (numOfRows - 1) );
       clusterTotals(clusterIx, :) =  X(randomRow, :);
       clusterSizes(clusterIx) = 1;
      end
    end

    newCenters = zeros(k, numOfFeatures);
    for centerIx = 1:k 
     newCenters(centerIx, :) = clusterTotals(centerIx, : ) / clusterSizes(centerIx);
    end
   
    diff = sum(sum(abs(newCenters - centers)));
   
    if diff < eps
     %disp('Centers are same, which means we converged before maxiteration count. This is a good thing!')
     break;
    end
   
    centers = newCenters;
  end 
  assignments = assignments';
   %printf('iter: %d, diff: %f\n', iter, diff);
end