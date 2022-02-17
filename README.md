# Gaze-Data-from-Web-Searching-Tasks
Contains gaze data from participants with and without autism completing web searching tasks (see Update at the bottom of the page fo rnew data)

For using this data please cite: Yaneva, V., Ha, L.A., Eraslan, S., Yesilada, Y., and Mitkov, R. 2018. Detecting Autism Based on Eye-Tracking Data from Web Searching Tasks. Proceedings of the 18th Web for All Conference on The Internet of Accessible Things, W4A 2018, Lyon, France, 23-25 April, 2018.

@inproceedings{yaneva2018detecting,
  title={Detecting autism based on eye-tracking data from web searching tasks},
  author={Yaneva, Victoria and Ha, Le An and Eraslan, Sukru and Yesilada, Yeliz and Mitkov, Ruslan},
  booktitle={Proceedings of the 15th International Web for All Conference},
  pages={1--10},
  year={2018}

I. The file "Webtask_github" contains the code used in our experiments.

II. The folder "Gaze Data" contains the following information: 

  1) "Gaze data for both groups for the Search task with Generic AOIs" 
  2) "Gaze data for both groups for the Browse task with Generic AOIs"
  3) "Gaze data for both groups for the Search task with Page-specific AOIs"
  4) "Gaze data for both groups for the Browse task with Page Specific AOIs"
  5) **Update**: "Web_browse_all" - preprocessed data for the Browse task that can be used directly in the provided R code
  6) **Update**: "Web_search_all" - preprocessed data for the Search task that can be used directly in the provided R code
  
Note: The files containing the gaze data for the Page-specific AOIs have an additional column entitles Class. It contains the labels for the participant group (ASD or Control). In the Generic AOIs files this column is missing. Instead, the group labels are given in the User Name columns together with the participant initials as ASD or Control.

III. The file "Success scores plus initials 15 participants" contains the answers of each participant to the web search task. The first tab corresponds to the Control group and the second tab corresponds to the ASD group. Each correct answer is given a score of 1 and each incorrect answer - the score of 0. Since there are two questions per web page, the maximum score per participant per page is 2.

IV. The file "All Permutations" contains the accuracy results and 95% CI for all combinations of web pages for the Browse and Search tasks.

V. The folder "Web Pages" contains screenshots of the 6 web pages used in the study.

VI. The folder "Questionnaires and Consent Form" contains the consent form that each participant signed and two questionnaires. One of these questionnaires assesses the overall experience the participants have with using the web and the other one assesses their familiarity with the particular websites that the web pages are from.

VII. The file Appendix contains the appendix to the main article


**UPDATE:**

New files added for a follow up study. The folder "Gaze Data Study 2" contains gaze data from another browse task (time limited to 30 seconds) and a synthesis task. Some of the participants overlap with those in Study 1. More details about this study and the data can be found in:

Yaneva, V., Eraslan, S., Yesilada, Y. and Mitkov, R., 2020. Detecting high-functioning autism in adults using eye tracking and machine learning. IEEE Transactions on Neural Systems and Rehabilitation Engineering, 28(6), pp.1254-1261.

@article{yaneva2020detecting,
  title={Detecting high-functioning autism in adults using eye tracking and machine learning},
  author={Yaneva, Victoria and Eraslan, Sukru and Yesilada, Yeliz and Mitkov, Ruslan and others},
  journal={IEEE Transactions on Neural Systems and Rehabilitation Engineering},
  volume={28},
  number={6},
  pages={1254--1261},
  year={2020},
  publisher={IEEE}
}




