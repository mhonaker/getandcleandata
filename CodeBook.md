# Creation of a Tidy Dataset from Smartphone Acquired Movement Data

## A Brief Introduction
A data set consisting of pre-processed linear acceleration and angular velocity measurements was
cleaned and trimmed. The original data for this project was collected and curated by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto
at the Smartlab - Non Linear Complex Systems Laboratory, in Genoa, Italy, and was obtained through the Coursera Getting and Cleaning Data
class. Please see references 1-2 for more information on the original data collections and analysis methods. Briefly, the accelerometer and gyroscope data
from smartphones worn by 30 volunteers were noise-filtered to obtain time domain signals, and Fourier Transformed to obtain frequency domain signals.
These signals were subsequently split into signals coming from body based motion, and from gravity, along with calculating the Jerk and magnitude (from the Euclidean norm)
parameters from the change of these vectors through time. The signals were classified by the activity that generated them, using video monitoring.
Several addition parameters were estimated from these collected data, including the means and standard deviations for many of the variables. 

## Creation of the Tidy Dataset
In order to create a tidy data set according to the project's goals, several steps were completed, using R, references 3-5.

> 1. The data archive was downloaded and unzipped.  
> 2. All of the data sets and ancillary files were loaded into R.  
> 3. Variable names were cleaned according to the rubrick of this class (no spaces or non-letter characters, all lowercase).  
> 4. Variable names were appended to both the training and test data sets, as were subject id numbers.  
> 5. A classification id was also appended, and converted from a number to an activity name.  
> 6. The training and test data sets were combined into one larger data set, on a subject id basis.  
> 7. Means and standard deviations of the vector angles were removed as being too derivative to contain useful information.  
> 8. The averages of each variable was taken, both on a per subject, and a per activity type basis.  
> 9. These averages were written to a new dataset, tidyData.txt.  

## Format and variable names for tidyData.txt  

The dataset has been saved as a plain text file, space separated, with a column header of variable names as the first row.
Observations are in rows, grouped by subject id.
Variables are in column with the names below. Please note that the observations listed are the averages of means and
standard deviations already calculated, as described above.

Variable names were used according to the standards established in the class lecture, and are listed below.
>+ The prefix indicates the domain of measurement
>>+ time for time domain
>>+ frequency for frequency domain

>+ The next term, body or gravity, indicates from whence the force originated
>>+ body from personal body motion
>>+ gravity from gravitational force

>+ This is followed by the type of force, acceleration or gyroscopic

>+ The next terms in the variable names indicate what calculations were performed
>>+ jerk , if listed, for the jerk force and magnitude, if listed, for the Euclidean norm

>+ The following terms indicate whether the measurement is a mean of standard deviation
>>+ mean is indicated by mean, and standard deviation indicated by stddeviation
>>+ please note that these are category and subject id based averages of the already calculated means or standard deviations of the variables

>+ The last letter of most variable names indicates the direction of motion, x, y, or z

>+ Variable names ending in meanfreq are weighted averages of all frequency components

>+ Variable names beginning with angle indicate calculated angles between the vectors

