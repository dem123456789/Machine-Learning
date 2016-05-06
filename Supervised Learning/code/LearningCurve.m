percentage = linspace(20,80,7);
wine_red_DT_training = [81.6143	84.4776	86.1298	84.6154	87.9285	82.1201	87.5978];
wine_red_DT_test = [52.0833	50.625 53.75 55.8333 52.7083 57.5 59.166];
wine_red_AdaBoost_training = [100 100 100 100 100 100 100];
wine_red_AdaBoost_test = [53.75	60.4167	57.9167	61.875 61.0417 62.7083 65];
wine_red_KNN_training = [100 100 100 100 100 100 100];
wine_red_KNN_test = [52.2917 55.2083 53.75 56.25 55.2083 57.5 58.9583];
wine_red_SVM_training = [61.8834 59.1045 60.4027 62.254	62.4441	61.9413	61.7877];
wine_red_SVM_test = [53.125	53.5417	56.0417	56.0417	57.2917	55.8333	56.25];
wine_red_NN_training = [74.8879	68.0597	68.6801	67.263 67.9583	65.5172	68.0447];
wine_red_NN_test = [52.2917	55 56.6667 56.0417 60.8333 57.0833 57.0833];

wine_white_DT_training = [83.7956 86.8677 84.4639 88.4481 87.8891 88.4952 87.965];
wine_white_DT_test = [47.415 47.8231 48.5034 51.9728 53.4694 55.3741 53.4694];
wine_white_AdaBoost_training = [100 100 100 100 100 100 100];
wine_white_AdaBoost_test = [52.8571	55.6463	57.483 58.4354 59.7959 62.6531 62.585];
wine_white_KNN_training = [100 100 100 100 100 100 100];
wine_white_KNN_test = [48.1633 49.932 51.7687 53.9456 56.8707 57.483 58.9116];
wine_white_SVM_training = [57.0803	54.6693	55.7257	54.9008	54.572 54.5644 54.0481];
wine_white_SVM_test = [51.9048 51.0884 51.7007 51.7687 51.9048 51.1565 51.4966];
wine_white_NN_training = [57.8102 54.3774 54.3774 56.8261 55.9825 56.4402 56.7469];
wine_white_NN_test = [52.2449 52.381 52.381	54.4898	51.9048	54.1497	54.6939];

musk_DT_training = [98.4832	98.8448	99.242 99.1771 98.5921 98.8861 98.836];
musk_DT_test = [91.0101	92.1212	93.2828	93.5859	94.1919	94.4949	96.2121];
musk_AdaBoost_training = [100 100 100 100 100 100 100];
musk_AdaBoost_test = [95.303 96.4646 97.3232 97.7273 98.5354 98.9394 98.8384];
musk_KNN_training = [100 100 100 100 100 100 100];
musk_KNN_test = [92.6263 92.7778 93.6869 94.3939 94.8485 95.0505 95.202];
musk_SVM_training = [100 100 100 100 100 100 100];
musk_SVM_test = [93.8384 94.6465 95.9596 97.2727 98.0808 98.8889 98.8889];
musk_NN_training = [100	99.9278	100	100	100	100	100];
musk_NN_test = [95.101 96.6667 97.9798 98.0303 98.8384 99.1919 99.3434];

figure
hold on 
plot(percentage,wine_red_DT_training,'b')
plot(percentage,wine_red_DT_test,'b--')
plot(percentage,wine_red_AdaBoost_training,'k')
plot(percentage,wine_red_AdaBoost_test,'k--')
plot(percentage,wine_red_KNN_training,'c')
plot(percentage,wine_red_KNN_test,'c--')
plot(percentage,wine_red_SVM_training,'r')
plot(percentage,wine_red_SVM_test,'r--')
plot(percentage,wine_red_NN_training,'g')
plot(percentage,wine_red_NN_test,'g--')
xlabel('Training set (%)')
ylabel('Correctly labeled (%)')
legend('Decision Tree test on Training Set', 'Decision Tree test on Test Set', ...
        'AdaBoost test on Training Set', 'AdaBoost test on Test Set', ...
        'KNN test on Training Set', 'KNN test on Test Set', ...
        'SVM test on Training Set', 'SVM test on Test Set', ...
        'Neural Network test on Training Set', 'Neural Network test on Test Set')
title('Learning Curve of Wine Quality Red dataset') 
hold off
figure
hold on 
plot(percentage,wine_white_DT_training,'b')
plot(percentage,wine_white_DT_test,'b--')
plot(percentage,wine_white_AdaBoost_training,'k')
plot(percentage,wine_white_AdaBoost_test,'k--')
plot(percentage,wine_white_KNN_training,'c')
plot(percentage,wine_white_KNN_test,'c--')
plot(percentage,wine_white_SVM_training,'r')
plot(percentage,wine_white_SVM_test,'r--')
plot(percentage,wine_white_NN_training,'g')
plot(percentage,wine_white_NN_test,'g--')
xlabel('Training set (%)')
ylabel('Correctly labeled (%)')
legend('Decision Tree test on Training Set', 'Decision Tree test on Test Set', ...
        'AdaBoost test on Training Set', 'AdaBoost test on Test Set', ...
        'KNN test on Training Set', 'KNN test on Test Set', ...
        'SVM test on Training Set', 'SVM test on Test Set', ...
        'Neural Network test on Training Set', 'Neural Network test on Test Set')
title('Learning Curve of Wine Quality White dataset') 
hold off
figure
hold on 
plot(percentage,musk_DT_training,'b')
plot(percentage,musk_DT_test,'b--')
plot(percentage,musk_AdaBoost_training,'k')
plot(percentage,musk_AdaBoost_test,'k--')
plot(percentage,musk_KNN_training,'c')
plot(percentage,musk_KNN_test,'c--')
plot(percentage,musk_SVM_training,'r')
plot(percentage,musk_SVM_test,'r--')
plot(percentage,musk_NN_training,'g')
plot(percentage,musk_NN_test,'g--')
xlabel('Training set (%)')
ylabel('Correctly labeled (%)')
legend('Decision Tree test on Training Set', 'Decision Tree test on Test Set', ...
        'AdaBoost test on Training Set', 'AdaBoost test on Test Set', ...
        'KNN test on Training Set', 'KNN test on Test Set', ...
        'SVM test on Training Set', 'SVM test on Test Set', ...
        'Neural Network test on Training Set', 'Neural Network test on Test Set')
title('Learning Curve of MUSK dataset') 
hold off
        