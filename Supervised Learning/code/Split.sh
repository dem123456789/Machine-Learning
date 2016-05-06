echo "-------------------------------Wine Quality Red Split----------------------------------"
echo "-------------------------------Training----------------------------------"
for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/winequality-red_training_70.arff \
	-o winequality-red_training_70_$percentage-training.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-c last
done
echo "-------------------------------Test----------------------------------"
for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/winequality-red_training_70.arff \
	-o winequality-red_training_70_$percentage-test.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-V \
	-c last
done

echo "-------------------------------Wine Quality White Split----------------------------------"
echo "-------------------------------Training----------------------------------"

for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/winequality-white_training_70.arff \
	-o winequality-white_training_70_$percentage-training.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-c last
done
echo "-------------------------------Test----------------------------------"

for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/winequality-white_training_70.arff \
	-o winequality-white_training_70_$percentage-test.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-V \
	-c last
done

echo "-------------------------------Wine Quality White Split----------------------------------"
echo "-------------------------------Training----------------------------------"

for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/clean2_training_70.arff \
	-o musk_training_70_$percentage-training.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-c last
done

echo "-------------------------------Test----------------------------------"

for percentage in 20 30 40 50 60 70 80
do
	java -classpath weka.jar weka.filters.supervised.instance.Resample \
	-i ./dataset/clean2_training_70.arff \
	-o musk_training_70_$percentage-test.arff \
	-B 0.0 \
	-S 1 \
	-Z $percentage \
	-no-replacement \
	-V \
	-c last
done
