iter=100;
swarm_size=10;
c1=2;
c2=2;
w=0.7;
LB=-5.12;
UB=5.12;
D=5;

vmax_coef=0.1;
degiskenler=[];
degerler=[];
v_max=vmax_coef*(UB-LB);
v_min=-v_max;

particles_v=v_min+rand(swarm_size,D)*(v_max-v_min);
particles_x=LB+rand(swarm_size,D)*(UB-LB);

%particles_v = [[ 0.65061274, -0.15857199, -0.62260656, -0.63292306, -0.73638317],
%       [-0.52911361, -0.1477967 , -0.35552662,  0.17419301,  0.1881015 ],
%       [-0.56038965,  0.28396534, -0.33634724, -0.01107455, -0.48137293],
%       [-0.88479105, -0.21348517,  1.00554893, -0.87359139,  0.9309841 ],
%       [-0.98083277, -0.24177698,  0.76809215,  0.10677638, -0.63872901],
%       [-0.88319681, -0.11856681, -0.71871515, -0.44607911,  0.60328425],
%       [ 0.13365913,  0.87873648, -0.67903241,  0.27470349,  0.09046379],
%       [ 0.38985908,  0.80321072,  0.98609402,  0.87735485, -0.00181206],
%       [ 0.73807243,  0.40224876, -0.1353508 , -0.8643741 , -0.93525044],
%       [-0.85244773,  0.92643797,  0.9790958 , -0.46123735, -0.44244636]]
%
%particles_x = [[-0.15309862, -3.51241576,  1.63250581, -1.78929636, -1.65019358],
%       [ 4.7655693 , -4.85646753,  1.25601735,  0.23327123, -3.1303889 ],
%       [-0.34369566, -3.85402444, -4.76590936, -0.7531247 , -3.270172  ],
%       [-2.99699485, -0.84471871,  3.86290474,  3.92169358,  4.86812376],
%       [-4.32888572, -1.03572379, -4.92037323,  4.73209546,  3.29121152],
%       [ 2.01375841, -2.74504014,  1.42466959, -3.63160089, -1.60653439],
%       [-0.02847677,  4.26314747,  2.06457758, -0.43525638,  2.58556387],
%       [ 1.22505279, -5.09979431,  1.81094239, -3.1672969 , -1.20651431],
%       [-0.0722347 ,  4.27690159,  3.74077812,  4.55359076,  1.53099599],
%       [ 0.91442964, -0.9358892 , -4.04281608,  3.77631938, -4.14542639]]
f_val=fitnes_fun(particles_x);

p_best=particles_x;
p_best_val=f_val;
[~,index]=min(f_val);
g_best= particles_x(index,:);
g_best_val=f_val(index);
r=rand(D);
rr=rand(D);
%r = [0.33784365, 0.25767638, 0.24743797, 0.21011771, 0.32126972]
%rr =[0.98155284, 0.19163743, 0.51977101, 0.34105693, 0.53782269]
for i=1:iter
    for j=1:swarm_size
        for k=1:D
            r1=r(k);
            r2=rr(k);
            particles_v(j,k)=w*particles_v(j,k)+c1*r1*(p_best(j,k)-particles_x(j,k))+c2*r2*(g_best(1,k)-particles_x(j,k));
            
            particles_x(j,k)=particles_x(j,k)+particles_v(j,k);
            
            if particles_x(j,k)>UB particles_x(j,k)=UB; end
            if particles_x(j,k)<LB particles_x(j,k)=LB; end
            if particles_v(j,k)>v_max particles_v(j,k)=v_max; end
            if particles_v(j,k)<v_min particles_v(j,k)=v_min; end
        end
    end




    f_val= fitnes_fun(particles_x);

    for j=1:swarm_size

        if f_val(j,1)<p_best_val(j,1)
            p_best(j,:)=particles_x(j,:);
            p_best_val(j,1)=f_val(j,1);
        end

        if f_val(j,1)<g_best_val
            g_best=particles_x(j,:);
            g_best_val= f_val(j,1);

        end
    end

    degiskenler(i,:)=g_best;
    degerler(i,1)=g_best_val;



end

disp('Fitness degeri:')
disp([g_best_val])
disp('Tasarım degiskenleri:')
disp([g_best])
plot(degerler);






  
    
    
    
    


