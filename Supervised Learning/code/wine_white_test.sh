echo "-------------------------------Wine Quality White Decision Tree----------------------------------" >> wine_white_test

for percentage in 20 30 40 50 60 70 80
do
	echo "------------------------------------------------------------------------------------------------" >> wine_white_test
	echo "percentage:" $percentage >> wine_white_test
	java -classpath weka.jar weka.classifiers.trees.J48 \
	-t ./dataset/After_Split/winequality-white_training_70_$percentage-training.arff \
	-T ./dataset/winequality-white_test_70.arff \
	-C 0.25 \
	-M 2 \
	>> wine_white_test
done

echo "-------------------------------Wine Quality White AdaBoost----------------------------------" >> wine_white_test

for percentage in 20 30 40 50 60 70 80
do
	echo "------------------------------------------------------------------------------------------------" >> wine_white_test
	echo "percentage:" $percentage >> wine_white_test
	java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
	-t ./dataset/After_Split/winequality-white_training_70_$percentage-training.arff \
	-T ./dataset/winequality-white_test_70.arff \
	-P 100 \
	-S 1 \
	-I 40 \
	-W weka.classifiers.trees.J48 \
	-- -C 0.25 \
	-M 2 \
	>> wine_white_test
done

echo "-------------------------------Wine Quality White KNN----------------------------------" >> wine_white_test

for percentage in 20 30 40 50 60 70 80
do
	echo "---------------------------------------------------------------------------------------------" >> wine_white_test
	echo "percentage:" $percentage >> wine_white_test
	java -classpath weka.jar weka.classifiers.lazy.IBk \
	-t ./dataset/After_Split/winequality-white_training_70_$percentage-training.arff \
	-T ./dataset/winequality-white_test_70.arff \
	-K 1 \
	-W 0 \
    -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" \
	>> wine_white_test
done

echo "-------------------------------Wine Quality White SVM RBFKernel----------------------------------" >> wine_white_test

for percentage in 20 30 40 50 60 70 80
do
	echo "------------------------------------------------------------------------------------------------" >> wine_white_test
	echo "percentage:" $percentage >> wine_white_test
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/After_Split/winequality-white_training_70_$percentage-training.arff \
	-T ./dataset/winequality-white_test_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1\
	-K "weka.classifiers.functions.supportVector.RBFKernel -C 250007 -G 1" \
	>> wine_white_test
done

echo "-------------------------------Wine Quality White Neural Network----------------------------------" >> wine_white_test
for percentage in 20 30 40 50 60 70 80
do
	echo "------------------------------------------------------------------------------------------------" >> wine_white_test
	echo "percentage:" $percentage >> wine_white_test
	java -classpath weka.jar weka.classifiers.functions.MultilayerPerceptron \
	-t ./dataset/After_Split/winequality-white_training_70_$percentage-training.arff \
	-T ./dataset/winequality-white_test_70.arff \
	-L 0.2 \
	-M 0.3 \
	-N 100 \
	-V 0 \
	-S 0 \
	-E 20 \
	-H a \
	>> wine_white_test
done
