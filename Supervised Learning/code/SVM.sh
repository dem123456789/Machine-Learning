echo "-------------------------------Wine Quality Red SVM PolyKernel----------------------------------" >> SVM_wine_red

for exponent in 1 2 3
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_wine_red
	echo "exponent:" $exponent >> SVM_wine_red
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/winequality-red_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1\
	-K "weka.classifiers.functions.supportVector.PolyKernel -C 250007 -E $exponent" \
	>> SVM_wine_red
done

echo "-------------------------------Wine Quality Red SVM RBFKernel----------------------------------" >> SVM_wine_red

for gamma in 0.01 0.5 1
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_wine_red
	echo "gamma:" $gamma >> SVM_wine_red
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/winequality-red_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1 \
	-K "weka.classifiers.functions.supportVector.RBFKernel -C 250007 -G $gamma" \
	>> SVM_wine_red
done

echo "-------------------------------Wine Quality White SVM PolyKernel----------------------------------" >> SVM_wine_white

for exponent in 1 2 3
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_wine_white
	echo "exponent:" $exponent >> SVM_wine_white
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/winequality-white_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1 \
	-K "weka.classifiers.functions.supportVector.PolyKernel -C 250007 -E $exponent" \
	>> SVM_wine_white
done

echo "-------------------------------Wine Quality White SVM RBFKernel----------------------------------" >> SVM_wine_white

for gamma in 0.01 0.5 1
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_wine_white
	echo "gamma:" $gamma >> SVM_wine_white
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/winequality-white_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1 \
	-K "weka.classifiers.functions.supportVector.RBFKernel -C 250007 -G $gamma" \
	>> SVM_wine_white
done
	
echo "-------------------------------MUSK SVM PolyKernel----------------------------------" >> SVM_musk

for exponent in 1 2 3
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_musk
	echo "exponent:" $exponent >> SVM_musk
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/clean2_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1 \
	-K "weka.classifiers.functions.supportVector.PolyKernel -C 250007 -E $exponent" \
	>> SVM_musk
done

echo "-------------------------------MUSK SVM RBFKernel----------------------------------" >> SVM_musk

for gamma in 0.01 0.5 1
do
	echo "------------------------------------------------------------------------------------------------" >> SVM_musk
	echo "gamma:" $gamma >> SVM_musk
	java -classpath weka.jar weka.classifiers.functions.SMO \
	-t ./dataset/clean2_training_70.arff \
	-C 1.0 \
	-L 0.001 \
	-P 1.0E-12 \
	-N 0 \
	-V -1 \
	-W 1 \
	-K "weka.classifiers.functions.supportVector.RBFKernel -C 250007 -G $gamma" \
	>> SVM_musk
done
