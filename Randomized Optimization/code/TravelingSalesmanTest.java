package opt.test;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Random;

import dist.DiscreteDependencyTree;
import dist.DiscretePermutationDistribution;
import dist.DiscreteUniformDistribution;
import dist.Distribution;

import opt.SwapNeighbor;
import opt.GenericHillClimbingProblem;
import opt.HillClimbingProblem;
import opt.NeighborFunction;
import opt.RandomizedHillClimbing;
import opt.SimulatedAnnealing;
import opt.example.*;
import opt.ga.CrossoverFunction;
import opt.ga.SwapMutation;
import opt.ga.Vertex;
import opt.ga.GenericGeneticAlgorithmProblem;
import opt.ga.GeneticAlgorithmProblem;
import opt.ga.MaxKColorFitnessFunction;
import opt.ga.MutationFunction;
import opt.ga.SingleCrossOver;
import opt.ga.StandardGeneticAlgorithm;
import opt.prob.GenericProbabilisticOptimizationProblem;
import opt.prob.MIMIC;
import opt.prob.ProbabilisticOptimizationProblem;
import shared.FixedIterationTrainer;

/**
 * 
 * @author Andrew Guillory gtg008g@mail.gatech.edu
 * @version 1.0
 */
public class TravelingSalesmanTest {
    /** The n value */
    private static final int N = 50;
    private static DecimalFormat def = new DecimalFormat("0.000");
    /**
     * The test main
     * @param args ignored
     */
    public static void tsTest(int input, int iterations) {
    	int N = input;
        Random random = new Random();
        // create the random points
        double[][] points = new double[N][2];
        for (int i = 0; i < points.length; i++) {
            points[i][0] = random.nextDouble();
            points[i][1] = random.nextDouble();   
        }
        // for rhc, sa, and ga we use a permutation based encoding
        TravelingSalesmanEvaluationFunction ef = new TravelingSalesmanRouteEvaluationFunction(points);
        Distribution odd = new DiscretePermutationDistribution(N);
        NeighborFunction nf = new SwapNeighbor();
        MutationFunction mf = new SwapMutation();
        CrossoverFunction cf = new TravelingSalesmanCrossOver(ef);
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);

        long starttime = System.currentTimeMillis();
        RandomizedHillClimbing rhc = new RandomizedHillClimbing(hcp);      
        FixedIterationTrainer fit = new FixedIterationTrainer(rhc, iterations);
 /*       fit.train();
        System.out.println("RHC: " + ef.value(rhc.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();          
        SimulatedAnnealing sa = new SimulatedAnnealing(1E12, .95, hcp);
        fit = new FixedIterationTrainer(sa, iterations);
        fit.train();
        System.out.println("SA: " + ef.value(sa.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();
        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, 150, 20, gap);
        fit = new FixedIterationTrainer(ga, iterations/100);
        fit.train();
        System.out.println("GA: " + ef.value(ga.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        */
        
        // for mimic we use a sort encoding
        ef = new TravelingSalesmanSortEvaluationFunction(points);
        int[] ranges = new int[N];
        Arrays.fill(ranges, N);
        odd = new  DiscreteUniformDistribution(ranges);
        Distribution df = new DiscreteDependencyTree(.1, ranges); 
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);
 
        starttime = System.currentTimeMillis();   
        MIMIC mimic = new MIMIC(200, 100, pop);
        fit = new FixedIterationTrainer(mimic, iterations/250);
        fit.train();
        System.out.println("MIMIC: " + ef.value(mimic.getOptimal()));  
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");   
    }

    private static void tsTest2(int input, int iterations) {
    	int N = input;
    	double[] rates = new double[]{0.95, 0.7, 0.5, 0.3, 0.1};
    	int[] crossover = new int[]{160, 120, 100, 80, 40, 20, 10};
    	int[] tokeep = new int[]{150, 125, 100, 75, 50, 30, 40, 20, 10};
        Random random = new Random();
        // create the random points
        double[][] points = new double[N][2];
        for (int i = 0; i < points.length; i++) {
            points[i][0] = random.nextDouble();
            points[i][1] = random.nextDouble();   
        }
        // for rhc, sa, and ga we use a permutation based encoding
        TravelingSalesmanEvaluationFunction ef = new TravelingSalesmanRouteEvaluationFunction(points);
        Distribution odd = new DiscretePermutationDistribution(N);
        NeighborFunction nf = new SwapNeighbor();
        MutationFunction mf = new SwapMutation();
        CrossoverFunction cf = new TravelingSalesmanCrossOver(ef);
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);
        
        for(int i=0;i<rates.length;i++){
            long starttime = System.currentTimeMillis();          
            SimulatedAnnealing sa = new SimulatedAnnealing(1E12, .95, hcp);
            FixedIterationTrainer fit = new FixedIterationTrainer(sa, iterations);
            fit.train();
            System.out.println("SA: " + ef.value(sa.getOptimal()));
            System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
            
            System.out.println("============================");
        }
        
        for(int i=0;i<crossover.length;i++){
	        long starttime = System.currentTimeMillis();   
	        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, crossover[i], 20, gap);
	        FixedIterationTrainer fit = new FixedIterationTrainer(ga, iterations/10);
	        fit.train();
	        System.out.println("GA(" + crossover[i] + " crossover):" + ef.value(ga.getOptimal()));
	        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
	        
	        System.out.println("============================");
        }
        // for mimic we use a sort encoding
        ef = new TravelingSalesmanSortEvaluationFunction(points);
        int[] ranges = new int[N];
        Arrays.fill(ranges, N);
        odd = new  DiscreteUniformDistribution(ranges);
        Distribution df = new DiscreteDependencyTree(.1, ranges); 
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);
        for(int i=0;i<tokeep.length;i++){       
        	long starttime = System.currentTimeMillis();        
	        MIMIC mimic = new MIMIC(200, tokeep[i], pop);
	        FixedIterationTrainer fit = new FixedIterationTrainer(mimic, iterations/250);
	        fit.train();
	        System.out.println("MIMIC(" + tokeep[i] + " samples to keep):" + ef.value(mimic.getOptimal()));  
	        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        }
    }
    
    public static void main(String[] args) {
    	int[] inputs = new int[]{30,40,50,60,80,100,200};
    	int[] iterations = new int[20];
    	for(int i=0;i<iterations.length;i++){
    		iterations[i]=100000*(i+1);
    	}
    	for(int i=0;i<inputs.length;i++){
    		System.out.println("----------" + inputs[i] + " inputs-----------");
    		for(int j=0;j<iterations.length;j++){
    			System.out.println("----------" + iterations[j] + " iterations-----------");
    			tsTest(inputs[i],iterations[j]);
    		}
    	}
    	tsTest2(80,1200000);
    }
}