## A List of Variable Names
subjectid  
activity  
#### time domain, body origin acceleration means and standard deviations
timebodyaccelerationmeanx  
timebodyaccelerationmeany  
timebodyaccelerationmeanz  
timebodyaccelerationstddeviationx  
timebodyaccelerationstddeviationy  
timebodyaccelerationstddeviationz  
#### time domain, gravity origin acceleration means and standard deviations
timegravityityaccelerationmeanx  
timegravityityaccelerationmeany  
timegravityityaccelerationmeanz  
timegravityityaccelerationstddeviationx  
timegravityityaccelerationstddeviationy  
timegravityityaccelerationstddeviationz  
#### time domain, body origin Jerk signal means and standard deviations
timebodyaccelerationjerkmeanx  
timebodyaccelerationjerkmeany  
timebodyaccelerationjerkmeanz  
timebodyaccelerationjerkstddeviationx  
timebodyaccelerationjerkstddeviationy  
timebodyaccelerationjerkstddeviationz  
#### time domain, body origin gyroscope means and standard deviations
timebodygyromeanx  
timebodygyromeany  
timebodygyromeanz  
timebodygyrostddeviationx  
timebodygyrostddeviationy  
timebodygyrostddeviationz  
#### time domain, body origin gyroscope Jerks signal means and standard deviations
timebodygyrojerkmeanx  
timebodygyrojerkmeany  
timebodygyrojerkmeanz  
timebodygyrojerkstddeviationx  
timebodygyrojerkstddeviationy  
timebodygyrojerkstddeviationz  
#### time domain, body origin acceleration magnitude signal means and standard deviations
timebodyaccelerationmagnitudemean  
timebodyaccelerationmagnitudestddeviation  
timegravityityaccelerationmagnitudemean  
timegravityityaccelerationmagnitudestddeviation  
#### time domain, body origin acceleration Jerk signal magnitude means and standard deviations
timebodyaccelerationjerkmagnitudemean  
timebodyaccelerationjerkmagnitudestddeviation   
#### time domain, body origin gyroscope magnitude and Jerk magnitude signal means and standard deviations
timebodygyromagnitudemean  
timebodygyromagnitudestddeviation  
timebodygyrojerkmagnitudemean  
timebodygyrojerkmagnitudestddeviation  
#### frequency domain, body origin acceleration means and standard deviations
freqencybodyaccelerationmeanx  
freqencybodyaccelerationmeany  
freqencybodyaccelerationmeanz  
freqencybodyaccelerationstddeviationx  
freqencybodyaccelerationstddeviationy  
freqencybodyaccelerationstddeviationz  
#### frequency domain, body origin acceleration means and standard deviations
freqencybodyaccelerationmeanfreqx  
freqencybodyaccelerationmeanfreqy  
freqencybodyaccelerationmeanfreqz  
freqencybodyaccelerationjerkmeanx  
freqencybodyaccelerationjerkmeany  
freqencybodyaccelerationjerkmeanz  
#### frequency domain, body origin acceleration Jerk means and standard deviations
freqencybodyaccelerationjerkstddeviationx  
freqencybodyaccelerationjerkstddeviationy  
freqencybodyaccelerationjerkstddeviationz  
freqencybodyaccelerationjerkmeanfreqx  
freqencybodyaccelerationjerkmeanfreqy  
freqencybodyaccelerationjerkmeanfreqz  
#### frequency domain, body origin gyroscope means and standard deviations
freqencybodygyromeanx  
freqencybodygyromeany  
freqencybodygyromeanz  
freqencybodygyrostddeviationx  
freqencybodygyrostddeviationy  
freqencybodygyrostddeviationz  
freqencybodygyromeanfreqx  
freqencybodygyromeanfreqy  
freqencybodygyromeanfreqz  
#### frequency domain, body origin acceleration magnitude and Jerk signal means and standard deviations
freqencybodyaccelerationmagnitudemean  
freqencybodyaccelerationmagnitudestddeviation  
freqencybodyaccelerationmagnitudemeanfreq  
freqencybodyaccelerationjerkmagnitudemean  
freqencybodyaccelerationjerkmagnitudestddeviation  
freqencybodyaccelerationjerkmagnitudemeanfreq  
#### frequency domain, body origin gyroscope magnitude and Jerk signal means and standard deviations
freqencybodygyromagnitudemean  
freqencybodygyromagnitudestddeviation  
freqencybodygyromagnitudemeanfreq  
freqencybodygyrojerkmagnitudemean  
freqencybodygyrojerkmagnitudestddeviation  
freqencybodygyrojerkmagnitudemeanfreq   
#### means and standard deviations of calculated angles between vectors
angletimebodyaccelerationmeangravity   
angletimebodyaccelerationjerkmeangravitymean   
angletimebodygyromeangravitymean   
angletimebodygyrojerkmeangravitymean   
anglexgravitymean   
angleygravitymean   
anglezgravitymean

## References
1. [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
3. R Core Team (2013). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. [http://www.R-project.org/](http://www.R-project.org/)
4. Hadley Wickham (2011). The Split-Apply-Combine Strategy for Data Analysis. Journal of Statistical Software, 40(1), 1-29. [http://www.jstatsoft.org/v40/i01/](http://www.jstatsoft.org/v40/i01/)
5. Hadley Wickham (2007). Reshaping Data with the reshape Package. Journal of Statistical Software, 21(12), 1-20. [http://www.jstatsoft.org/v21/i12/](http://www.jstatsoft.org/v21/i12/)