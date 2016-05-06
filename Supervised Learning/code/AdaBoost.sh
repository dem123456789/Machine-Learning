echo "-------------------------------Wine Quality Red AdaBoost----------------------------------" >> AdaBoost_wine_red
for iter in 10 20 40
do
	for confidence in 0.125 0.25 0.5
	do
		echo "------------------------------------------------------------------------------------------------" >> AdaBoost_wine_red
		echo "confidence:" $confidence ", iter: " $iter >> AdaBoost_wine_red
		java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
		-t ./dataset/winequality-red_training_70.arff \
		-P 100 \
		-S 1 \
		-I $iter \
		-W weka.classifiers.trees.J48 \
		-- -C $confidence \
		-M 2 \
		>> AdaBoost_wine_red
	done
	echo "------------------------------------------------------------------------------------------------" >> AdaBoost_wine_red
	echo "confidence: unpruned, iter: " $iter >> AdaBoost_wine_red
	java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
	-t ./dataset/winequality-red_training_70.arff \
	-P 100 \
	-S 1 \
	-I $iter \
	-W weka.classifiers.trees.J48 \
	-- -U \
	-M 2 \
	>> AdaBoost_wine_red
done

echo "-------------------------------Wine Quality White AdaBoost----------------------------------" >> AdaBoost_wine_white
for iter in 10 20 40
do
	for confidence in 0.125 0.25 0.5
	do
		echo "------------------------------------------------------------------------------------------------" >> AdaBoost_wine_white
		echo "confidence:" $confidence ", iter: " $iter >> AdaBoost_wine_white
		java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
		-t ./dataset/winequality-white_training_70.arff \
		-P 100 \
		-S 1 \
		-I $iter \
		-W weka.classifiers.trees.J48 \
		-- -C $confidence \
		-M 2 \
		>> AdaBoost_wine_white
	done
	echo "------------------------------------------------------------------------------------------------" >> AdaBoost_wine_white
	echo "confidence: unpruned, iter: " $iter >> AdaBoost_wine_white
	java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
	-t ./dataset/winequality-white_training_70.arff \
	-P 100 \
	-S 1 \
	-I $iter \
	-W weka.classifiers.trees.J48 \
	-- -U \
	-M 2 \
	>> AdaBoost_wine_white
done

echo "-------------------------------MUSK AdaBoost----------------------------------" >> AdaBoost_musk
for iter in 10 20 40
do
	for confidence in 0.125 0.25 0.5
	do
		echo "------------------------------------------------------------------------------------------------" >> AdaBoost_musk
		echo "confidence:" $confidence ", iter: " $iter >> AdaBoost_musk
		java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
		-t ./dataset/clean2_training_70.arff \
		-P 100 \
		-S 1 \
		-I $iter \
		-W weka.classifiers.trees.J48 \
		-- -C $confidence \
		-M 2 \
		>> AdaBoost_musk
	done
	echo "------------------------------------------------------------------------------------------------" >> AdaBoost_musk
	echo "confidence: unpruned, iter: " $iter >> AdaBoost_musk
	java -classpath weka.jar weka.classifiers.meta.AdaBoostM1 \
	-t ./dataset/clean2_training_70.arff \
	-P 100 \
	-S 1 \
	-I $iter \
	-W weka.classifiers.trees.J48 \
	-- -U \
	-M 2 \
	>> AdaBoost_musk
done
