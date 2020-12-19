# Machine Learning - Practical: Clustering applied to a toy example (moving-curve)
All description of this practical, you can find it [here](https://github.com/stalyn21/toyCurvesWithCluster/blob/main/PracticalsML_Moving_curve_toy_example.pdf).

## Abstract
In this clustering applied to a toy example project, we analyze the formation of clusters on a moving curve setting. The aim of this work is to understand how the clustering process changes and is affected by the different levels of noise. For this, we use K-means clustering technique and we run our algorithms with different values of noise and for a different number of clusters. We show that cluster formation is influenced by the level of noise and the number of clusters.

![2D moving-vurve](https://github.com/stalyn21/toyCurvesWithCluster/blob/main/images/wiithoutNormalize/clustering.png)

## Technical Resources
To start, we work with GNU/Linux and Windows in ours operating systems, using specifically Arch Linux and Windows 10. Both with the x86_64 architecture. In Arch Linux, we install Octave 5.2.0 and Matlab 2020 A on Windows. To get the similar result in both operating system, we use a seed for generate the same random numbers, [see.m](https://github.com/stalyn21/toyCurvesWithCluster/blob/main/seed.m). On the other hand, the result of the experiments are based on the practices questionnaire. So, we implement the code without the cluster, then, with the cluster (K-means) and its centers. Finally, we assess the robustness of the clustering with Fisher’s Criterion.

## Result

## Final Remark

In this practice, we obtained some important results.

• In exerceise 1, we created a script which generates an artificial movingcurve with an adjustable number of frames aswell as number of samples.

<p align="center"> <img src="https://github.com/stalyn21/toyCurvesWithCluster/blob/main/images/wiithoutNormalize/experiment_1/experiment1_5_0.jpg" width="300"/> <img src="https://github.com/stalyn21/toyCurvesWithCluster/blob/main/images/wiithoutNormalize/experiment_1/experiment1_5_01.jpg" width="300"/> <img src="https://github.com/stalyn21/toyCurvesWithCluster/blob/main/images/wiithoutNormalize/experiment_1/experiment1_5_05.jpg" width="300"/> 2D moving-curves without kmeans and noise</p> 

• In experiment 2, we have noticed that the clusters are more differentiable when the noise is small. Conversely, the clusters formed when the noise is bigger, are over- lapped and hence less differentiable.

• In experiment 3, we realize that clusters formed with a lower level of noise than others, obtain a low value of J. Also, we notice that despite of the noise change, the clusters remain similar.
