package opt.test;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Random;

import opt.ga.MaxKColorFitnessFunction;
import opt.ga.Vertex;

import dist.DiscreteDependencyTree;
import dist.DiscretePermutationDistribution;
import dist.DiscreteUniformDistribution;
import dist.Distribution;
import opt.DiscreteChangeOneNeighbor;
import opt.EvaluationFunction;
import opt.SwapNeighbor;
import opt.example.FourPeaksEvaluationFunction;
import opt.GenericHillClimbingProblem;
import opt.HillClimbingProblem;
import opt.NeighborFunction;
import opt.RandomizedHillClimbing;
import opt.SimulatedAnnealing;
import opt.ga.CrossoverFunction;
import opt.ga.DiscreteChangeOneMutation;
import opt.ga.SingleCrossOver;
import opt.ga.SwapMutation;
import opt.ga.GenericGeneticAlgorithmProblem;
import opt.ga.GeneticAlgorithmProblem;
import opt.ga.MutationFunction;
import opt.ga.StandardGeneticAlgorithm;
import opt.ga.UniformCrossOver;
import opt.prob.GenericProbabilisticOptimizationProblem;
import opt.prob.MIMIC;
import opt.prob.ProbabilisticOptimizationProblem;
import shared.FixedIterationTrainer;

/**
 * 
 * @author kmandal
 * @version 1.0
 */
public class MaxKColoringTest {
    /** The n value */
    private static final int N = 50; // number of vertices
    private static final int L =4; // L adjacent nodes per vertex
    private static final int K = 8; // K possible colors
    private static DecimalFormat def = new DecimalFormat("0.000");
    /**
     * The test main
     * @param args ignored
     */
    public static void mkTest(int input, int iterations) {
    	int N = input;
        Random random = new Random(N*L);
        // create the random velocity
        Vertex[] vertices = new Vertex[N];
        for (int i = 0; i < N; i++) {
            Vertex vertex = new Vertex();
            vertices[i] = vertex;	
            vertex.setAdjMatrixSize(L);
            for(int j = 0; j <L; j++ ){
            	 vertex.getAadjacencyColorMatrix().add(random.nextInt(N*L));
            }
        }
        /*for (int i = 0; i < N; i++) {
            Vertex vertex = vertices[i];
            System.out.println(Arrays.toString(vertex.getAadjacencyColorMatrix().toArray()));
        }*/
        // for rhc, sa, and ga we use a permutation based encoding
        MaxKColorFitnessFunction ef = new MaxKColorFitnessFunction(vertices);
        Distribution odd = new DiscretePermutationDistribution(K);
        NeighborFunction nf = new SwapNeighbor();
        MutationFunction mf = new SwapMutation();
        CrossoverFunction cf = new SingleCrossOver();
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);
        
        Distribution df = new DiscreteDependencyTree(.1); 
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);
        
        long starttime = System.currentTimeMillis();
        RandomizedHillClimbing rhc = new RandomizedHillClimbing(hcp);      
        FixedIterationTrainer fit = new FixedIterationTrainer(rhc, iterations);
        fit.train();
        System.out.println("RHC: " + ef.value(rhc.getOptimal()));
        System.out.println(ef.foundConflict());
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();
        SimulatedAnnealing sa = new SimulatedAnnealing(1E12, .1, hcp);
        fit = new FixedIterationTrainer(sa, iterations);
        fit.train();
        System.out.println("SA: " + ef.value(sa.getOptimal()));
        System.out.println(ef.foundConflict());
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();
        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, 10, 60, gap);
        fit = new FixedIterationTrainer(ga, iterations/100);
        fit.train();
        System.out.println("GA: " + ef.value(ga.getOptimal()));
        System.out.println(ef.foundConflict());
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
        
        System.out.println("============================");
        
        starttime = System.currentTimeMillis();
        MIMIC mimic = new MIMIC(200, 100, pop);
        fit = new FixedIterationTrainer(mimic, iterations/250);
        fit.train();
        System.out.println("MIMIC: " + ef.value(mimic.getOptimal()));  
        System.out.println(ef.foundConflict());
        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
    }

    private static void mkTest2(int input, int iterations) {
    	int N = input;
    	double[] rates = new double[]{0.95, 0.7, 0.5, 0.3, 0.1};
    	int[] crossover = new int[]{160, 120, 100, 80, 40, 20, 10};
    	int[] tokeep = new int[]{150, 125, 100, 75, 50, 30, 40, 20, 10};
        Random random = new Random(N*L);
        // create the random velocity
        Vertex[] vertices = new Vertex[N];
        for (int i = 0; i < N; i++) {
            Vertex vertex = new Vertex();
            vertices[i] = vertex;	
            vertex.setAdjMatrixSize(L);
            for(int j = 0; j <L; j++ ){
            	 vertex.getAadjacencyColorMatrix().add(random.nextInt(N*L));
            }
        }
        /*for (int i = 0; i < N; i++) {
            Vertex vertex = vertices[i];
            System.out.println(Arrays.toString(vertex.getAadjacencyColorMatrix().toArray()));
        }*/
        // for rhc, sa, and ga we use a permutation based encoding
        MaxKColorFitnessFunction ef = new MaxKColorFitnessFunction(vertices);
        Distribution odd = new DiscretePermutationDistribution(K);
        NeighborFunction nf = new SwapNeighbor();
        MutationFunction mf = new SwapMutation();
        CrossoverFunction cf = new SingleCrossOver();
        HillClimbingProblem hcp = new GenericHillClimbingProblem(ef, odd, nf);
        GeneticAlgorithmProblem gap = new GenericGeneticAlgorithmProblem(ef, odd, mf, cf);
        
        Distribution df = new DiscreteDependencyTree(.1); 
        ProbabilisticOptimizationProblem pop = new GenericProbabilisticOptimizationProblem(ef, odd, df);
        
        for(int i=0;i<rates.length;i++){
            long starttime = System.currentTimeMillis();
	        SimulatedAnnealing sa = new SimulatedAnnealing(1E12, rates[i], hcp);
	        FixedIterationTrainer fit = new FixedIterationTrainer(sa, iterations);
	        fit.train();
	        System.out.println("SA(" + rates[i] + " cooling rate): " + ef.value(sa.getOptimal()));
	        System.out.println("Time : "+ def.format((System.currentTimeMillis() - starttime)/Math.pow(10,3)) + " seconds");
	        
	        System.out.println("============================");
        }
        
        for(int i=0;i<crossover.length;i++){
	        long starttime = System.currentTimeMillis();   
	        StandardGeneticAlgorithm ga = new StandardGeneticAlgorithm(200, crossover[i], 60, gap);
	        FixedIterationTrainer fit = new FixedIterationTrainer(ga, iterations/10);
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
    			mkTest(inputs[i],iterations[j]);
    		}
    	}
    	mkTest2(80,1200000);
    }
}
