echo "-------------------------------Wine Quality Red Neural Network----------------------------------" >> Neural_Network_wine_red

for learningrate in 0.3 0.5
do
	for momentum in 0.2 0.4
	do
		for epoch in 100 500 1000 2000
		do
			echo "------------------------------------------------------------------------------------------------" >> Neural_Network_wine_red
			echo "learningrate:" $learningrate ", momentum:" $momentum ", epoch:" $epoch>> Neural_Network_wine_red
			java -classpath weka.jar weka.classifiers.functions.MultilayerPerceptron \
			-t ./dataset/winequality-red_training_70.arff \
			-x 3\
			-L $learningrate \
			-M $momentum \
			-N $epoch \
			-V 0 \
			-S 0 \
			-E 20 \
			-H a \
			>> Neural_Network_wine_red
		done
	done
done

echo "-------------------------------Wine Quality White Neural Network----------------------------------" >> Neural_Network_wine_white

for learningrate in 0.3 0.5
do
	for momentum in 0.2 0.4
	do
		for epoch in 100 500 1000 2000
		do
			echo "------------------------------------------------------------------------------------------------" >> Neural_Network_wine_white
			echo "learningrate:" $learningrate ", momentum:" $momentum ", epoch:" $epoch>> Neural_Network_wine_white
			java -classpath weka.jar weka.classifiers.functions.MultilayerPerceptron \
			-t ./dataset/winequality-white_training_70.arff \
			-x 3\
			-L $learningrate \
			-M $momentum \
			-N $epoch \
			-V 0 \
			-S 0 \
			-E 20 \
			-H a \
			>> Neural_Network_wine_white
		done
	done
done
	
echo "-------------------------------MUSK Neural Network----------------------------------" >> Neural_Network_musk

for learningrate in 0.3 0.5
do
	for momentum in 0.2 0.4
	do
		for epoch in 100 500 1000 2000
		do
			echo "------------------------------------------------------------------------------------------------" >> Neural_Network_musk
			echo "learningrate:" $learningrate ", momentum:" $momentum ", epoch:" $epoch>> Neural_Network_musk
			java -classpath weka.jar weka.classifiers.functions.MultilayerPerceptron \
			-t ./dataset/clean2_training_70.arff \
			-x 3\
			-L $learningrate \
			-M $momentum \
			-N $epoch \
			-V 0 \
			-S 0 \
			-E 20 \
			-H a \
			>> Neural_Network_musk
		done
	done
done
