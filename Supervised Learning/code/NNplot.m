epoch = [100 500 1000 2000];

wine_red32_training = [63.1814 67.3816 68.9008 69.437];
wine_red32_test = [57.8195 58.2663 57.9088 57.9982];
wine_red34_training = [62.1984 65.9517 66.5773 67.3816];
wine_red34_test = [57.8195 57.6408 56.3896 57.3727];
wine_red52_training = [62.109 65.0581 65.6836 67.8284];
wine_red52_test = [56.7471 57.5514 57.0152 57.1046];
wine_red54_training = [62.5559 66.756 67.6497 68.0071];
wine_red54_test = [56.7471 58.2663 58.1769 57.5514];

wine_white32_training = [55.9802 57.9638 59.3641 60.2392];
wine_white32_test = [53.6464 53.238	53.6173	52.7713];
wine_white34_training = [55.9802 58.1097 58.6931 59.014];
wine_white34_test = [52.8005 52.4796 51.2252 51.4586];
wine_white52_training = [56.6803 58.5181 58.7223 59.7725];
wine_white52_test = [52.217	51.8378	52.1004	51.7503];
wine_white54_training = [55.4259 58.8098 59.4224 59.3349];
wine_white54_test = [51.867	51.3711	50.6418	51.2544];

musk32_training = [100 100 100 100];
musk32_test = [98.4625 98.7224 98.7874 98.809];
musk34_training = [100 100 100 100];
musk34_test = [98.874 98.9173 98.9389 98.9606];
musk52_training = [100 100 100 100];
musk52_test = [98.744 98.809 98.8307 98.9389];
musk54_training = [94.9545 99.0039 99.2854 99.5019];
musk54_test = [98.4192 98.4192 98.8523 98.8307];

figure
hold on 
plot(epoch,wine_red32_training,'b')
plot(epoch,wine_red32_test,'b--')
plot(epoch,wine_red34_training,'k')
plot(epoch,wine_red34_test,'k--')
plot(epoch,wine_red52_training,'c')
plot(epoch,wine_red52_test,'c--')
plot(epoch,wine_red54_training,'r')
plot(epoch,wine_red54_test,'r--')
xlabel('epoch (training time)')
ylabel('Correctly labeled (%)')
legend('M = 0.3, L = 0.2, test on Training Set', 'M = 0.3, L = 0.2, test on Test Set', ...
       'M = 0.3, L = 0.4, test on Training Set', 'M = 0.3, L = 0.4, test on Test Set', ...
       'M = 0.5, L = 0.2, test on Training Set', 'M = 0.5, L = 0.2, test on Test Set', ...
       'M = 0.5, L = 0.4, test on Training Set', 'M = 0.5, L = 0.4, test on Test Set')
title('Neural Network on Wine Quality Red dataset') 
hold off

figure
hold on 
plot(epoch,wine_white32_training,'b')
plot(epoch,wine_white32_test,'b--')
plot(epoch,wine_white34_training,'k')
plot(epoch,wine_white34_test,'k--')
plot(epoch,wine_white52_training,'c')
plot(epoch,wine_white52_test,'c--')
plot(epoch,wine_white54_training,'r')
plot(epoch,wine_white54_test,'r--')
xlabel('epoch (training time)')
ylabel('Correctly labeled (%)')
legend('M = 0.3, L = 0.2, test on Training Set', 'M = 0.3, L = 0.2, test on Test Set', ...
       'M = 0.3, L = 0.4, test on Training Set', 'M = 0.3, L = 0.4, test on Test Set', ...
       'M = 0.5, L = 0.2, test on Training Set', 'M = 0.5, L = 0.2, test on Test Set', ...
       'M = 0.5, L = 0.4, test on Training Set', 'M = 0.5, L = 0.4, test on Test Set')
title('Neural Network on Wine Quality White dataset') 
hold off

figure
hold on 
plot(epoch,musk32_training,'b')
plot(epoch,musk32_test,'b--')
plot(epoch,musk34_training,'k')
plot(epoch,musk34_test,'k--')
plot(epoch,musk52_training,'c')
plot(epoch,musk52_test,'c--')
plot(epoch,musk54_training,'r')
plot(epoch,musk54_test,'r--')
xlabel('epoch (training time)')
ylabel('Correctly labeled (%)')
legend('M = 0.3, L = 0.2, test on Training Set', 'M = 0.3, L = 0.2, test on Test Set', ...
       'M = 0.3, L = 0.4, test on Training Set', 'M = 0.3, L = 0.4, test on Test Set', ...
       'M = 0.5, L = 0.2, test on Training Set', 'M = 0.5, L = 0.2, test on Test Set', ...
       'M = 0.5, L = 0.4, test on Training Set', 'M = 0.5, L = 0.4, test on Test Set')
title('Neural Network on MUSK dataset') 
hold off


