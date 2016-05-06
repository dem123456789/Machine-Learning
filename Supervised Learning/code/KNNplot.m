K = 1:5;
wine_red_training = [100 78.9991 76.9437 73.3691 70.5987];
wine_red_test = [61.0366 58.1769 56.3896 57.9088 57.5514];
wine_white_training = [100 79.3174 73.7748 68.9615 67.9113];
wine_white_test = [61.1435 53.8506 53.9382 53.8798 54.4049];
musk_training = [100 98.0728 98.3976 97.6397 97.5964];
musk_test = [94.9112 96.492 95.7557 96.3404 95.864];

figure
hold on 
plot(K,wine_red_training,'b')
plot(K,wine_red_test,'b--')
plot(K,wine_white_training,'r')
plot(K,wine_white_test,'r--')
xlabel('number of nearest neighbors')
ylabel('Correctly labeled (%)')
legend('test on Wine Quality Red Training Set', 'test on Wine Quality Red Test Set', ...
        'test on Wine Quality White Training Set', 'test on Wine Quality white Test Set')
title('K Nearest Neighbors accuracy evaluation on Wine Quality Red and White dataset') 
hold off
figure
hold on 
plot(K,musk_training,'r')
plot(K,musk_test,'r--')
xlabel('number of nearest neighbors')
ylabel('Correctly labeled (%)')
title('K Nearest Neighbors accuracy evaluation on MUSK dataset') 
hold off