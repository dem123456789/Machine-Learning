package opt.test;

import java.text.DecimalFormat;
import java.util.Arrays;

import dist.DiscreteDependencyTree;
import dist.DiscreteUniformDistribution;
import dist.Distribution;

import opt.DiscreteChangeOneNeighbor;
import opt.EvaluationFunction;
import opt.GenericHillClimbingProblem;
import opt.HillClimbingProblem;
import opt.NeighborFunction;
import opt.RandomizedHillClimbing;
import opt.SimulatedAnnealing;
import opt.example.*;
import opt.ga.CrossoverFunction;
import opt.ga.DiscreteChangeOneMutation;
import opt.ga.SingleCrossOver;
import opt.ga.GenericGeneticAlgorithmProblem;
import opt.ga.GeneticAlgorithmProblem;
import opt.ga.MutationFunction;
import opt.ga.StandardGeneticAlgorithm;
import opt.prob.GenericProbabilisticOptimizationProblem;
import opt.prob.MIMIC;
import opt.prob.ProbabilisticOptimizationProblem;
import shared.FixedIterationTrainer;

/**
 * Copied from ContinuousPeaksTest
 * @version 1.0
 */
public class FourPeaksTest {
    /** The n value */
    private static final int N = 200;
    /** The t value */
    private static final int T = N / 5;
    private static DecimalFormat def = new DecimalFormat("0.000");
    
    private static void fpTest(int input, int iterations) {
    	int N = input;
    	int T = input/5;
        int[] ranges = new int[N];
        Arrays.fill(ranges, 2);
        EvaluationFunction ef = new FourPeaksEvaluationFunction(T);
        Distribution odd = new DiscreteUniformDistribution(ranges);
        NeighborFunction nf = new DiscreteChangeOneNeighbor(ranges);
        MutationFunction mf = new DiscreteChangeOneMutation(ranges);
        CrossoverFunction cf = new SingleCrossOver();
        Distribution df = new DiscreteDependencyTree(.1, ranges); 
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);

        long starttime = System.currentTimeMillis();
        RandomizedHillClimbing rhc = new RandomizedHillClimbing(hcp);      
        FixedIterationTrainer fit = new FixedIterationTrainer(rhc, iterations);
        fit.train();
        System.out.println("RHC: " + ef.value(rhc.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();        
        SimulatedAnnealing sa = new SimulatedAnnealing(1E11, .95, hcp);
        fit = new FixedIterationTrainer(sa, iterations);
        fit.train();
        System.out.println("SA: " + ef.value(sa.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");

        starttime = System.currentTimeMillis();   
        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, 100, 10, gap);
        fit = new FixedIterationTrainer(ga, iterations/10);
        fit.train();
        System.out.println("GA: " + ef.value(ga.getOptimal()));
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();        
        MIMIC mimic = new MIMIC(200, 20, pop);
        fit = new FixedIterationTrainer(mimic, iterations/250);
        fit.train();
        System.out.println("MIMIC: " + ef.value(mimic.getOptimal()));  
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
    }
    
    private static void fpTest2(int input, int iterations) {
    	int N = input;
    	int T = input/5;
    	double[] rates = new double[]{0.95, 0.7, 0.5, 0.3, 0.1};
    	int[] crossover = new int[]{160, 120, 100, 80, 40, 20, 10};
    	int[] tokeep = new int[]{150, 125, 100, 75, 50, 40, 30, 20, 10};
        int[] ranges = new int[N];
        Arrays.fill(ranges, 2);
        EvaluationFunction ef = new FourPeaksEvaluationFunction(T);
        Distribution odd = new DiscreteUniformDistribution(ranges);
        NeighborFunction nf = new DiscreteChangeOneNeighbor(ranges);
        MutationFunction mf = new DiscreteChangeOneMutation(ranges);
        CrossoverFunction cf = new SingleCrossOver();
        Distribution df = new DiscreteDependencyTree(.1, ranges); 
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);
        
        for(int i=0;i<rates.length;i++){
            long starttime = System.currentTimeMillis();
	        SimulatedAnnealing sa = new SimulatedAnnealing(1E11, rates[i], hcp);
	        FixedIterationTrainer fit = new FixedIterationTrainer(sa, iterations);
	        fit.train();
	        System.out.println("SA(" + rates[i] + " cooling rate): " + ef.value(sa.getOptimal()));
	        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
	        
	        System.out.println("============================");
        }
        
        for(int i=0;i<crossover.length;i++){
	        long starttime = System.currentTimeMillis();   
	        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, crossover[i], 10, gap);
	        FixedIterationTrainer fit = new FixedIterationTrainer(ga, iterations/100);
	        fit.train();
	        System.out.println("GA(" + crossover[i] + " crossover):" + ef.value(ga.getOptimal()));
	        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
	        
	        System.out.println("============================");
        }
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
    			fpTest(inputs[i],iterations[j]);
    		}
    	}
    	fpTest2(80,1200000);
    }
}
