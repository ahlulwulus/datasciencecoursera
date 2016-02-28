# BMI Apps - ui.R
library(rCharts)
library(shiny)
library(datasets)
library(ISOcodes)
data(ISO_3166_1)

# The Interfaces
#shinyUI(pageWithSidebar(theme = "bootstrap.css",
shinyUI(fluidPage(theme = "bootstrap.css",
headerPanel("Body Mass Index (BMI)"),
sidebarPanel(numericInput(inputId="heightM", label="Your height in cm", value= 0,min=0),
             numericInput(inputId="weightM", label="Your weight in kg", value= 0,min=0),
             radioButtons(inputId="gender", label="Gender", choices=c("Male", "Female")),
             selectInput(inputId="country", label="Country", choices=sort(ISO_3166_1$Alpha_3),
             multiple = FALSE,selected="MYS"),
             conditionalPanel(condition = "input.country == 'MYS'",
                        p("If you live in USA, please choose a state"),
                        selectInput(inputId="state", label="State", choices=state.name,
                        multiple = FALSE,selected=NULL)), actionButton("goButton", "GO!"), br(), 
                        br(), p(strong(em("Documentation:",a("Body Mass Index BMI)",href="READMe.html")))),
                        p(strong(em("Github repository:",a("Peer Assessment for Shiny Apps Assignment",href="https://github.com/ahlulwulus/datasciencecoursera/tree/master/Module%209%20-%20Assignment")))),width = 3),
mainPanel(tabsetPanel(tabPanel('Your results',
                      h5('Your BMI coefficient kg/m^2'),
                      verbatimTextOutput("oiBMI"),
                      verbatimTextOutput("oiBMIclass"),
                      img(src="WHOBMI.png", height = 600, width =600),
                      p("Source: ", a("WHO BMI classification", 
                      href = "http://apps.who.int/bmi/index.jsp?introPage=intro_3.html"))),
tabPanel('Data Summary', h5('Available data for'),
                                 verbatimTextOutput("oicountry"),
                                 h5('Gender'),
                                 verbatimTextOutput("oigender"),
                                 h5('Mean BMI (kg/m2) (crude estimate) and 95% CI'),
                                 verbatimTextOutput("oiBMIcrude"),
                                 p("Source: ", a("WHO Global Health Observatory Data Repository", href = "http://apps.who.int/gho/data/node.main.A903?lang=en")),
                                 h5('Recent BMI Indicators'),
                                 dataTableOutput("oiBMIcattable"),
                                 p("Source: ", a("KNOEMA-WHO Global Database on Body Mass Index (BMI)", 
                                        href = "http://knoema.com/WHOGDOBMIMay/who-global-database-on-body-mass-index-bmi"))
                                ),
tabPanel('Plot: BMI Indicators',
                                 h5('Recent BMI Indicators'),
                                 p("Plotted data are for your gender for your specific country"),
                                 p("If there are no data for your gender, plotted data are for adults for your specific country"),
                                 verbatimTextOutput("oiPlotYear"),
                                 showOutput("Plot1","highcharts"),
                                 p("Worldwide Data: ", a("KNOEMA-WHO Global Database on Body Mass Index (BMI)", href = "http://knoema.com/WHOGDOBMIMay/who-global-database-on-body-mass-index-bmi"))
                                 ),
tabPanel('Plot: Mean BMI Trend',
                                 h5('Mean BMI Trend per Years'),
                                 showOutput("Plot2","highcharts"),
                                 p("Source: ", a("WHO Global Health Observatory Data Repository", 
                                                 href = "http://apps.who.int/gho/data/node.main.A903?lang=en"))
                                 ),
tabPanel('Plot: BMI for Malaysian',
                                 h5('2012 Malaysian BMI Indicators'),
                                 verbatimTextOutput("oiState"),
                                 showOutput("Plot3","highcharts"),
                                 p("Malaysia Data: ", a("CDC-Behavioral Risk Factor Surveillance System; Prevalence and Trends Data; Overweight and Obesity(BMI) 2012", href = "http://apps.nccd.cdc.gov/brfss/list.asp?cat=OB&yr=2012&qkey=8261&state=All"))
                                 )
                ),
p(strong("Don't Leave Home Without Personal medical record - http://www.womenshealthmag.com/"))
               )
)
)