echo "-------------------------------Wine Quality Red Decision Tree----------------------------------" >> Decision_Tree_wine_red

for confidence in 0.125 0.25 0.5
do
	echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_wine_red
	echo "confidence:" $confidence >> Decision_Tree_wine_red
	java -classpath weka.jar weka.classifiers.trees.J48 \
	-t ./dataset/winequality-red_training_70.arff \
	-C $confidence \
	-M 2 \
	>> Decision_Tree_wine_red
done
echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_wine_red
echo "confidence: unpruned" >> Decision_Tree_wine_red
java -classpath weka.jar weka.classifiers.trees.J48 \
-t ./dataset/winequality-red_training_70.arff \
-U \
-M 2 \
>> Decision_Tree_wine_red

echo "-------------------------------Wine Quality White Decision Tree----------------------------------" >> Decision_Tree_wine_white

for confidence in 0.125 0.25 0.5
do
	echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_wine_white
	echo "confidence:" $confidence >> Decision_Tree_wine_white
	java -classpath weka.jar weka.classifiers.trees.J48 \
	-t ./dataset/winequality-white_training_70.arff \
	-C $confidence \
	-M 2 \
	>> Decision_Tree_wine_white
done
echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_wine_white
echo "confidence: unpruned, iter: " $iter >> Decision_Tree_wine_white
java -classpath weka.jar weka.classifiers.trees.J48 \
-t ./dataset/winequality-white_training_70.arff \
-U \
-M 2 \
>> Decision_Tree_wine_white
	
echo "-------------------------------MUSK Decision Tree----------------------------------" >> Decision_Tree_musk

for confidence in 0.125 0.25 0.5
do
	echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_musk
	echo "confidence:" $confidence >> Decision_Tree_musk
	java -classpath weka.jar weka.classifiers.trees.J48 \
	-t ./dataset/clean2_training_70.arff \
	-C $confidence \
	-M 2 \
	>> Decision_Tree_musk
done
echo "------------------------------------------------------------------------------------------------" >> Decision_Tree_musk
echo "confidence: unpruned" >> Decision_Tree_musk
java -classpath weka.jar weka.classifiers.trees.J48 \
-t ./dataset/clean2_training_70.arff \
-U \
-M 2 \
>> Decision_Tree_musk