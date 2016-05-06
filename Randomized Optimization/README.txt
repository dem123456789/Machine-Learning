To run the code
1. Start a project in Eclipse with Java 1.7
2. link the abagail-lib.jar to the compile path (You have to use this version since I modify the code)
3. Download the ABAGAIL library from Github and replace FourPeaksTest.java and other test two test files with my version of them
4. Copy the .txt files from Supporting Files to /src and then run NNTest (the first part)
5. Run the three test java file (the second part)
6. Be sure to have two projects set up for two parts. Sorry for the inconvenience, I directly modify the ABAGAIL code when I was doing the secon part

FILE DESCRIPTION
code/
	*.sh/
		abagail-lib.jar 		   %The jar file used in part 1
		DataParser.java            %To read the data used in NNTest.java
		NNTest.java 			   %Conduct the first part of project
		FourPeakTest.java          %Four Peak problem
		TravelingSalesmanTest.java %Traveling Salesman problem
		MaxKColoringTest.java      % Max K Coloring problem

Supproting Files/
	dataset/
		clean2_test_70.txt					%musk split into 70% training
		clean2_training_70.txt				%musk split into 30% test
		musk_trainin_70_x-traininig.txt     %split training set int x% subset for the first part of project
	output/ 								%All the raw output copied from console, just for reference.
	Analysis.xlsx							%Statistical result manually taken and labeled from the raw output
					
ediao3-analysis.pdf							%My report
	
		
		
		
		
		
		
		
		
		