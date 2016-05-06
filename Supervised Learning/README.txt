To run the code
1. Install Weka
2. Copy ./Supporting Files/dataset folder under Weka folder
3. Copy ./code/*.sh files under Weka folder
4. Run .sh file with bash

FILE DESCRIPTION
code/
	*.sh/
		J48.sh 					%Decision Tree runnable (10-fold crossvalidation)
		AdaBoost.sh 			%Boosting runnable (10-fold crossvalidation)
		KNN.sh 					%KNN runnable (10-fold crossvalidation)
		Neural_Network.sh 		%Neural Network runnable (3-fold crossvalidation)
		SVM.sh 					%SVM runnable (10-fold crossvalidation)
		Split.sh 				%Split 70% traning data into subset of training data with percentage from 20% to 80%
		win_red_test.sh 		%Learning Curve runnalbe, run with the best model chosen for each algorithm
		win_white_test.sh 		%Learning Curve runnalbe, run with the best model chosen for each algorithm
		musk_test.sh 			%Learning Curve runnalbe, run with the best model chosen for each algorithm
	*.m/
		NNplot.m 				%Generate Neural Network Plot with Matlab
		KNNplot.m				%Generate KNN Plot with Matlab
		LearningCurve.m			%Generate Learning Curve Plot with Matlab

Supproting Files/
	dataset/
		musk.info							%info about Musk dataset
		winequality.info					%info about wine quality dataset
		clean2.arff							%raw musk dataset
		clean2_test_70.arff					%musk split into 70% training
		clean2_training_70.arff				%musk split into 30% test
		winequality-red.arff				%raw wine quality red dataset
		winequality-red_test_70.arff		$raw wine quality red split into 70% training
		winequality-red_training_70.arff	%raw wine quality red split into 30% test
		winequality-white.arff				%raw wine quality white musk dataset
		winequality-white_test_70.arff      %raw wine quality white split into 70% training
		winequality-white_training_70.arff  %raw wine quality white split into 30% test
		After_Split/						%All files split from 70% training set with Split.sh
	output/ 								%All the raw output from Weka with algorithm .sh file (since it takes so long to run, I added)
	Analysis.xlsx							%Statistical result manually taken and labeled from the raw output
					
ediao3-analysis.pdf							%My report
	
		
		
		
		
		
		
		
		
		