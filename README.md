# Machine Learning

Machine Learning Projects involving Basic topics like Supervised Learning, Random Optimization, Unsupervised Learning, and Markov Decision Process (MDP)s and Reinforcement Learning

## Introduction

1. This Project is originally from CS 4641/7641 in Georgia Tech
2. This Project involves topics like Supervised Learning, Randomized Optimization, Unsupervised Learning, and MDPs and Reinforcement Learning

## Dataset
1. [Wine Quality Dataset](http://archive.ics.uci.edu/ml/datasets/Wine+Quality)[1]
2. [MUSK2 Dataset](https://archive.ics.uci.edu/ml/datasets/Musk+(Version+2))[2]
3. [Mice Dataset](https://archive.ics.uci.edu/ml/datasets/Mice+Protein+Expression)[3]

## Supervised Learning
1. Use Wine Quality white and red dataset, Musk2 datset
2. Run Decision Tree, Neural Network, Boosting, KNN, and SVM to demonstrate how the bias and variance of dataset influence the result from different ML algorithm. Tune the parameters of ML algorithm to demonstrate how the complexity of model overfit or underfit the data
3. Learning curves of the ML algorithms are also explored

## Randomized Optimization
1. Use Musk2 Dataset and [Abagail.jar](https://github.com/pushkar/ABAGAIL)
2. Compare the results of three Optimization Algorithms, Randomized Hill Climbing, Simulated Annealing and Genetic Algorithm with Back Propagation in Neural Network.
3. Compare the results of four Optimization Algorithms, Randomized Hill Climbing, Simulated Annealing, Genetic Algorithm and MIMIC[4] in different Optimization Problems like Four Peaks, Travel Salesman and Max K coloring by tuning the parameters.

## Unsupervised Learning
1. Use Wine Quality white Dataset and Mice dataset
2. Study Clustering by observing the performance of K-means and Expectation Maximization
3. Study Dimensionality Reduction by observing the performance of Principle Component Analysis, Independent Componenet Analysis, Random Projection and Random Subset with K-means, Expectation Maximization, Neural Network and Naive Bayes.

## MDPs and Reinforcement Learning
1. Use [burlap.jar](http://burlap.cs.brown.edu/)
2. MDP problems GridWorld and BlockDude are used for analysis
3. Evaluate and analyze the perfomance of Value Iteration, Policy Iteration and Q-learning for each problem

## Contributing

1. Fork
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Source
[1] P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. Modeling wine preferences by data mining from physicochemical properties. In Decision Support Systems, Elsevier, 47(4):547-553, 2009.  
[2] Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.  
[3] Higuera C, Gardiner KJ, Cios KJ (2015) Self-Organizing Feature Maps Identify Proteins Critical to Learning in a Mouse Model of Down Syndrome. PLoS ONE 10(6): e0129126. [Web Link] journal.pone.0129126  
[4] De Bonet, Jeremy S., Charles L. Isbell, and Paul Viola. "MIMIC: Finding optima by estimating probability densities." Advances in neural information processing systems (1997): 424-430.
## Credits

*Enmao Diao*

## License
The MIT License (MIT)

Copyright (c) [2015] [Enmao Diao]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
