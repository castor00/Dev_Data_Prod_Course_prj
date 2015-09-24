library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        titlePanel("Project Duration Estimation"),
        
        sidebarLayout(
                sidebarPanel(sliderInput("AD", label = h3("Enter Actual Day"),
                                                          min = 1, max = 13, value = 5),
                             radioButtons("method", label = h3("Select Estimation Method"),
                                          choices = list("PF = 1" = 1, "PF = SPI" = 2,
                                                         "PF = SCI" = 3),selected = 1)),
                mainPanel(
                  h4("Project's Schedule Performance Index (SPI(t)) is"),
                  textOutput("SPI"),
                  h4("Project's Cost Performance Index (CPI)) is"),
                  textOutput("CPI"),
                  h4("Project's Schedule Cost Index (SCI(t)) is"),
                  textOutput("SCI"),
                  h4("Project's Estimated at Completion Time (EAC(t)) is"),
                  textOutput("EAC"),
                  br(),
                  br(),
                  br(),
                  h3("Documentation"),
                  h4("Introduction"),
                  p("This application has been developed for the purposes of the 
                    Coursera Developing Data Products course project. 
                    The application makes an estimate on the completion day 
                    of a sample project that is built-in the application. 
                    The estimation uses the earned schedule method proposed by Lipke (2003). 
                    More information on earned schedule can be found", 
                        a("here.",
                          href = "http://www.earnedschedule.com")),
                  p("The code for the application can be found",
                    a("here.",
                      href = "https://github.com/castor00/Dev_Data_Prod_Course_prj")),
                  h4("Input"),
                  p("The application uses data of a sample project. The user is asked to enter 
                    the project's actual day by using the slider and select the estimation method. 
                    The project's actual day is the",
                        em("Time Now"),
                    "and is counted in days from the project's start day.
                    The estimation method depends on the Performance Factor (PF),
                    which refers to the assumption made about the expected performance 
                    of the future work, as follows:"),
                  br(),
                  p(strong("1. PF = 1." ), "Future performance is expected to follow the baseline schedule."),
                  p(strong("2. PF = SPI(t)." ), "Future performance is expected to follow the current time performance."),
                  p(strong("3. PF = SCI(t)." ), "Future performance is expected to follow the current time and cost performance."),
                  h4("Output"),
                  p("The application calculates the basic performance indexes (SPI(t), CPI and SCI(t)) and the Estimated At Completion Time (EAC(t)) 
                    for the Actual Day entered and the estimation method (PF) selected."),
                  br(),
                  p(strong("SPI(t)" ), "is and index that shows the current schedule performance. 
                    SPI(t) > 1 means that the project is ahead of schedule,
                    SPI(t) < 1 means that the project is behind schedule and
                    SPI(t) = 1 means that the project is on schedule"),
                  p(strong("CPI" ), "is and index that shows the current cost performance. 
                    CPI > 1 means that the project is under budget,
                    CPI < 1 means that the project is over budget and
                    CPI = 1 means that the project is on budget"),
                  p(strong("CSI(t)" ), "is a composite index for schedule and cost performance. 
                    It is the product of SPI(t) and CPI."),
                  p(strong("EAC(t)" ), "Is the Estimation At Completion Time, i.e. the estimated duration of the project."),
                  br(),
                  p("Lipke, Walt (2003). Schedule is Different. The Measurable News, March & Summer 2003")
                  )
        )
))