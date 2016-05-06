echo "-------------------------------Wine Quality Red KNN----------------------------------" >> KNN_wine_red

for neighbor in 1 2 3 4 5
do
	echo "------------------------------------------------------------------------------------------------" >> KNN_wine_red
	echo "neighbor:" $neighbor >> KNN_wine_red
	java -classpath weka.jar weka.classifiers.lazy.IBk \
	-t ./dataset/winequality-red_training_70.arff \
	-K $neighbor \
	-W 0 \
    -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" \
	>> KNN_wine_red
done

echo "-------------------------------Wine Quality White KNN----------------------------------" >> KNN_wine_white

for neighbor in 1 2 3 4 5
do
	echo "------------------------------------------------------------------------------------------------" >> KNN_wine_white
	echo "neighbor:" $neighbor >> KNN_wine_white
	java -classpath weka.jar weka.classifiers.lazy.IBk \
	-t ./dataset/winequality-white_training_70.arff \
	-K $neighbor \
	-W 0 \
	-A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" \
	>> KNN_wine_white
done
	
echo "-------------------------------MUSK KNN----------------------------------" >> KNN_musk

for neighbor in 1 2 3 4 5
do
	echo "------------------------------------------------------------------------------------------------" >> KNN_musk
	echo "neighbor:" $neighbor >> KNN_musk
	java -classpath weka.jar weka.classifiers.lazy.IBk \
	-t ./dataset/clean2_training_70.arff \
	-K $neighbor \
	-W 0 \
	-A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" \
	>> KNN_musk
done
