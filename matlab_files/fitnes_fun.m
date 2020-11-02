
function[y] = fitnes_fun(xx)
  d=size(xx,2);
  for k=1:size(xx,1)
        
    sum=0;
    for ii=1:d
        xi=xx(k,ii);
        sum=sum+xi^2;
    end

    y(k,:)=sum;

  end
end