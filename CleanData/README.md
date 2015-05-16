This is part of the Getting and Cleaning Data course on Coursera, where the goal was to create a tidy version of the “Human Activity Recognition Using Smartphones” data provided by Anguita, Ghio, Oneto, Parra and Reyes-Ortiz (2013).

The R script will take Anguita’s et al.’s data and transform it into a tidy data set, as advocated by Hadley Wickham (2014).

**To use this script:**
1. Download Reyes-Ortiz’s et al.’s data from [here]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file into your R working directory.
3. Run the R script.

**NOTE: THE SCRIPT REQUIRES THE “reshape2” LIBRARY. IF IT IS NOT CURRENTLY INSTALLED IN R, THE SCRIPT WILL INSTALL IT FOR YOU.**

The output of the script is a tidy data set named “UCI HAR-Tidy.txt”.

##References
* Anguita, D., Ghio, A., Oneto, L., Parra, X., & Reyes-Ortiz, J. L. (2013). Human activity recognition on smartphones using a multiclass hardware-friendly support vector machine. In Ambient assisted living and home care (pp. 216-223). Springer Berlin Heidelberg.
* Wickham, H. (2014). Tidy data. Under review.
