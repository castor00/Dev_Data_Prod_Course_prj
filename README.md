# Dev_Data_Prod_Course_prj
completed project submission
Documentation
Introduction

This application has been developed for the purposes of the Coursera Developing Data Products course project. 
The application makes an estimate on the completion day of a sample project that is built-in the application. 
The estimation uses the earned schedule method proposed by Lipke (2003). 

Input

The application uses data of a sample project. 
The user is asked to enter the project's actual day by using the slider and select the estimation method. 
The project's actual day is the Time Now and is counted in days from the project's start day. 
The estimation method depends on the Performance Factor (PF), 
which refers to the assumption made about the expected performance of the future work, as follows:

1. PF = 1. Future performance is expected to follow the baseline schedule.
2. PF = SPI(t). Future performance is expected to follow the current time performance.
3. PF = SCI(t). Future performance is expected to follow the current time and cost performance.

Output

The application calculates the basic performance indexes (SPI(t), CPI and SCI(t)) 
and the Estimated At Completion Time (EAC(t)) for the Actual Day entered and the estimation method (PF) selected.

SPI(t) is and index that shows the current schedule performance. 
SPI(t) > 1 means that the project is ahead of schedule, 
SPI(t) < 1 means that the project is behind schedule and 
SPI(t) = 1 means that the project is on schedule

CPI is and index that shows the current cost performance. 
CPI > 1 means that the project is under budget, 
CPI < 1 means that the project is over budget and 
CPI = 1 means that the project is on budget

CSI(t) is a composite index for schedule and cost performance. It is the product of SPI(t) and CPI.

EAC(t) Is the Estimation At Completion Time, i.e. the estimated duration of the project.

References

Lipke, Walt (2003). Schedule is Different. The Measurable News, March & Summer 2003
