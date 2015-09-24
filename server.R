library(shiny)
require(xlsx)

data <- read.xlsx2("Data/EV_input.xlsx",1, header = TRUE, colClasses= c("numeric","numeric","numeric","numeric"))
data$SV <- data$EV - data$PV
data$SV <- data$EV - data$AC
data$SV <- data$EV - data$PV
data$CV <- data$EV - data$AC
data$SPI <- data$EV / data$PV
data$CPI <- data$EV / data$AC
data$SCI <- data$SPI * data$CPI

ESm <- data[,1]

for(i in 1:nrow(data)) {
        ESm <- cbind(ESm, data$EV[i] - data$PV)
}

PVmax <- max(data$PV)
PD <- sum(data$PV < PVmax)+1

# Define server logic required to draw a histogram
shinyServer(
        function(input, output) {
                
                t <- reactive({as.numeric(input$AD)})
                ESc <- reactive({ESm[ ,t()+1]})
                EScpos <-  reactive({ESc()[ which(ESc()>0)]})
                C <- reactive({as.numeric(length(EScpos()))})
                ESt <- reactive({C() + (data$EV[t()] - data$PV[C()])/(data$PV[C()+1] - data$PV[C()])})
                SPIt <- reactive({ESt()/t()})
                CPI <- reactive({data$CPI[t()]})
                SCIt <- reactive({SPIt()*data$CPI[t()]})
                
                meth <- reactive({as.numeric(input$method)})
                PF <- reactive({if(meth() == 1) {1
                                } else if(meth() == 2) {SPIt()
                                } else SCIt()})
                
                EACt <- reactive({t() + (PD - ESt())/PF()})
                
                output$SPI <- renderText({round(SPIt(),3)})
                output$CPI <- renderText({round(CPI(),3)})
                output$SCI <- renderText({round(SCIt(),3)})
                output$EAC <- renderText({round(EACt(),3)})
                
        }
)