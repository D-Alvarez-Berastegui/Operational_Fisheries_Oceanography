
mycss <- "
#plot-container {
position: relative;
}
#loading-spinner {
position: absolute;
left: 50%;
top: 50%;
z-index: -1;
margin-top: -33px;  /* half of the spinner's height */
margin-left: -33px; /* half of the spinner's width */
}
.fa{
font-size: 20px;
align: left;
}


#plot.recalculating {
z-index: -2;
}
h2 {
color:#eee;
font-weight: 100;
}


.text-primary{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.bg-primary{
color:#fff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
table {
margin: auto;
}
table td {
padding: .2em;
}
table input {
border-radius: .2em
border: 1px solid #444;
}
.btn-primary{
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.shiny-notification {
position:fixed;
top: calc(50%);
left: calc(35%);
right: calc(35%);
bottom: calc(35%);
text-align: center;
font-size: 1.25em;
opacity: 10;
}
.shiny-notification-message {
position:fixed;
top: calc(50%);
left: calc(35%);
right: calc(35%);
bottom: calc(30%);
text-align: center;
font-size: 1.25em;
opacity: 10;
}

.btn-primary.disabled:hover,
.btn-primary[disabled]:hover,
fieldset[disabled] .btn-primary:hover,
.btn-primary.disabled:focus,
.btn-primary[disabled]:focus,
fieldset[disabled] .btn-primary:focus,
.btn-primary.disabled.focus,
.btn-primary[disabled].focus,
fieldset[disabled] .btn-primary.focus{
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.btn-primary .badge{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.btn-link{
color:#FCFCFC;
}
.dirButton{
background: linear-gradient( #37BFD0, #073D5F) !important;
color: white;
}
.sections {
background: linear-gradient(#37BFD0,#073D5F);
padding: .25em;
text-align: center;
font-size: 3em;
color: #FFF;
}
.dropdown-menu>li>a:hover,
.dropdown-menu>li>a:focus{
text-decoration:none;
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.dropdown-menu>.active>a,
.dropdown-menu>.active>a:hover,
.dropdown-menu>.active>a:focus{
color:#ffffff;
text-decoration:none;
outline:0;
background-color:transparent;
}
.nav .open>a,
.nav .open>a:hover,
.nav .open>a:focus{
background-color:#dddddd;
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.nav-pills>li.active>a,
.nav-pills>li.active>a:hover,
.nav-pills>li.active>a:focus{
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .navbar-nav>li>a:hover,
.navbar-default .navbar-nav>li>a:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);;
}
.navbar-default .navbar-nav>.active>a,
.navbar-default .navbar-nav>.active>a:hover,
.navbar-default .navbar-nav>.active>a:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .navbar-nav>.open>a,
.navbar-default .navbar-nav>.open>a:hover,
.navbar-default .navbar-nav>.open>a:focus{
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover,
.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .navbar-nav .open .dropdown-menu>.active>a,
.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover,
.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.shiny-notification-error {
background-color: #EF3340;
color: #FFF;
}
.navbar-default .navbar-link:hover{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-default .btn-link:hover,
.navbar-default .btn-link:focus{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-inverse{
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.pagination>li>a:hover,
.pagination>li>span:hover,
.pagination>li>a:focus,
.pagination>li>span:focus{
z-index:2;
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.pagination>.active>a,
.pagination>.active>span,
.pagination>.active>a:hover,
.pagination>.active>span:hover,
.pagination>.active>a:focus,
.pagination>.active>span:focus{
z-index:3;
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
cursor:default;
}
.pager li>a:hover,
.pager li>a:focus{
text-decoration:none;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.label-primary{
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.badge{
display:inline-block;
min-width:10px;
padding:3px 7px;
font-size:12px;
font-weight:bold;
color:#ffffff;
line-height:1;
vertical-align:middle;
white-space:nowrap;
text-align:center;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-radius:10px;
}
.list-group-item.active>.badge,
.nav-pills>.active>a>.badge{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:#ffffff;
}
a.thumbnail:hover,
a.thumbnail:focus,
a.thumbnail.active{
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.progress-bar{
float:left;
width:0%;
height:100%;
font-size:12px;
line-height:18px;
color:#ffffff;
text-align:center;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.list-group-item.active,
.list-group-item.active:hover,
.list-group-item.active:focus{
z-index:2;
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.panel-primary{
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.panel-primary>.panel-heading{
color:#ffffff;
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.panel-primary>.panel-heading+.panel-collapse>.panel-body{
border-top-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.panel-primary>.panel-heading .badge{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
background-color:#ffffff;
}
.panel-primary>.panel-footer+.panel-collapse>.panel-body{
border-bottom-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.navbar-inverse .badge{
background-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.btn-primary,
.btn-primary:hover{
background-image:-webkit-linear-gradient(	#37BFD0, #187D94, #073D5F);
background-image:-o-linear-gradient(	#37BFD0, #187D94, #073D5F);
background-image:-webkit-gradient(linear, left top, left bottom, from(#37BFD0), color-stop(#187D94), to(#073D5F));
background-image:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.has-error .help-block,
.has-error .control-label,
.has-error .radio,
.has-error .checkbox,
.has-error .radio-inline,
.has-error .checkbox-inline,
.has-error.radio label,
.has-error.checkbox label,
.has-error.radio-inline label,
.has-error.checkbox-inline label,
.has-error .form-control-feedback{
color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.helptab table {
border: 1px #444;
margin: auto;
}
.helptab table td {
background-color: #ddd;
padding: .2em;
}
.helptab table th {
background-color: #bbb;
padding: .2em;
}
.has-error .form-control,
.has-error .form-control:focus{
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
}
.pager a:hover,
.pager .active>a{
border-color:linear-gradient(	#37BFD0, #187D94, #073D5F);
color:#fff;
}
#tabs{
background: linear-gradient(	#37BFD0, #187D94, #073D5F);
}
#navbarPage{
background: linear-gradient(	#37BFD0, #187D94, #073D5F);
}
"

shinyUI(
  list(
       navbarPage(theme = shinytheme("yeti"), id = "tabs",
                   useShinyjs(),
                   
                   tabPanel("Start", value = 'Start',
                            
                            fluidRow(
                              
                              br(),
                              br(),
                              br(),
                              
                              column(12, align = 'center',
                                     
                                     img(
                                       src = "logo-Socib.png",
                                       height = 130 * 2.2,
                                       width = 180 * 3
                                     )
                              ),
                              
                              br(),
                              
                              column(12, align = 'center',
                                     
                                     br(),
                                     
                                     h4("SOCIB Repository Management Application"),
                                     
                                     br(),  
                                     h2('WELCOME', style = 'color: black;'),
                                     br(),
                                     br(),
                                     actionButton('welcome','Login', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 120 ),
                                     br(),
                                     br(),
                                     br()
                              )
                              
                            )
                   ),
                   ###########DESPLEGABLE MANAGEMENT#######################################################################################
                   navbarMenu("Management",
                              ###########PESTAÑA selection DENTRO DE DESPLEGABLE MENU SUPERIOR###########################################################
                              tabPanel("Selection",
                                       #tags$div("Selection", class="sections"), 
                                       fluidRow(# Logo.
                                         
                                         column(2,
                                                align = 'left',
                                                
                                                img( src = "logo-Socib.png",
                                                     height = 90.2812,
                                                     width = 287.375
                                                )),
                                         
                                         br(),
                                         
                                         column(10, offset = 0, align = 'center',
                                                
                                                titlePanel(
                                                  
                                                  h2(strong('Selection'), style = ' text-indent: -200px; color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F)') 
                                                  
                                                )
                                                
                                         )
                                         
                                       ),
                                       column(width = 12, align = 'center',
                                              h3(strong("Please, make your selection"))
                                              
                                              ),
                                       br(),
                                       fluidRow(
                                         column(width = 2, align = 'center',
                                                selectInput(
                                                  "parameters",label = div("Variable",style="align:center;"),
                                                  choices = list("","Zonal_Current",# (uo y vozocrtx),
                                                                 "Meridional_Current",# (vo y vomecrty),
                                                                 "Temperature",# (thetao y votemper),
                                                                 "Salinity",# (so y vosaline),
                                                                 "Sea_Surface_Height",# (zos y sossheig), 
                                                                 "Sea_level_anomaly",#(sla),
                                                                 "Mixed_Layer_Thickness",# (mlotst),
                                                                 "Chlorophyll-a"),selected = NULL,multiple = FALSE)
                                         ),
                                         column(width = 5,align = 'center',
                                                selectInput(
                                                  "database",label = div("Database Name",style="align:center;"),width = '500px',
                                                  choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013",
                                                                 "MEDSEA_ANALYSIS_FORECAST_BIO_006_014",
                                                                 "MEDSEA_REANALYSIS_PHYS_006_004", 
                                                                 "MEDSEA_REANALYSIS_PHY_006_009",
                                                                 "MEDSEA_REANALYSIS_BIO_006_008", 
                                                                 "SEALEVEL_MED_PHY_L4_NRT_OBSERVATIONS_008_050",
                                                                 "SEALEVEL_MED_PHY_L4_REP_OBSERVATIONS_008_051",
                                                                 "OCEANCOLOUR_MED_CHL_L4_NRT_OBSERVATIONS_009_041",
                                                                 "OCEANCOLOUR_MED_CHL_L3_NRT_OBSERVATIONS_009_040",
                                                                 "OCEANCOLOUR_MED_CHL_L3_REP_OBSERVATIONS_009_073",
                                                                 "OCEANCOLOUR_MED_CHL_L4_REP_OBSERVATIONS_009_078",
                                                                 "OCEANCOLOUR_EUR_CHL_L3_NRT_OBSERVATIONS_009_050"),selected = NULL,multiple = FALSE)
                                                
                                         ),

                                         
                                         column(width = 5,align = 'center',
                                                selectInput(
                                                  "datasets",label = div("Dataset Name",style="align:center;"),width = '500px',
                                                  choices = ''
                                                )
                                         )
                                       ),
                                       
                                       fluidRow(
                                         column(width = 12, align = 'center',
                                           
                                                dateRangeInput("dates",label = div("Temporal Coverage", style="align:center;"),start = "1955-01-01")
                                                
                                         )
                                         
                                       ),
                                       fluidRow(
                                         column(width=12, align = 'center',
                                                uiOutput('resolution')
                                                )
                                       ),
                                       fluidRow(
                                         column(width=12, align = 'center',
                                                uiOutput('resolution2')
                                         )
                                       ),
                                       fluidRow(
                                         column(width=4, align = 'center',
                                                numericInput("longmin", label = div("Longitude min", style="align:center;"),value = -6)
                                                
                                                ),
                                         
                                         column(width = 4, align = 'center',
                                                
                                                numericInput("latmin", label = div("Latitude min", style="align:center;"),value = 30.1875)
                                                
                                                ),
                                         conditionalPanel(
                                           condition = "input.database == 'MEDSEA_ANALYSIS_FORECAST_PHY_006_013' |
                                                        input.database == 'MEDSEA_ANALYSIS_FORECAST_BIO_006_014' |
                                                        input.database == 'MEDSEA_REANALYSIS_PHYS_006_004' |
                                                        input.database == 'MEDSEA_REANALYSIS_PHY_006_009' |
                                                        input.database == 'MEDSEA_REANALYSIS_BIO_006_008' ",
                                              column(width = 4, align = 'center',
                                              
                                                selectInput("depmin", label = div("Depth min", style="align:center;"),
                                                            choices = '',selected = '')
                                                
                                                )
                                         )
                                       ),
                                       
                                       fluidRow(
                                         
                                         column(width = 4, align = 'center',
                                                
                                                numericInput("longmax", label = div("Longitude max", style="align:center;"),value = 36.25)
                                                
                                                ),
                                         
                                         column(width = 4, align = 'center',
                                                
                                                numericInput("latmax", label = div("Latitude max", style="align:center;"),value = 45.9375)
                                                
                                                ),
                                         conditionalPanel(
                                           condition = "input.database == 'MEDSEA_ANALYSIS_FORECAST_PHY_006_013' |
                                                        input.database == 'MEDSEA_ANALYSIS_FORECAST_BIO_006_014' |
                                                        input.database == 'MEDSEA_REANALYSIS_PHYS_006_004' |
                                                        input.database == 'MEDSEA_REANALYSIS_PHY_006_009' |
                                                        input.database == 'MEDSEA_REANALYSIS_BIO_006_008' ",
                                            column(width = 4, align = 'center',
                                               
                                                selectInput("depmax", label = div("Depth max", style="align:left;"),
                                                            choices = '',selected = '')
                                                )
                                         )
                                       ),
                                       
                                       fluidRow(
                                         column(width = 4,offset = 4, align = 'center',
                                                shinyDirButton("dir", "Work Directory",'work directory', class = 'dirButton')       
                                                )),
                                       br(),
                                       fluidRow(
                                         
                                         column(  width = 4, offset = 4, align = 'center',
                                                  
                                                  verbatimTextOutput("dir", placeholder = FALSE)  
                                         )
                                       ),
                                         
                                       
                                       
                                       fluidRow(
                                         
                                         column( width = 3, offset = 2,align = 'center',
                                           
                                           textInput('CoperUser', label = div("Copernicus User Name", style="align:center;"),value = '')
                                         ),
                                         
                                         column(width = 3, offset = 2,align = 'center',
                                                
                                                passwordInput('CoperPass', label = div("Copernicus Password", style="align:center;"),value = '')
                                                
                                                )
                                       ),
                                       
                                       fluidRow(
                                         
                                         column(width = 12, align = 'center',
                                                
                                                actionButton('load1', 'Download data', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 150)
                                                
                                                )
                                       ),
                                       br(),
                                       br(),
                                       br(),

                                       
                                       
                                       fluidRow(
                                         column(width = 12, align = 'center',
                                                conditionalPanel(condition = "input.load1%2==0 &  $('html').hasClass('shiny-busy')",
                                                                 tags$img(src = "loadingPage.gif", id = "loading-spinner",
                                                                          height = 100*.5,
                                                                          width = 100*.5
                                                                 )
                                                )
                                                ),
                                         column(width = 12, align = 'center',
                                                conditionalPanel(condition = "input.load1%1==0 &  $('html').hasClass('shiny-busy')",
                                                                 tags$img(src = "loadingPage.gif", id = "loading-spinner",
                                                                          height = 100*.5,
                                                                          width = 100*.5
                                                                 )
                                                )
                                         )
                                         
                                       ),
                                       
                                           column(width=12, align="right",
                                                  actionButton("continue_a", "Continue", align="right", style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 100),
                                                  br(),
                                                  br(),
                                                  br(),
                                                  br(),
                                                  br(),
                                                  br())
                                           
                                         ),  #finaliza tabPanel 'selection'
                              ###########PESTAÑA SUMMARY DENTRO DE DESPLEGABLE MENU SUPERIOR##########################################################
                              tabPanel("Summary",
                                      # tags$div("Summary", class="sections"),
                                       fluidRow(
                                         
                                         column(2,
                                                align = 'left',
                                                
                                                img( src = "logo-Socib.png",
                                                     height = 90.2812,
                                                     width = 287.375
                                                )),
                                         
                                         br(),
                                         
                                         column(10, offset = 0, align = 'center',
                                                
                                                titlePanel(
                                                  
                                                  h2(strong('Summary'), style = ' text-indent: -220px; color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F)') 
                                                  
                                                )
                                                
                                         )
                                         
                                       ),
                                       column(width = 12, align = 'center',
                                              h3(strong("Summary of downloaded file"))
                                              
                                       ),
                                      
                                       column(width = 12, align = 'center',
                                              actionButton('summary',label = 'Show Summary', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 150)
                                       ),
                                       
                                       
                                       
                                       
                                       fluidRow(
                                         
                                         column(width = 12, align = 'center',
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                conditionalPanel(condition = "input.summary>0 &  $('html').hasClass('shiny-busy') & !output.maxvar",
                                                                 tags$img(src = "loadingPage.gif", id = "loading-spinner",
                                                                          height = 100*.5,
                                                                          width = 100*.5
                                                                 )
                                                )
                                         )
                                         
                                       ),
                                       fluidRow(
                                         column(width = 3, offset = 1,
                                                uiOutput('maxvar')
                                         ),
                                         column(width = 3, offset = 1,
                                                uiOutput('minvar')
                                         ),
                                         column(width = 3, offset = 1,
                                                uiOutput('meanvar')
                                         )
                                         
                                       ),
                           
                                       fluidRow(
                                         column( width = 12,
                                                 dataTableOutput('tabla2')
                                         )
                                         
                                       ),
                                       column(width=12, align="right",
                                              actionButton("continue_b", "Continue", align="right", style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 100),
                                              br(),
                                              br(),
                                              br(),
                                              br(),
                                              br(),
                                              br())
                                       
                                    
                              ),
                              ###########PESTAÑA NUMERICAL REPORT DENTRO DE DESPLEGABLE MENU SUPERIOR#################################################
                              tabPanel("Plots",
                                       #tags$div("Plots", class="sections"),
                                       fluidRow(# Logo.
                                         
                                         column(2,
                                                align = 'left',
                                                
                                                img( src = "logo-Socib.png",
                                                     height = 90.2812,
                                                     width = 287.375
                                                )),
                                         
                                         br(),
                                         
                                         column(10, offset = 0, align = 'center',
                                                
                                                titlePanel(
                                                  
                                                  h2(strong('Plots'), style = ' text-indent: -220px; color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F)') 
                                                  
                                                )
                                                
                                         )
                                         
                                       ),
                                       column(width = 12, align = 'center',
                                              h3(strong("Plots file"))
                                              
                                       ),
                                       column(width = 12, align = 'center',
                                              selectInput('fechaplot',label = 'Select day to plot', choices = '', width = 150)
                                       ),
                                       column(width = 12, align = 'center',
                                              actionButton('showPlot',label = 'Show Plot', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 150)
                                       ),
                                       fluidRow(
                                         column( width = 8, offset = 2, align = 'center',
                                                 plotOutput('plot1')
                                         )
                                         
                                       ),
                                       column(width=12, align="right",
                                              actionButton("continue_c", "Continue", align="right", style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 100),
                                              br(),
                                              br(),
                                              br(),
                                              br(),
                                              br(),
                                              br())
                              ),
                              ###########PESTAÑA NUMERICAL REPORT DENTRO DE DESPLEGABLE MENU SUPERIOR###############################################
                              tabPanel("Bluefin",
                                       #tags$div("Bluefin", class="sections"),
                                       fluidRow(# Logo.
                                         
                                         column(2,
                                                align = 'left',
                                                
                                                img( src = "logo-Socib.png",
                                                     height = 90.2812,
                                                     width = 287.375
                                                )),
                                         
                                         br(),
                                         
                                         column(10, offset = 0, align = 'center',
                                                
                                                titlePanel(
                                                  
                                                  h2(strong('Bluefin'), style = ' text-indent: -220px; color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F)') 
                                                  
                                                )
                                                
                                         )
                                         
                                       ),
                                       h3(strong("Bluefin Product"),align = 'center'),
                                       br(),
                                       column(width = 12, align = 'center',
                                             # dateRangeInput('bluefinFecha', label = 'Select first date to generate product')
                                              dateRangeInput("datesBF",label = div("Select dates to generate product", style="align:center;"))
                                              
                                              ),
                                       fluidRow(
                                         column(width = 4,offset = 4, align = 'center',
                                                shinyDirButton("dirBluefin", "Save Directory",'Save directory', class = 'dirButton')       
                                         )),
                                       br(),
                                       fluidRow(
                                         
                                         column(  width = 4, offset = 4, align = 'center',
                                                  
                                                  verbatimTextOutput("dirBluefin", placeholder = FALSE)  
                                         )
                                       ),
                                       column(width = 12, align = 'center',
                                              actionButton('bluefinProd',label = 'Generate Product', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F)', width = 180)
                                       ),
                                       fluidRow(
                                         column(width = 8, offset = 2, align = 'center',
                                                uiOutput('errorMensageNc')
                                                )

                                       ),
                                       fluidRow(
                                         column( width = 8, offset = 2, align = 'center',
                                                 plotOutput('plot2')
                                         )
                                         
                                       )
                                      
                              )  
                              ###########FIN DESPLEGABLE MANAGEMENT###################################################################################
                   ),
                   
                   ###########PESTAÑA AYUDA DENTRO DE DESPLEGABLE MENU SUPERIOR############################################################
                   tabPanel("Help",
                            tags$div("Help", class="sections"),
                            hr(),
                            
                            navlistPanel(widths = c(3, 9),
                                         
                                         "1. General Vision",
                                         
                                         tabPanel( "1.1 Login and introduction",
                                                   
                                                   fluidRow(
                                                     
                                                     column(10, offset = 0,
                                                            includeHTML("ayuda/introduccion.html"))
                                                     
                                                   )
                                                   
                                         ),
                                         
                                         '2. Functionality',
                                         
                                         tabPanel("2.1 Selection",
                                                  
                                                  fluidRow(
                                                    
                                                    column(10, offset = 0,
                                                           includeHTML("ayuda/selection.html"))
                                                    
                                                  )                 
                                                  
                                         ),
                                         
                                         tabPanel("2.2 Summary",
                                                  
                                                  fluidRow(
                                                    
                                                    column(10, offset = 0,
                                                           includeHTML("ayuda/summary.html"))
                                                    
                                                  )                 
                                                  
                                         ),
                                         
                                         tabPanel("2.3 Plots",
                                                  
                                                  fluidRow(
                                                    
                                                    column(10, offset = 0,
                                                           includeHTML("ayuda/plots.html"))
                                                  )                 
                                                  
                                         ),
                                         
                                         tabPanel("2.4 Bluefin",
                                                  
                                                  fluidRow(
                                                    
                                                    column(10, offset = 0,
                                                           includeHTML("ayuda/bluefin.html"))
                                                  )                 
                                                  
                                         )
                            )
                            
                            
                   ),
                   ###########PESTAÑA LOGIN DENTRO DE DESPLEGABLE MENU SUPERIOR############################################################
                   tabPanel("Login",
                            fluidRow(
                              
                              column(4, align = 'left',textInput("userUI",width = 1250,label = div("User", style = 'font-weight:bold; font-size: 15px; color:#777777'),value = ''),
                                     
                                     passwordInput("passwordUI",width = 1250,label = div("Password", style = 'font-weight:bold; font-size: 15px; color:#777777'),value = ''),
                                     
                                     actionButton('login', 'login', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F);'),
                                     
                                     uiOutput("errorMensageLogin"))
                              
                            )),
                   ###########PESTAÑA LOGOUT DENTRO DE DESPLEGABLE MENU SUPERIOR###########################################################
                   tabPanel("Logout",
                            fluidRow(
                              
                              column(4, align = 'left',actionButton('reload', 'Logout', style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F);') )
                              
                            )),
                   ###########PESTAÑA ADMIN DENTRO DE DESPLEGABLE MENU SUPERIOR############################################################
                   tabPanel("Admin"
                            ,
                            
                            fluidRow(
                              
                              column(2,uiOutput("Delete1"))),
                            
                            fluidRow(
                              
                              column(2,uiOutput("Delete2")),
                              
                              column(3,uiOutput("errorMensageDelete"))
                            ),br(),br(),
                            
                            fluidRow(
                              
                              column(3,uiOutput("Add1")),
                              
                              column(3,uiOutput("Add4")),
                              
                              br(),
                              
                              column(3,uiOutput("Add3"))
                              
                              
                            ),
                            fluidRow(
                              column(3,uiOutput("Add2")),
                              
                              column(3,uiOutput("errorMensageAdd"))
                              
                            ),br(),br(),
                            
                            fluidRow(
                              
                              column(4, align = 'left',dataTableOutput ('TablaPermisos'))
                              
                            )
                   )   
                   ),tags$head(tags$style(HTML(mycss)))
                   )
)
