
shinyServer(function(input, output, session) {
  
  source("randomUser.R")
  
  miUsuario <- userID
  
  updateNavbarPage(session, "tabs",selected="Start")

  assign('loginCorrect',  FALSE,  envir = get(miUsuario))
  assign('UserAdmin',     FALSE,  envir = get(miUsuario))

    volumes <- getVolumes()
    shinyDirChoose(  input
                     , 'dir'
                     , session = session
                     , roots=volumes)
    
    
    global <- reactiveValues(datapath = '')
    dir <- reactive(input$dir)
    output$dir <- renderText({global$datapath})
    observeEvent(  ignoreNULL = TRUE
                   , eventExpr = {input$dir}
                   , handlerExpr = {
                   global$datapath <- file.path(paste(unlist(dir()))
                   )
                   }
                   
    )
    
    shinyDirChoose(  input
                     , 'dirBluefin'
                     , session = session
                     , roots=volumes)
    
    
    global <- reactiveValues(datapath = '')
    dirBluefin <- reactive(input$dirBluefin)
    output$dirBluefin <- renderText({global$datapath})
    observeEvent(  ignoreNULL = TRUE
                   , eventExpr = {input$dirBluefin}
                   , handlerExpr = {
                     global$datapath <- file.path(paste(unlist(dirBluefin()$path[-1]))
                     )
                   }
                   
    )
   
    names13<-c('sv04-med-ingv-cur-an-fc-d','sv04-med-ingv-ssh-an-fc-d','sv04-med-ingv-tem-an-fc-d','sv04-med-ingv-sal-an-fc-d',
               'sv04-med-ingv-mld-an-fc-d','sv04-med-ingv-cur-an-fc-h','sv04-med-ingv-ssh-an-fc-h','sv04-med-ingv-tem-an-fc-h',
               'sv04-med-ingv-sal-an-fc-h','sv04-med-ingv-mld-an-fc-h','sv04-med-ingv-cur-an-fc-hts','sv04-med-ingv-ssh-an-fc-hts',
               'sv04-med-ingv-tem-an-fc-hts','sv04-med-ingv-sal-an-fc-hts','sv04-med-ingv-mld-an-fc-hts','sv04-med-ingv-cur-an-fc-m',
               'sv04-med-ingv-ssh-an-fc-m','sv04-med-ingv-tem-an-fc-m','sv04-med-ingv-sal-an-fc-m','sv04-med-ingv-mld-an-fc-m')
      names13_tem<-c('sv04-med-ingv-tem-an-fc-d',
                   'sv04-med-ingv-tem-an-fc-h',
                   'sv04-med-ingv-tem-an-fc-hts',
                   'sv04-med-ingv-tem-an-fc-m')
      names13_sal<-c('sv04-med-ingv-sal-an-fc-d',
                   'sv04-med-ingv-sal-an-fc-h',
                   'sv04-med-ingv-sal-an-fc-hts',
                   'sv04-med-ingv-sal-an-fc-m')
      names13_cur<-c('sv04-med-ingv-cur-an-fc-d',
                   'sv04-med-ingv-cur-an-fc-h',
                   'sv04-med-ingv-cur-an-fc-hts',
                   'sv04-med-ingv-cur-an-fc-m')
      names13_mld<-c('sv04-med-ingv-mld-an-fc-d',
                   'sv04-med-ingv-mld-an-fc-h',
                   'sv04-med-ingv-mld-an-fc-hts',
                   'sv04-med-ingv-mld-an-fc-m')
      names13_ssh<-c('sv04-med-ingv-ssh-an-fc-d',
                   'sv04-med-ingv-ssh-an-fc-h',
                   'sv04-med-ingv-ssh-an-fc-hts',
                   'sv04-med-ingv-ssh-an-fc-m')
    names14<-c('sv03-med-ogs-pft-an-fc-d')
    names04<-c('sv03-med-ingv-tem-rean-m','sv03-med-ingv-sal-rean-m','sv03-med-ingv-ssh-rean-m')
      names04_tem <-c('sv03-med-ingv-tem-rean-d','sv03-med-ingv-tem-rean-m')
      names04_sal <-c('sv03-med-ingv-sal-rean-d','sv03-med-ingv-sal-rean-m')
      names04_ssh <-c('sv03-med-ingv-ssh-rean-d','sv03-med-ingv-ssh-rean-m')
    names09<-c('sv03-med-ingv-cur-rean2-m','sv03-med-ingv-ssh-rean2-m','sv03-med-ingv-tem-rean2-m','sv03-med-ingv-sal-rean2-m')
      names09_tem <-c('sv03-med-ingv-tem-rean2-m')
      names09_cur <-c('sv03-med-ingv-cur-rean2-m')
      names09_sal <-c('sv03-med-ingv-sal-rean2-m')
      names09_ssh <-c('sv03-med-ingv-ssh-rean2-m')
    names08<-c('sv03-med-ogs-pft-rean-m')
    names08_50<-c('dataset-duacs-nrt-medsea-merged-allsat-phy-l4')
    names51<-c('dataset-duacs-rep-medsea-merged-allsat-phy-l4')
    names41<-c('dataset-oc-med-chl-multi-l4-chl_1km_8days-rt-v02','dataset-oc-med-chl-multi-l4-chl_1km_monthly-rt-v02',
               'dataset-oc-med-chl-multi-l4-interp_1km_daily-rt-v02','dataset-oc-med-chl-olci_a-l4-chl_1km_8days-rt-v02',
               'dataset-oc-med-chl-olci_a-l4-chl_1km_monthly-rt-v02')
    names40<-c('dataset-oc-med-chl-multi-l3-chl_1km_daily-rt-v02','dataset-oc-med-chl-olci_a-l3-chl_1km_daily-rt-v02')
    names73<-c('dataset-oc-med-chl-multi_cci-l3-chl_1km_daily-rep-v02')
    names78<-c('dataset-oc-med-chl-multi_cci-l4-chl_1km_8days-rep-v02','dataset-oc-med-chl-multi_cci-l4-chl_1km_monthly-rep-v02')
    names09_50<-c('dataset-oc-eur-chl-multi-l3-chl_1km_daily-rt-v02')

  depth_values1<-c('','1.472','4.5873','7.944','11.5585','15.4486','19.6331',
                  '24.1325','28.9682','34.163399999999996','39.7427',
                  '45.732499999999995','52.160999999999994','59.0582',
                  '66.4563','74.3896','82.8948','92.011','101.78009999999999',
                  '112.24669999999999','123.4585','135.4664','148.3248',
                  '162.0917','176.8292','192.6032','209.4845','227.54829999999999',
                  '246.8751','267.5505','289.6662','313.31960000000004','338.6148',
                  '365.66200000000003','394.5822','425.49870000000004','458.547',
                  '493.8702','531.62','571.9616','615.06540000000001','661.1164',
                  '710.3108','762.857','818.9768','878.9061','942.8955','1011.2111',
                  '1084.1357','1161.9694','1245.0307','1333.656','1428.2062','1529.057',
                  '1636.6108','1751.292','1873.5488','2003.8552','2142.7113',
                  '2290.6443999999997','2448.2097999999996','2615.9925','2794.6072999999997',
                  '2984.6998','3186.9474','3402.0597','3630.7796','3873.8826999999997',
                  '4132.1781','4406.509599999999','4697.753299999999','5006.8182',
                  '5334.6478')  
  depth_values2<-c('','1.4722','4.5876','7.9443','11.5588','15.4489','19.63399999999998'
                  ,'24.1328','28.9685','34.16370000000006','39.743','45.73280000000005'
                  ,'52.16130000000004','59.0585','66.45660000000001','74.3899','82.896'
                  ,'92.0113','101.7804','112.247','123.4588','135.4667','148.326','162.092'
                  ,'176.8294','192.6035','209.4848','227.5486','246.8754','267.5508'
                  ,'289.6665','313.31989999999996','338.616','365.66319999999996'
                  ,'394.5825','425.49899999999997','458.54729999999995'
                  ,'493.87039999999996','631.6211999999999','571.9619','615.0657'
                  ,'661.1166999999999','710.312','762.8573','818.978','878.9064'
                  ,'942.8958','1011.2114','1084.136','1161.9696999999999','1245.031'
                  ,'1333.6571999999999','1428.2064','1529.0573','1636.612','1751.2923'
                  ,'1873.55','2003.8555','2142.7116','2290.6447000000003'
                  ,'2448.2200000000003','2615.9928','2794.6076000000003'
                  ,'2984.7999999999997','3186.9477','3402.0600000000004','3630.7799'
                  ,'3873.8830000000003','4132.1784','4406.5099','4697.7536'
                  ,'5006.8185','5334.649')
  depth_values13_1<-c('','1.0181', '3.1656', '5.4648', '7.9202', '10.5365', '13.318200000000001', '16.2704', '19.3981',
                    '22.7062', '26.2002', '29.8855', '33.7675', '37.852', '42.144000000000005', '46.6521', '51.3797',
                    '56.3341', '61.5218', '66.9493', '72.62349999999999', '78.5514', '84.72999999999999', '91.1965', 
                    '97.9286', '104.9438', '112.2501', '119.8553', '127.76769999999999', '135.9957', '144.5478', 
                    '153.43269999999998', '162.6595', '172.2372', '182.1752', '192.483', '203.1703', '214.24699999999999',
                    '225.7233', '237.6093', '249.9157', '262.65310000000005', '275.8324', '289.4646', '303.56120000000004',
                    '318.13340000000005', '333.19300000000004', '348.7518', '364.82180000000005', '381.4153', '398.5446',
                    '416.22220000000004', '434.46000000000004', '453.27360000000004', '472.67330000000004',
                    '492.67330000000004', '513.2868', '534.5274000000001', '556.4087000000001', '578.9444', '602.1485',
                    '626.0348', '650.6174', '675.9106', '701.9285', '728.6855', '756.195', '784.4742', '813.5347', '843.392',
                    '874.0605', '905.5547', '937.889', '971.0777', '1005.1354', '1040.0761', '1075.9142', '1112.6636',
                    '1150.3382', '1188.952', '1228.5187', '1269.0516', '1310.5641', '1353.0692000000001', '1396.5798',
                    '1441.1085', '1486.6677', '1533.2693', '1580.925', '1629.6465', '1679.4447', '1730.3302', '1782.3135',
                    '1835.4044000000001', '1889.6125', '1944.9470000000001', '2001.4165', '2059.028', '2117.7922999999996',
                    '2177.714', '2238.8001', '2301.0575', '2364.4916', '2429.1074999999996', '2494.91', '2561.9019999999996',
                    '2630.0897', '2699.4734999999996', '2770.0564999999997', '2841.8406999999997', '2914.8268', '2989.0157',
                    '3064.4073', '3141.0013', '3218.796', '3297.7900999999997', '3377.9813', '3459.3660999999997',
                    '3541.9417', '3625.7036999999996', '3710.6472999999996', '3796.767', '3884.0593999999996', '3972.5159999999996',
                    '4062.1301999999996', '4152.8949999999995', '4244.804', '4337.8475', '4432.0174', '4527.304',
                    '4623.6986', '4721.1912999999995', '4819.7699999999995', '4919.4271', '5020.1493', '5121.9256',
                    '5224.7445', '5328.5936', '5433.4608', '5539.3333999999995', '5646.1991', '5754.0437999999995')
  depth_values13_2<-c('','1.0184', '3.1659', '5.466', '7.9205', '10.5367', '13.3185', '16.2707', '19.3984', '22.7065', 
                   '26.200499999999998', '29.8858', '33.7678' ,'37.85230000000001', '42.1452', '46.6524', '51.38',
                   '56.3344', '61.522999999999996', '66.9496', '72.6238', '78.55160000000001', '84.7402',
                   '91.19680000000001', '97.9289' ,'104.94500000000001', '112.2504', '119.85560000000001', '127.768',
                   '135.9959', '144.548', '153.433', '162.6598', '172.2375', '182.1755', '192.4833', '203.1706', '214.2473',
                   '225.7235', '237.6096', '249.916', '262.6534', '275.8327', '289.4649', '303.56149999999997', '318.1337',
                   '333.19329999999997', '348.753', '364.823', '381.4156', '398.5449', '416.22249999999997',
                   '434.46119999999996', '453.27389999999997', '472.67359999999996', '492.67359999999996', '513.288',
                   '534.5277', '556.409', '578.9447', '602.1487999999999', '626.036', '650.6177', '675.9109', '701.9288',
                   '728.6858', '756.1962', '784.4744', '813.535', '843.3923', '874.0608', '905.555', '937.8892', '971.078',
                   '1005.1356', '1040.0764', '1075.9144999999999', '1112.6638', '1150.3385', '1188.9523', '1228.5189',
                   '1269.0519', '1310.5644', '1353.0695', '1396.59', '1441.1088', '1486.668', '1533.2696',
                   '1580.9252999999999', '1629.6468', '1679.445', '1730.3305', '1782.3137', '1835.4047', '1889.6127999999999',
                   '1944.9473', '2001.4168', '2059.0292000000004', '2117.7926', '2177.7143', '2238.8004', '2301.0578',
                   '2364.4918000000002', '2429.1078', '2494.9103', '2561.9032', '2630.09', '2699.4738', '2770.0568000000003',
                   '2841.8410000000003', '2914.827', '2989.016', '3064.4076', '3141.0016', '3218.7963000000004',
                   '3297.7904000000003', '3377.9816', '3459.3664000000003', '3541.942', '3625.704', '3710.6476000000002',
                   '3796.7682', '3884.0597000000002', '3972.5163000000002', '4062.1305', '4152.897', '4244.8043',
                   '4337.8478000000005', '4432.0177', '4527.3043', '4623.6989', '4721.1916', '4819.772', '4919.4274000000005',
                   '5020.149600000001', '5121.9259', '5224.7448', '5328.5939', '5433.462', '5539.3336', '5646.1994', '5754.045')
  depth_values13_2_1<-c('','1.0184', '3.1659', '5.466', '7.9205', '10.5367', '13.3185', '16.2707', '19.3984', '22.7065', 
                      '26.200499999999998', '29.8858', '33.7678' ,'37.85230000000001', '42.1452', '46.6524', '51.38',
                      '56.3344', '61.522999999999996', '66.9496', '72.6238', '78.55160000000001', '84.7402',
                      '91.19680000000001', '97.9289' ,'104.94500000000001', '112.2504', '119.85560000000001', '127.768',
                      '135.9959', '144.548', '153.433', '162.6598', '172.2375', '182.1755', '192.4833', '203.1706', '214.2473',
                      '225.7235', '237.6096', '249.916', '262.6534', '275.8327', '289.4649', '303.56149999999997', '318.1337',
                      '333.19329999999997', '348.753', '364.823', '381.4156', '398.5449')
  depth_values14_1<-c('','1.0181', '3.1656', '5.4648', '7.9202', '10.5365', '13.318200000000001', '16.2704', '19.3981',
                      '22.7062', '26.2002', '29.8855', '33.7675', '37.852', '42.144000000000005', '46.6521', '51.3797',
                      '56.3341', '61.5218', '66.9493', '72.62349999999999', '78.5514', '84.72999999999999', '91.1965', 
                      '97.9286', '104.9438', '112.2501', '119.8553', '127.76769999999999', '135.9957', '144.5478', 
                      '153.43269999999998', '162.6595', '172.2372', '182.1752', '192.483', '203.1703', '214.24699999999999',
                      '225.7233', '237.6093', '249.9157', '262.65310000000005', '275.8324', '289.4646', '303.56120000000004',
                      '318.13340000000005', '333.19300000000004', '348.7518', '364.82180000000005', '381.4153', '398.5446',
                      '416.22220000000004', '434.46000000000004', '453.27360000000004', '472.67330000000004',
                      '492.67330000000004', '513.2868', '534.5274000000001', '556.4087000000001', '578.9444', '602.1485',
                      '626.0348', '650.6174', '675.9106', '701.9285', '728.6855', '756.195', '784.4742', '813.5347', '843.392',
                      '874.0605', '905.5547', '937.889', '971.0777', '1005.1354', '1040.0761', '1075.9142', '1112.6636',
                      '1150.3382', '1188.952', '1228.5187', '1269.0516', '1310.5641', '1353.0692000000001', '1396.5798',
                      '1441.1085', '1486.6677', '1533.2693', '1580.925', '1629.6465', '1679.4447', '1730.3302', '1782.3135',
                      '1835.4044000000001', '1889.6125', '1944.9470000000001', '2001.4165', '2059.028', '2117.7922999999996',
                      '2177.714', '2238.8001', '2301.0575', '2364.4916', '2429.1074999999996', '2494.91', '2561.9019999999996',
                      '2630.0897', '2699.4734999999996', '2770.0564999999997', '2841.8406999999997', '2914.8268', '2989.0157',
                      '3064.4073', '3141.0013', '3218.796', '3297.7900999999997', '3377.9813', '3459.3660999999997',
                      '3541.9417', '3625.7036999999996', '3710.6472999999996', '3796.767', '3884.0593999999996', '3972.5159999999996',
                      '4062.1301999999996', '4152.8949999999995')
  depth_values14_1_2<-c('','1.0181', '3.1656', '5.4648', '7.9202', '10.5365', '13.318200000000001', '16.2704', '19.3981',
                      '22.7062', '26.2002', '29.8855', '33.7675', '37.852', '42.144000000000005', '46.6521', '51.3797',
                      '56.3341', '61.5218', '66.9493', '72.62349999999999', '78.5514', '84.72999999999999', '91.1965', 
                      '97.9286', '104.9438', '112.2501', '119.8553', '127.76769999999999', '135.9957', '144.5478', 
                      '153.43269999999998', '162.6595', '172.2372', '182.1752', '192.483', '203.1703', '214.24699999999999',
                      '225.7233', '237.6093', '249.9157', '262.65310000000005', '275.8324', '289.4646', '303.56120000000004',
                      '318.13340000000005', '333.19300000000004', '348.7518', '364.82180000000005', '381.4153', '398.5446')
  depth_values14_2<-c('','1.0184', '3.1659', '5.466', '7.9205', '10.5367', '13.3185', '16.2707', '19.3984', '22.7065', 
                      '26.200499999999998', '29.8858', '33.7678' ,'37.85230000000001', '42.1452', '46.6524', '51.38',
                      '56.3344', '61.522999999999996', '66.9496', '72.6238', '78.55160000000001', '84.7402',
                      '91.19680000000001', '97.9289' ,'104.94500000000001', '112.2504', '119.85560000000001', '127.768',
                      '135.9959', '144.548', '153.433', '162.6598', '172.2375', '182.1755', '192.4833', '203.1706', '214.2473',
                      '225.7235', '237.6096', '249.916', '262.6534', '275.8327', '289.4649', '303.56149999999997', '318.1337',
                      '333.19329999999997', '348.753', '364.823', '381.4156', '398.5449', '416.22249999999997',
                      '434.46119999999996', '453.27389999999997', '472.67359999999996', '492.67359999999996', '513.288',
                      '534.5277', '556.409', '578.9447', '602.1487999999999', '626.036', '650.6177', '675.9109', '701.9288',
                      '728.6858', '756.1962', '784.4744', '813.535', '843.3923', '874.0608', '905.555', '937.8892', '971.078',
                      '1005.1356', '1040.0764', '1075.9144999999999', '1112.6638', '1150.3385', '1188.9523', '1228.5189',
                      '1269.0519', '1310.5644', '1353.0695', '1396.59', '1441.1088', '1486.668', '1533.2696',
                      '1580.9252999999999', '1629.6468', '1679.445', '1730.3305', '1782.3137', '1835.4047', '1889.6127999999999',
                      '1944.9473', '2001.4168', '2059.0292000000004', '2117.7926', '2177.7143', '2238.8004', '2301.0578',
                      '2364.4918000000002', '2429.1078', '2494.9103', '2561.9032', '2630.09', '2699.4738', '2770.0568000000003',
                      '2841.8410000000003', '2914.827', '2989.016', '3064.4076', '3141.0016', '3218.7963000000004',
                      '3297.7904000000003', '3377.9816', '3459.3664000000003', '3541.942', '3625.704', '3710.6476000000002',
                      '3796.7682', '3884.0597000000002', '3972.5163000000002', '4062.1305', '4152.897')
  shinyjs::hide(selector = '#tabs li a[data-value="Login"')
  shinyjs::hide(selector = '#tabs li a[data-value="Help"')
  shinyjs::hide(selector = '#tabs li a[data-value="Management"')
  shinyjs::hide(selector = '#tabs li a[data-value="Logout"')
  shinyjs::hide(selector = '#tabs li a[data-value="Admin"')

  shiny::hideTab(inputId = "tabs", target = "Login")
  shiny::hideTab(inputId = "tabs", target = "Help")
  shiny::hideTab(inputId = "tabs", target = "Management")
  shiny::hideTab(inputId = "tabs", target = "Logout")
  shiny::hideTab(inputId = "tabs", target = "Admin")

  output$TablaPermisos         <- renderDataTable({})

  output$errorMensageDelete    <- renderUI({})
  output$errorMensageAdd       <- renderUI({})
  output$errorMensageLogin     <- renderUI({})
  output$Delete1               <- renderUI({})
  output$Delete2               <- renderUI({})
  output$Add1                  <- renderUI({})
  output$Add2                  <- renderUI({})
  output$Add3                  <- renderUI({})
  output$Add4                  <- renderUI({})
  
  observeEvent(input$dir,{
    
    assign('dir', input$dir, envir = get(miUsuario))
    
  })
  
  observeEvent(input$dirBluefin,{
    
    assign('dirBluefin', input$dirBluefin, envir = get(miUsuario))
    
  })
  
  observeEvent(input$parameters,{
    
    if(input$parameters == 'Temperature'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013", #ya
                                       "MEDSEA_REANALYSIS_PHYS_006_004", #ya
                                       "MEDSEA_REANALYSIS_PHY_006_009"),selected = NULL) #ya
      
    }else if(input$parameters == 'Salinity'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013", #ya
                                       "MEDSEA_REANALYSIS_PHYS_006_004", #ya
                                       "MEDSEA_REANALYSIS_PHY_006_009"),selected = NULL) #ya
      
    }else if(input$parameters == 'Sea_Surface_Height'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013", #ya
                                       "MEDSEA_REANALYSIS_PHYS_006_004", #ya
                                       "MEDSEA_REANALYSIS_PHY_006_009"),selected = NULL) #ya
      
    }else if(input$parameters == 'Mixed_Layer_Thickness'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013"),selected = NULL)  #ya
      
   
    }else if(input$parameters == 'Chlorophyll-a'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_BIO_006_014", #ya
                                       "MEDSEA_REANALYSIS_BIO_006_008", 
                                       "OCEANCOLOUR_MED_CHL_L4_NRT_OBSERVATIONS_009_041",
                                       "OCEANCOLOUR_MED_CHL_L3_NRT_OBSERVATIONS_009_040",
                                       "OCEANCOLOUR_MED_CHL_L3_REP_OBSERVATIONS_009_073",
                                       "OCEANCOLOUR_MED_CHL_L4_REP_OBSERVATIONS_009_078",
                                       "OCEANCOLOUR_EUR_CHL_L3_NRT_OBSERVATIONS_009_050"),selected = NULL) 
      
    }else if(input$parameters == 'Zonal_Current'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013", #ya
                                       "MEDSEA_REANALYSIS_PHY_006_009"),selected = NULL) #ya
      
    }else if(input$parameters == 'Meridional_Current'){
      
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","MEDSEA_ANALYSIS_FORECAST_PHY_006_013", #ya
                                       "MEDSEA_REANALYSIS_PHY_006_009"),selected = NULL) #ya
      
    }else if(input$parameters == 'Sea_level_anomaly'){
    
      assign('name', input$parameters, envir = get(miUsuario))
      
      updateSelectInput(session,"database", label = "Database Name",
                        choices = list("","SEALEVEL_MED_PHY_L4_NRT_OBSERVATIONS_008_050", #ya
                                       "SEALEVEL_MED_PHY_L4_REP_OBSERVATIONS_008_051"),selected = NULL) #ya
      
      
    }
  })
  
  observeEvent(input$database,{
    
    if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Temperature'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'thetao', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_tem, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('monthly-mean, daily-mean, hourly-mean',
                                                           style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Salinity'){

      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'so', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_sal, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean, hourly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Sea_Surface_Height'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'zos', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_ssh, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean, hourly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Mixed_Layer_Thickness'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'mlotst', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_mld, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean, hourly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Zonal_Current'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'uo', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_cur, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean, hourly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_PHY_006_013" && input$parameters == 'Meridional_Current'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'vo', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names13_cur, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values13_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean, hourly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_ANALYSIS_FORECAST_BIO_006_014"){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'chl', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names14, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values14_2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.042 degree x 0.042 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('daily-mean',
                                                            style = 'color:blue'))}})
      
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHYS_006_004" && input$parameters == 'Temperature'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'votemper', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names04_tem, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHYS_006_004" && input$parameters == 'Salinity'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'vosaline', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names04_sal, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHYS_006_004" && input$parameters == 'Sea_Surface_Height'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'sossheig', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names04_ssh, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, daily-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHY_006_009" && input$parameters == 'Temperature'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'votemper', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_tem, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHY_006_009" && input$parameters == 'Salinity'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'vosaline', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_sal, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHY_006_009" && input$parameters == 'Zonal_Current'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'vozocrtx', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_cur, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHY_006_009" && input$parameters == 'Meridional_Current'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'vomecrty', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_cur, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_PHY_006_009" && input$parameters == 'Sea_Surface_Height'){
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'sossheig', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_ssh, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.063 degree x 0.063 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "MEDSEA_REANALYSIS_BIO_006_008"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'chl', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names08, selected = '')
      updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values1, selected = '')
      updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values2, selected = '')

      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.06 degree x 0.06 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database == "SEALEVEL_MED_PHY_L4_NRT_OBSERVATIONS_008_050" ){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'sla', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names08_50, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.125 degree x 0.125 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('irregular',
                                                            style = 'color:blue'))}})
      
       
    }else if(input$database == "SEALEVEL_MED_PHY_L4_REP_OBSERVATIONS_008_051"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'sla', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names51, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('0.125 degree x 0.125 degree',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('irregular',
                                                            style = 'color:blue'))}})
      

    }else if(input$database ==  "OCEANCOLOUR_MED_CHL_L4_NRT_OBSERVATIONS_009_041"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'CHL', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names41, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('1 km x 1 km',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('daily-mean, weekly-mean, monthly-mean',
                                                            style = 'color:blue'))}})
      
      
    }else if(input$database ==  "OCEANCOLOUR_MED_CHL_L3_NRT_OBSERVATIONS_009_040"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'CHL', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names40, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('1 km x 1 km',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('daily-mean',
                                                            style = 'color:blue'))}})
      
      
    }else if(input$database ==  "OCEANCOLOUR_MED_CHL_L3_REP_OBSERVATIONS_009_073"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'CHL', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names73, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('1 km x 1 km',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('daily-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database ==  "OCEANCOLOUR_MED_CHL_L4_REP_OBSERVATIONS_009_078"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://my.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'CHL', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names78, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('1 km x 1 km',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('monthly-mean, weekly-mean',
                                                            style = 'color:blue'))}})
      
    }else if(input$database ==  "OCEANCOLOUR_EUR_CHL_L3_NRT_OBSERVATIONS_009_050"){  
      
      assign('database', input$database, envir = get(miUsuario))
      assign('http', 'http://nrt.cmems-du.eu/motu-web/Motu', envir = get(miUsuario))
      assign('var', 'CHL', envir = get(miUsuario))
      
      updateSelectInput(session,'datasets',label = 'Dataset Name', choices = names09_50, selected = '')
      
      output$resolution <- renderUI({ expr = {helpText(div('Horizontal Resolution', style = 'color:blue; font-weight:bold'),
                                                       div('1 km x 1 km',
                                                           style = 'color:blue'))}})
      output$resolution2 <- renderUI({ expr = {helpText(div('Temporal Resolution', style = 'color:blue; font-weight:bold'),
                                                        div('daily-mean',
                                                            style = 'color:blue'))}})
      
    }
  })
  
    
   observeEvent(input$datasets,{
     
       if(input$datasets == 'sv04-med-ingv-cur-an-fc-d'){
         
        assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-cur-an-fc-h'){
     
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2018-02-19", end = NA,
                              min = "2018-02-19", max = NA)
         
         
       }else if(input$datasets == 'sv04-med-ingv-cur-an-fc-hts'){
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2015-12-31", end = NA,
                              min = "2015-12-31", max = NA)
         updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2_1, selected = '')
         updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1_2, selected = '')
         
         
       }else if(input$datasets == 'sv04-med-ingv-cur-an-fc-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-16", end = NA,
                              min = "2016-01-16", max = NA)
         
         
       }else if(input$datasets == 'sv03-med-ingv-cur-rean2-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1955-01-01", end = "2015-12-01",
                              min = "1955-01-01", max ="2015-12-01")
         
         
       }else if(input$datasets == 'sv03-med-ingv-tem-rean2-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1955-01-01", end = "2015-12-01",
                              min = "1955-01-01", max ="2015-12-01")
         
         
       }else if(input$datasets == 'sv04-med-ingv-tem-an-fc-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-tem-an-fc-h'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2018-02-19", end = NA,
                              min = "2018-02-19", max = NA)
         
         
       }else if(input$datasets == 'sv04-med-ingv-tem-an-fc-hts'){
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2015-12-31", end = NA,
                              min = "2015-12-31", max = NA)
         updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2_1, selected = '')
         updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1_2, selected = '')
         
         
       }else if(input$datasets == 'sv04-med-ingv-tem-an-fc-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-16", end = NA,
                              min = "2016-01-16", max = NA)
         
         
       }else if(input$datasets == 'sv03-med-ingv-tem-rean-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
         
       }else if(input$datasets == 'sv03-med-ingv-tem-rean-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
         
       }else if(input$datasets == 'sv04-med-ingv-sal-an-fc-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-sal-an-fc-h'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2018-02-19", end = NA,
                              min = "2018-02-19", max = NA)
         
         
       }else if(input$datasets == 'sv04-med-ingv-sal-an-fc-hts'){
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2015-12-31", end = NA,
                              min = "2015-12-31", max = NA)
         updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2_1, selected = '')
         updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1_2, selected = '')
         
         
       }else if(input$datasets == 'sv04-med-ingv-sal-an-fc-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-16", end = NA,
                              min = "2016-01-16", max = NA)
         
         
       }else if(input$datasets == 'sv03-med-ingv-sal-rean2-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1955-01-01", end = "2015-12-01",
                              min = "1955-01-01", max ="2015-12-01")
         
         
       }else if(input$datasets == 'sv03-med-ingv-sal-rean-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
         
       }else if(input$datasets == 'sv03-med-ingv-sal-rean-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
         
       }else if(input$datasets == 'sv04-med-ingv-ssh-an-fc-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-ssh-an-fc-h'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2018-02-19", end = NA,
                              min = "2018-02-19", max = NA)
         
         
       }else if(input$datasets == 'sv04-med-ingv-ssh-an-fc-hts'){
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2015-12-31", end = NA,
                              min = "2015-12-31", max = NA)
         updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2_1, selected = '')
         updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1_2, selected = '')
         
         
       }else if(input$datasets == 'sv04-med-ingv-ssh-an-fc-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-16", end = NA,
                              min = "2016-01-16", max = NA)
         
         
       }else if(input$datasets == 'sv03-med-ingv-ssh-rean2-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1955-01-01", end = "2015-12-01",
                              min = "1955-01-01", max ="2015-12-01")
         
         
       }else if(input$datasets == 'sv03-med-ingv-ssh-rean-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
       }else if(input$datasets == 'sv03-med-ingv-ssh-rean-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1987-01-01", end = "2016-12-01",
                              min = "1987-01-01", max = "2016-12-01")
         
       }else if(input$datasets == 'dataset-duacs-nrt-medsea-merged-allsat-phy-l4'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-07", end = NA,
                              min = "2017-01-07", max = NA)
         
       }else if(input$datasets == 'dataset-duacs-rep-medsea-merged-allsat-phy-l4'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1993-01-01", end = "2018-01-18",
                              min = "1993-01-01", max = "2018-01-18")
         
       }else if(input$datasets == 'sv04-med-ingv-mld-an-fc-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-mld-an-fc-h'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2018-02-19", end = NA,
                              min = "2018-02-19", max = NA)
         
       }else if(input$datasets == 'sv04-med-ingv-mld-an-fc-hts'){
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2015-12-31", end = NA,
                              min = "2015-12-31", max = NA)
         updateSelectInput(session,'depmax',label = 'Depth max', choices = depth_values13_2_1, selected = '')
         updateSelectInput(session,'depmin',label = 'Depth min', choices = depth_values14_1_2, selected = '')
         
       }else if(input$datasets == 'sv04-med-ingv-mld-an-fc-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-16", end = NA,
                              min = "2016-01-16", max = NA)
         
       }else if(input$datasets == 'sv03-med-ogs-pft-an-fc-d'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-01-01", end = NA,
                              min = "2016-01-01", max = NA)
         
       }else if(input$datasets == 'sv03-med-ogs-pft-rean-m'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1999-01-01", end = "2016-12-01",
                              min = "1999-01-01", max = "2016-12-01")
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi-l4-chl_1km_8days-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-01", end = NA,
                              min = "2017-01-01", max = NA)
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi-l4-chl_1km_monthly-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-01", end = NA,
                              min = "2017-01-01", max = "2018-07-01")
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi-l4-interp_1km_daily-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-01", end = NA,
                              min = "2017-01-01", max = NA)
         
       }else if(input$datasets == 'dataset-oc-med-chl-olci_a-l4-chl_1km_8days-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-04-22", end = "2018-07-20",
                              min = "2016-04-22", max = "2018-07-20")
         
       }else if(input$datasets == 'dataset-oc-med-chl-olci_a-l4-chl_1km_monthly-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-04-01", end = "2018-07-01",
                              min = "2016-04-01", max = "2018-07-01")
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi-l3-chl_1km_daily-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-01", end = NA,
                              min = "2017-01-01", max = NA)
         
       }else if(input$datasets == 'dataset-oc-med-chl-olci_a-l3-chl_1km_daily-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2016-04-26", end = NA,
                              min = "2016-04-26", max = NA)
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi_cci-l3-chl_1km_daily-rep-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1997-09-04", end = '2016-12-31',
                              min = "1997-09-04", max = '2016-12-31')
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi_cci-l4-chl_1km_8days-rep-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1997-09-14", end = '2016-12-26',
                              min = "1997-09-14", max = '2016-12-26')
         
       }else if(input$datasets == 'dataset-oc-med-chl-multi_cci-l4-chl_1km_monthly-rep-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "1997-09-01", end = '2016-12-01',
                              min = "1997-09-01", max = '2016-12-01')
         
       }else if(input$datasets == 'dataset-oc-eur-chl-multi-l3-chl_1km_daily-rt-v02'){
         
         assign('dataset', input$datasets, envir = get(miUsuario))
         
         updateDateRangeInput(session,"dates",label = "Temporal Coverage",start = "2017-01-01", end = NA,
                              min = "2017-01-01", max = NA)
         
       }
     })
   
   
  
  observeEvent(input$dates,{
    
    assign('dates', input$dates, envir = get(miUsuario))
    
  })
  
  observeEvent(input$datesBF,{
    
    assign('datesBF', input$datesBF, envir = get(miUsuario))
    
  })
  
  observeEvent(input$longmin,{
    
    assign('longmin', input$longmin, envir = get(miUsuario))
    
  })
  
  observeEvent(input$longmax,{
    
    assign('longmax', input$longmax, envir = get(miUsuario))
    
  })
  
  observeEvent(input$latmin,{
    
    assign('latmin', input$latmin, envir = get(miUsuario))
    
  })
  
  observeEvent(input$latmax,{
    
    assign('latmax', input$latmax, envir = get(miUsuario))
    
  })
  
  observeEvent(input$depmin,{
    
    assign('depmin', input$depmin, envir = get(miUsuario))
    
  })
  
  observeEvent(input$depmax,{
    
    assign('depmax', input$depmax, envir = get(miUsuario))
    
  })
  
  observeEvent(input$CoperUser,{
    
    assign('CoperUser', input$CoperUser, envir = get(miUsuario))
    
  })
  
  observeEvent(input$CoperPass,{
    
    assign('CoperPass', input$CoperPass, envir = get(miUsuario))
    
  })
  
  observeEvent(input$load1,{
    
    library(doParallel)
    library(foreach)
    
    longdir<-length(get('dir', envir = get(miUsuario))$path)
    assign('longdir',longdir, envir = get(miUsuario))
    
    unpath<-paste(get('dir', envir = get(miUsuario))$path[2:as.numeric(longdir)],collapse = '/')
    assign('unpath',unpath, envir = get(miUsuario))
    
    namefile<- paste(get('dates',envir = get(miUsuario))[1],'_to_',get('dates',envir = get(miUsuario))[2],'_',get('name',envir = get(miUsuario)),'.nc',sep="")
    assign('namefile',namefile, envir = get(miUsuario))
    
    if (get('depmax', envir = get(miUsuario)) == '' || get('depmin', envir = get(miUsuario)) == ''){
      
      downfile=function(CoperUser,CoperPass,dataset,longmin,longmax,latmin,latmax,dates,dir){
        
        rm(mycom0)
        
        mycom0=paste('/Python27/python /motu-client-python/motu-client.py --noisy --verbose --user ',get('CoperUser',envir = get(miUsuario)),' --pwd ',get('CoperPass',envir = get(miUsuario)),' --motu ',get('http',envir = get(miUsuario)),' --service-id ',get('database',envir = get(miUsuario)), '-TDS --product-id ',get('dataset',envir = get(miUsuario)),' --longitude-min ',get('longmin',envir = get(miUsuario)),' --longitude-max ',get('longmax',envir = get(miUsuario)),' --latitude-min ',get('latmin',envir = get(miUsuario)),' --latitude-max ',get('latmax',envir = get(miUsuario)),' --date-min ',get('dates',envir = get(miUsuario))[1],' 12:30:00 --date-max ',get('dates',envir = get(miUsuario))[2],' 11:30:00 --variable ',get('var',envir = get(miUsuario)),' --out-dir ',paste('/',get('unpath',envir = get(miUsuario)),'/',sep = ''),' --out-name ',get('dates',envir = get(miUsuario))[1],'_to_',get('dates',envir = get(miUsuario))[2],'_',get('name',envir = get(miUsuario)),'.nc',sep="") 
        cat(paste('\n ',mycom0,sep = ''))
        rm(mycom1)
        mycom1=strwrap(mycom0,width=10000, simplify=TRUE)
        system(mycom1)
        
      }
      
      UseCores <- detectCores() -1
      cl       <- makeCluster(UseCores)
      registerDoParallel(cl)
      rasterOptions(maxmemory=1e+09)
      if(file.exists(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefile',envir = get(miUsuario)),sep = ''))){
        showNotification('The file already exists in selected working directory; please, check it')
      }else{
        downfile(CoperUser,CoperPass,dataset,longmin,longmax,latmin,latmax,dates,dir)
      }
      
      stopCluster(cl)
      
    }else{
    
    downfile=function(CoperUser,CoperPass,dataset,longmin,longmax,latmin,latmax,dates,depmin,depmax,dir){
      
      rm(mycom0)
      
      mycom0=paste('/Python27/python /motu-client-python/motu-client.py --noisy --verbose --user ',get('CoperUser',envir = get(miUsuario)),' --pwd ',get('CoperPass',envir = get(miUsuario)),' --motu ',get('http',envir = get(miUsuario)),' --service-id ',get('database',envir = get(miUsuario)), '-TDS --product-id ',get('dataset',envir = get(miUsuario)),' --longitude-min ',get('longmin',envir = get(miUsuario)),' --longitude-max ',get('longmax',envir = get(miUsuario)),' --latitude-min ',get('latmin',envir = get(miUsuario)),' --latitude-max ',get('latmax',envir = get(miUsuario)),' --date-min ',get('dates',envir = get(miUsuario))[1],' 12:30:00 --date-max ',get('dates',envir = get(miUsuario))[2],' 11:30:00 --depth-min ',get('depmin',envir = get(miUsuario)),' --depth-max ',get('depmax',envir = get(miUsuario)),' --variable ',get('var',envir = get(miUsuario)),' --out-dir ',paste('/',get('unpath',envir = get(miUsuario)),'/',sep = ''),' --out-name ',get('dates',envir = get(miUsuario))[1],'_to_',get('dates',envir = get(miUsuario))[2],'_',get('name',envir = get(miUsuario)),'.nc',sep="") 
      cat(paste('\n ',mycom0,sep = ''))
      rm(mycom1)
      mycom1=strwrap(mycom0,width=10000, simplify=TRUE)
      system(mycom1)

    }
    
    UseCores <- detectCores() -1
    cl       <- makeCluster(UseCores)
    registerDoParallel(cl)
    rasterOptions(maxmemory=1e+09)
    if(file.exists(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefile',envir = get(miUsuario)),sep = ''))){
      
      showNotification('The file already exists in selected working directory; please, check it')
      
    }else{
      
      downfile(CoperUser,CoperPass,dataset,longmin,longmax,latmin,latmax,dates,depmin,depmax,dir)
      
    }
    
    stopCluster(cl)
    
    }
    
    if(!file.exists(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefile',envir = get(miUsuario)),sep = ''))){ ##Caso1: Si no se ha introducido datapath
      
      shiny::hideTab(inputId = "tabs", target = "Summary")
      shiny::hideTab(inputId = "tabs", target = "Plots")
      shiny::hideTab(inputId = "tabs", target = "Bluefin")
      shinyjs::hide(selector = '#tabs li a[data-value="Summary"')
      shinyjs::hide(selector = '#tabs li a[data-value="Plots"')
      shinyjs::hide(selector = '#tabs li a[data-value="Bluefin"')
      shinyjs::alert("Error to download data. Check your selection or try later.")
      
    }else{
     
      shiny::showTab(inputId = "tabs", target = "Summary")
      shiny::showTab(inputId = "tabs", target = "Plots")
      shiny::showTab(inputId = "tabs", target = "Bluefin")
      shinyjs::show(selector = '#tabs li a[data-value="Summary"')
      shinyjs::show(selector = '#tabs li a[data-value="Plots"')
      shinyjs::show(selector = '#tabs li a[data-value="Bluefin"')
      shinyjs::alert("Downloaded data OK.")
      
    }
  })
  
  observeEvent(input$fechaplot,{
    
    assign('fechaplot',input$fechaplot,envir = get(miUsuario))
    
  })
  
  observeEvent(input$showPlot,{
    
    for(i in 1:length(get('fechas',envir = get(miUsuario)))){
      
      if(get('fechaplot',envir = get(miUsuario)) == get('fechas',envir = get(miUsuario))[i]){
        
        assign('m',i,envir = get(miUsuario))
        
      }
      
    }

    #lectura del archivo .nc
    nc=nc_open(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefile',envir = get(miUsuario)),sep = ''))
    assign('nc',nc, envir = get(miUsuario))
    
    #obtencion variables-latitud
    namevariable <- names(nc[['var']])
    names<-names(nc[['dim']])
    
    if('latitude' %in% names){
      
      lat = ncvar_get( nc, "latitude") 
      
    }else{
      
      lat = ncvar_get( nc, "lat") 
      
    }
    
    assign('lat',lat, envir = get(miUsuario))
    
    if('longitude' %in% names){
      
      lon = ncvar_get( nc, "longitude")
      
    }else{
      
      lon = ncvar_get( nc, "lon")

    }
    
    assign('lon',lon, envir = get(miUsuario))
    
    #obtencion variables-tiempo
    time=ncvar_get( nc, "time")
    assign('time',time, envir = get(miUsuario))
    
    #obtencion nombre variable del archivo
    var_name = names(nc$var)
    assign('var_name',var_name, envir = get(miUsuario))
    var.array <- ncvar_get(nc, var_name)

    #seleccion periodo de tiempo
    
    if(dim(time)>1){
      
      var.slice <- var.array[,,as.integer(get('m',envir = get(miUsuario)))]
      
    }else{
      
      var.slice <- var.array[,]
      
    }
    
    assign('var.slice',var.slice, envir = get(miUsuario))

    #trasposicion variable
    m2 <- t(var.slice)[nrow(t(var.slice)):1,]
    assign('m2',m2, envir = get(miUsuario))
    
    #creacion raster
    r <- raster(m2, xmn=get('longmin',envir = get(miUsuario)), xmx=get('longmax',envir = get(miUsuario)),
                ymn=get('latmin',envir = get(miUsuario)),ymx=get('latmax',envir = get(miUsuario)),crs="+proj=longlat +datum=WGS84")
    assign('r',r, envir = get(miUsuario))
    
    #lectura mapa contornos
    coastline <- readShapePoly("country.shp")
    assign('coastline',coastline, envir = get(miUsuario))
    
    #calculo logaritmo del raster
    r2=log(r)
    assign('r2',r2, envir = get(miUsuario))
    
    #limitacion raster
    e <- extent(get('longmin',envir = get(miUsuario)), get('longmax',envir = get(miUsuario)),
                get('latmin',envir = get(miUsuario)),get('latmax',envir = get(miUsuario)))
    assign('e',e, envir = get(miUsuario))
    
    #recorte raster segun limitacion
    rc <- crop(r, e)
    assign('rc',rc, envir = get(miUsuario))
    
    #calculo logaritmo raster limitado
    if(get('minvar', envir = get(miUsuario)) < 0 || get('maxvar', envir = get(miUsuario)) < 0){
      logr=rc
    }else{
      logr=log(rc)
    }
    
    assign('logr',logr, envir = get(miUsuario))
    
    #numero de valores indicados en la leyenda del grafico
    ntics=5
    assign('ntics',ntics, envir = get(miUsuario))
    
    #rango de la leyenda
    r2.range=c(minValue(logr), maxValue(logr))
    assign('r2.range',r2.range, envir = get(miUsuario))
    

    
    if(r2.range[1]==-Inf || is.na(r2.range[1])){
      
      r2.range[1]= get('minvar',envir = get(miUsuario))
      
    }
    if(r2.range[2]==Inf  || is.na(r2.range[2])){
      
      r2.range[2]= get('maxvar',envir = get(miUsuario))
      
    }
      
    labelplaces=seq(r2.range[1], r2.range[2],length.out=ntics)
    
    
    #posicion puntos leyenda
    labelplaces[1]=labelplaces[1]+0.1
    labelplaces[ntics]=labelplaces[ntics]-0.1 
    assign('labelplaces',labelplaces, envir = get(miUsuario))
    
    #valores leyenda
    labelvals <- round(2.718^labelplaces,digits=3)
    labelvals[ntics]=round(labelvals[ntics]-(labelvals[ntics]*0.001),digits=3)
    assign('labelvals',labelvals, envir = get(miUsuario))
    
    output$plot1 <-renderPlot(plot(logr, legend.only=FALSE, main = 'plot', col=tim.colors(64),legend.width=1, legend.shrink=0.75,
                                   axis.args=list(at=labelplaces, labels=labelvals, cex.axis=1),
                                   legend.args=list(text='', side=4, font=2, line=2.5, cex=0.8))
    )

  })
  
  observeEvent(input$summary,{

    fechas = seq(as.Date(get('dates',envir = get(miUsuario))[1]), as.Date(get('dates',envir = get(miUsuario))[2]), by=1)
    assign('fechas',fechas, envir = get(miUsuario))
    
    #lectura del archivo .nc
    nc=nc_open(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefile',envir = get(miUsuario)),sep = ''))
    assign('nc',nc, envir = get(miUsuario))
    
    #obtencion variables-latitud
    namevariable <- names(nc[['var']])
    names<-names(nc[['dim']])
    
    if('latitude' %in% names){
      
      lat = ncvar_get( nc, "latitude") 
      
    }else{
      
      lat = ncvar_get( nc, "lat")
      
    }
    
    assign('lat',lat, envir = get(miUsuario))
    
    if('longitude' %in% names){
      
      lon = ncvar_get( nc, "longitude") 
      
    }else{
      
      lon = ncvar_get( nc, "lon")
      
    }
    
    assign('lon',lon, envir = get(miUsuario))
    
    #obtencion variables-tiempo
    time=ncvar_get( nc, "time")
    assign('time',time, envir = get(miUsuario))
    
    #obtencion nombre variable del archivo
    var_name = names(nc$var)
    assign('var_name',var_name, envir = get(miUsuario))
    
    #obtencion variable para 1 unidad de tiempo
    varfile = ncvar_get(nc,paste(var_name))
    assign('varfile',varfile, envir = get(miUsuario))
    
    #valor maximo variable en todo el archivo sin NA's
    maxvar<-max(varfile,na.rm = TRUE)
    assign('maxvar',maxvar, envir = get(miUsuario))
    
    #valor minimo variable en todo el archivo sin NA's
    minvar<-min(varfile,na.rm = TRUE)
    assign('minvar',minvar, envir = get(miUsuario))
    
    #valor medio variable en todo el archivo sin NA's
    meanvar<-mean(varfile,na.rm = TRUE)
    assign('meanvar',meanvar, envir = get(miUsuario))
    
    output$maxvar <- renderUI({ expr = {helpText(div('Max value of variable:', style = 'color:blue; font-weight:bold'),
                                                      div(paste(maxvar),style = 'color:blue'))}})
    output$minvar <- renderUI({ expr = {helpText(div('Min value of variable:', style = 'color:blue; font-weight:bold'),
                                                 div(paste(minvar),style = 'color:blue'))}})
    output$meanvar <- renderUI({ expr = {helpText(div('Mean value of variable:', style = 'color:blue; font-weight:bold'),
                                                 div(paste(meanvar),style = 'color:blue'))}})

    #atributos de variable tiempo, unidades
    time_units <- ncatt_get(nc, "time", "units")
    assign('time_units',time_units, envir = get(miUsuario))
    
    #atributos de variable
    varLongName <- ncatt_get(nc, var_name, "long_name")
    assign('varLongName',varLongName, envir = get(miUsuario))
    varUnits <- ncatt_get(nc, var_name, "units")
    assign('varUnits',varUnits, envir = get(miUsuario))
    
    #obtencion valor que sustituye a NA's
    fillvalue <- ncatt_get(nc, var_name, "_FillValue")
    
    #separacion unidades tiempo
    tustr <- strsplit(time_units$value, " ")
    assign('tustr',tustr, envir = get(miUsuario))
    tdstr <- strsplit(unlist(tustr)[3], "-")
    assign('tdstr',tdstr, envir = get(miUsuario))
    
    #obtencion anio, mes y dia
    tyear = as.integer(unlist(tdstr)[1])
    assign('tyear',tyear, envir = get(miUsuario))
    tmonth = as.integer(unlist(tdstr)[2])
    assign('tmonth',tmonth, envir = get(miUsuario))
    tday = as.integer(unlist(tdstr)[3])
    assign('tday',tday, envir = get(miUsuario))
    
    #Asignacion valores nulos a NA's
    varfile[varfile == fillvalue$value] <- NA
    assign('varfile',varfile, envir = get(miUsuario))
    
    #seleccion periodo de tiempo
    assign('m',input$fechaplot,envir = get(miUsuario))
    
    if(dim(time)>1){
    
      var.slice <- varfile[,,as.integer(get('m',envir = get(miUsuario)))]
    
    }else{
    
      var.slice <- varfile[,]
    
    }
    
    assign('var.slice',var.slice, envir = get(miUsuario))
    
    #creacion data.frame longitud-latitud
    grid <- expand.grid(lon = lon, lat = lat)
    assign('grid',grid, envir = get(miUsuario))
    
    #transformacion en vector para todo el tiempo
    var.vec.long <- as.vector(varfile)
    assign('var.vec.long',var.vec.long, envir = get(miUsuario))
    
    #creacion matriz para todo el tiempo
    var.mat <- matrix(var.vec.long, nrow = dim(lon) * dim(lat), ncol = length(fechas))
    assign('var.mat',var.mat, envir = get(miUsuario))
    
    #union en data.frame de todo el archivo y data.frame longitud-latitud
    var.df02 <- data.frame(cbind(grid, var.mat))
    assign('var.df02',var.df02, envir = get(miUsuario))
    
    #renombrar columnas data.frame de todo el tiempo
    names(var.df02) <- c("lon", "lat", paste(fechas))
    
    #creacion columnas max, min y mean en el data.frame para todo el tiempo
    var.df02$max <- apply(var.df02[3:(length(fechas)+2)], 1, max)  
    var.df02$min <- apply(var.df02[3:(length(fechas)+2)], 1, min)  
    var.df02$mean <- apply(var.df02[3:(length(fechas)+2)], 1, mean)
    
    #eliminar NA's del dataframe de todo el tiempo
    var_df2<-na.omit(var.df02)
    assign('var_df2',var_df2, envir = get(miUsuario))
    
    output$tabla2 = DT::renderDataTable({
      
      datatable(var_df2, filter = 'top',selection="multiple", escape=FALSE,
                options = list(columnDefs = list(list(className = 'dt-center', targets = 1:2)),
                               lengthMenu = {c(10,20,30,40,50,100);c(10,20,30,40,50,100)},
                               sDom  = '<"top">lrt<"bottom">ip'))
      
    })
  })

  observeEvent(input$bluefinFecha,{
    
    assign('bluefinFecha', as.Date(input$bluefinFecha), envir = get(miUsuario))
    
  })
    
  observeEvent(input$bluefinProd,{

    longdir<-length(get('dir', envir = get(miUsuario))$path)
    assign('longdir',longdir, envir = get(miUsuario))
    fechas = seq(as.Date(get('dates',envir = get(miUsuario))[1]), as.Date(get('dates',envir = get(miUsuario))[2]), by=1)
    fechasBF = seq(as.Date(get('datesBF',envir = get(miUsuario))[1]), as.Date(get('datesBF',envir = get(miUsuario))[2]), by=1)
    assign('fechas',fechas, envir = get(miUsuario))
    assign('fechasBF',fechasBF, envir = get(miUsuario))
    unpath<-paste(get('dir', envir = get(miUsuario))$path[2:as.numeric(longdir)],collapse = '/')
    assign('unpath',unpath, envir = get(miUsuario))
    namefil<- paste(get('fechas',envir = get(miUsuario))[1],'_',get('name',envir = get(miUsuario)),'.nc',sep="")
    assign('namefil',namefil, envir = get(miUsuario))
    
    if(file.exists(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefil',envir = get(miUsuario)),sep = ''))){
    
      showNotification('The file already exists in selected working directory; please, check it')
    
    }else{
    
      repeat{
        
        for(i in 1:length(get('fechas',envir = get(miUsuario)))){
          
        assign('m',i,envir = get(miUsuario))
        namefileOriginal<- paste(get('dates',envir = get(miUsuario))[1],'_to_',get('dates',envir = get(miUsuario))[2],'_',get('name',envir = get(miUsuario)),'.nc',sep="")
        assign('namefileOriginal',namefileOriginal,envir = get(miUsuario))
        namefil<- paste(get('fechas',envir = get(miUsuario))[i],'_',get('name',envir = get(miUsuario)),'.nc',sep="")
        assign('namefil',namefil,envir = get(miUsuario))
        showNotification(paste('Generating file: ',namefil))
        
        #lectura del archivo .nc
        nc=nc_open(paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefileOriginal',envir = get(miUsuario)),sep = ''))
        assign('nc',nc, envir = get(miUsuario))
        
        #obtencion variables-latitud
        namevariable <- names(nc[['var']])
        names<-names(nc[['dim']])
        
        if('latitude' %in% names){
        
          lat = ncvar_get( nc, "latitude") 
        
        }else{
        
          lat = ncvar_get( nc, "lat") 
        
        }
        
        assign('lat',lat, envir = get(miUsuario))
        
        if('longitude' %in% names){
          
          lon = ncvar_get( nc, "longitude") 
        
        }else{
        
          lon = ncvar_get( nc, "lon")
        
        }
        
        assign('lon',lon, envir = get(miUsuario))
        
        #obtencion variables-tiempo
        time=ncvar_get( nc, "time")
        assign('time',time, envir = get(miUsuario))
        
        #obtencion nombre variable del archivo
        var_name = names(nc$var)
        assign('var_name',var_name, envir = get(miUsuario))
        var.array <- ncvar_get(nc, var_name)
        
        #seleccion periodo de tiempo
        if(dim(time)>1){
          
          var.slice <- var.array[,,as.integer(get('m',envir = get(miUsuario)))]
        
        }else{
        
          var.slice <- var.array[,]
        
        }
        
        assign('var.slice',var.slice, envir = get(miUsuario))
        
        #trasposicion variable
        m2 <- t(var.slice)[nrow(t(var.slice)):1,]
        assign('m2',m2, envir = get(miUsuario))
        
        #creacion raster
        r <- raster(m2, xmn=get('longmin',envir = get(miUsuario)), xmx=get('longmax',envir = get(miUsuario)),
                    ymn=get('latmin',envir = get(miUsuario)),ymx=get('latmax',envir = get(miUsuario)),crs="+proj=longlat +datum=WGS84")

        writeRaster(r, filename=paste('/',get('unpath',envir = get(miUsuario)),'/',get('namefil',envir = get(miUsuario)),sep = ''),varname=paste(get('name',envir = get(miUsuario))),NAflag=-1000,longname=paste(get('name',envir = get(miUsuario))) ,format="CDF")
        nc_close(nc)
        
        }
        
        if(i == length(get('fechas',envir = get(miUsuario)))){
          
          break
          
        }
      }
      
      for(i in 1:length(get('fechasBF',envir = get(miUsuario)))){

        namefil2<- paste(get('fechasBF',envir = get(miUsuario))[i],'_',get('name',envir = get(miUsuario)),'.png',sep="")
        showNotification(paste('Generating file: ',namefil2))
        directoryBluefin<-paste('/',get('unpath',envir = get(miUsuario)),'/',sep = '')
        assign('directoryBluefin',directoryBluefin, envir = get(miUsuario))
        mydate<-get('fechasBF', envir = get(miUsuario))[i]
        assign('mydate', mydate, envir = get(miUsuario))

      source("/socibAPP/chlamyoceantorasterv4.R")
      
      rangoBluefin<-paste(get('fechasBF',envir = get(miUsuario))[i])
      
      outncname=paste(get('directoryBluefin',envir = get(miUsuario)),rangoBluefin,'_',get('name',envir = get(miUsuario)),"_BF.nc",sep="")
      
      fecha0=format(mydate, format="%Y-%m-%d")
      fecha1=format(mydate+1, format="%Y-%m-%d")
      fecha2=format(mydate+2, format="%Y-%m-%d")
      fecha3=format(mydate+3, format="%Y-%m-%d")
      fecha4=format(mydate+4, format="%Y-%m-%d")
      fecha5=format(mydate+5, format="%Y-%m-%d")
      fecha6=format(mydate+6, format="%Y-%m-%d")
      
      nc0=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha0,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc1=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha1,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc2=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha2,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc3=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha3,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc4=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha4,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc5=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha5,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      nc6=paste('/',get('unpath',envir = get(miUsuario)),'/',fecha6,'_',get('name',envir = get(miUsuario)),'.nc',sep="")
      
      var0=try(chlamyoceantoraster(nc0))
      var1=try(chlamyoceantoraster(nc1))
      var2=try(chlamyoceantoraster(nc2))
      var3=try(chlamyoceantoraster(nc3))
      var4=try(chlamyoceantoraster(nc4))
      var5=try(chlamyoceantoraster(nc5))

      if(file.exists(nc6)){
        
        var6=try(chlamyoceantoraster(nc6))
        imagelist=list(var0,var1,var2,var3,var4,var5,var6)
        
        mystack=stack(var0,var1,var2,var3,var4,var5,var6)
        weekly=mean(mystack,na.rm=TRUE)
        weekly[weekly==0]=NA
        
        e <- extent(get('longmin',envir = get(miUsuario)), get('longmax',envir = get(miUsuario)),
                    get('latmin',envir = get(miUsuario)),get('latmax',envir = get(miUsuario)))
        rc <- crop(weekly, e)
        
        logr=log(rc)
        ntics=5
        assign('ntics',ntics, envir = get(miUsuario))
        
        #rango de la leyenda
        r2.range=c(minValue(logr), maxValue(logr))
        assign('r2.range',r2.range, envir = get(miUsuario))
        
        #posicion puntos leyenda
        labelplaces=seq(r2.range[1], r2.range[2],length.out=ntics)
        labelplaces[1]=labelplaces[1]+0.1
        labelplaces[ntics]=labelplaces[ntics]-0.1 
        assign('labelplaces',labelplaces, envir = get(miUsuario))
        
        #valores leyenda
        labelvals <- round(2.718^labelplaces,digits=3)
        labelvals[ntics]=round(labelvals[ntics]-(labelvals[ntics]*0.001),digits=3)
        assign('labelvals',labelvals, envir = get(miUsuario))
        
        output$plot2 <-renderPlot(plot(logr, legend.only=FALSE, main = 'plot', col=tim.colors(64),legend.width=1, legend.shrink=0.75,
                                       axis.args=list(at=labelplaces, labels=labelvals, cex.axis=1),
                                       legend.args=list(text='', side=4, font=2, line=2.5, cex=0.8))
        )

        png(paste('/',get('unpath',envir = get(miUsuario)),'/',get('fechas',envir = get(miUsuario))[i],'_',get('name',envir = get(miUsuario)),"_BF.png",sep=""))
        plot(logr,useRaster=TRUE,xlim=range(get('longmin',envir = get(miUsuario)),get('longmax',envir = get(miUsuario))),
             ylim=range(get('latmin',envir = get(miUsuario)),get('latmax',envir = get(miUsuario))), col=tim.colors(64),
             axes=TRUE, main=paste(get('fechas',envir = get(miUsuario))[i],'_',get('name',envir = get(miUsuario)),"_BF",sep=""),legend=FALSE, las=0.1)
        ntics=5
        r2.range=c(minValue(logr), maxValue(logr))
        labelplaces=seq(r2.range[1], r2.range[2],length.out=ntics)
        labelplaces[ntics]    =(labelplaces[ntics]-labelplaces[ntics]*0.001)
        labelvals <- round(10^labelplaces,digits=3)
        labelvals[ntics]=round(labelvals[ntics]-(labelvals[ntics]*0.001),digits=3)
        plot(logr, legend.only=TRUE, col=tim.colors(64),
             legend.width=1, legend.shrink=0.75,
             axis.args=list(at=labelplaces, labels=labelvals, cex.axis=1),legend.args=list(text='', side=4, font=2, line=2.5, cex=0.8))
        dev.off()
        
        writeRaster(weekly, filename=outncname,varname=paste(get('name',envir = get(miUsuario))),NAflag=-1000,longname=paste(get('name',envir = get(miUsuario)),"_weekly",sep = '') ,format="CDF")
        
      }else{
        
        break
        
      }
      
    }
}
    
  })
  
  observeEvent(input$continue_a,{
    
    fechas = seq(as.Date(get('dates',envir = get(miUsuario))[1]), as.Date(get('dates',envir = get(miUsuario))[2]), by=1)
    assign('fechas',fechas, envir = get(miUsuario))
    updateSelectInput(session, 'fechaplot',choices = paste(get('fechas',envir = get(miUsuario))))
    updateTabsetPanel(session, "tabs",selected = "Summary")
    
  })
  
  observeEvent(input$continue_b,{
    
    shiny::showTab(inputId = "tabs", target = "Plots")
    shinyjs::show(selector = '#tabs li a[data-value="Plots"')
    updateTabsetPanel(session, "tabs",selected = "Plots")
    
  })
  
  observeEvent(input$continue_c,{
    
    shiny::showTab(inputId = "tabs", target = "Bluefin")
    shinyjs::show(selector = '#tabs li a[data-value="Bluefin"')
    updateTabsetPanel(session, "tabs",selected = "Bluefin")
    
  })

  observeEvent(input$welcome,{
    
    shiny::hideTab(inputId = "tabs", target = "Start")
    
    shinyjs::hide(selector = '#tabs li a[data-value="Start"')
    
    shiny::showTab(inputId = "tabs", target = "Login")
    
    shinyjs::show(selector = '#tabs li a[data-value="Login"')
    
    updateNavbarPage(session, "tabs",selected = "Login")
    
  })
  
  observeEvent(input$DeleteuserUI,   {
    
    output$errorMensageDelete <- renderUI({}) 
    
  })
  
  observeEvent(input$AddUserUI,      {
    
    output$errorMensageAdd    <- renderUI({}) 
    
  })
  
  observeEvent(input$AddPasswordUI,  {
    
    output$errorMensageAdd    <- renderUI({}) 
    
  })
  
  observeEvent(input$userUI,         {
    
    output$errorMensageLogin  <- renderUI({})
    
  })
  
  observeEvent(input$passwordUI,     {
    
    output$errorMensageLogin  <- renderUI({})
    
  })
  
  observeEvent(input$AddUser,        {
    
    assign('newusername',     input$AddUserUI,     envir = get(miUsuario))
    assign('newuserAdmin',    input$AddUser_Admin, envir = get(miUsuario))
    assign('newuserPassword', input$AddPasswordUI, envir = get(miUsuario))
    
    tryCatch(source("add.R",local =get(miUsuario) ),error = function(e) {
      
      output$errorMensageAdd <- renderUI( expr =helpText(div('Compruebe los datos', style = 'color:white'))) 
      
    })
    
    if(get("tipoErrorAdd",      envir = get(miUsuario))==1){
      
      output$errorMensageAdd <- renderUI({expr =helpText(div('usuario repetido',                                 style ='color:red'))})
      
    }else if(get("tipoErrorAdd",envir = get(miUsuario))==2){
      
      output$errorMensageAdd <- renderUI({expr =helpText(div('usuario o contraseña vacío',                       style ='color:red'))})
      
    }else if(get("tipoErrorAdd",envir = get(miUsuario))==3){
      
      output$errorMensageAdd <- renderUI({expr =helpText(div('usuario o contraseña contiene espacios en blanco', style ='color:red'))})
      
    }else{
      
      output$errorMensageAdd <- renderUI({})
      output$TablaPermisos   <- renderDataTable ({get("tabla",envir = get(miUsuario))})
      
      updateTextInput(session,    "AddUserUI",     value = "")
      updateTextInput(session,    "AddPasswordUI", value = "")
      updateCheckboxInput(session,"AddUser_Admin", value = FALSE)
      
    }
    
  })
  
  observeEvent(input$deleteUser,     {
    
    assign('olduser', input$DeleteuserUI, envir = get(miUsuario))
    
    tryCatch(source("delete.R",local = get(miUsuario)),error = function(e) {
      
      output$errorMensageDelete <- renderUI( expr =helpText(div('Compruebe los datos', style ='color:white'))) 
      
    })
    
    if(get("tipoErrorDelete",envir = get(miUsuario))==1){
      
      output$errorMensageDelete <- renderUI({expr =helpText(div('usuario no existe', style = 'color:red'))})
      
    }else{
      
      output$errorMensageDelete <- renderUI({})
      output$TablaPermisos      <- renderDataTable ({get("tabla",envir = get(miUsuario))})
      
      updateTextInput(session, "DeleteuserUI", value = "")
    }
    
  })
  
  observeEvent(input$login,          {
    
    assign('user',     input$userUI,     envir = get(miUsuario))
    assign('password', input$passwordUI, envir = get(miUsuario))

    tryCatch(source("login.R",local = get(miUsuario)),error = function(e) {
      
      output$errorMensageLogin <- renderUI( expr =helpText(div('Verifique datos', style ='color:white'))) 
      
    })
    
    if(get("loginCorrect",envir = get(miUsuario))==TRUE){
      
      output$errorMensageLogin <- renderUI({})
      
      shiny::showTab(inputId = "tabs", target = "Management")
      shiny::showTab(inputId = "tabs", target = "Help")
      shiny::showTab(inputId = "tabs", target = "Logout")
      shiny::showTab(inputId = "tabs", target = "Start")
      
      shiny::hideTab(inputId = "tabs", target = "Login")
      
      shinyjs::show(selector = '#tabs li a[data-value="Help"')
      shinyjs::show(selector = '#tabs li a[data-value="Management"')
      shinyjs::show(selector = '#tabs li a[data-value="Logout"')
      shinyjs::show(selector = '#tabs li a[data-value="Start"')
      
      hideTab(inputId = "tabs", target = "Login")
      
      shiny::hideTab(inputId = "tabs", target = "Summary")
      shiny::hideTab(inputId = "tabs", target = "Plots")
      shiny::hideTab(inputId = "tabs", target = "Bluefin")
      shinyjs::hide(selector = '#tabs li a[data-value="Summary"')
      shinyjs::hide(selector = '#tabs li a[data-value="Plots"')
      shinyjs::hide(selector = '#tabs li a[data-value="Bluefin"')
      
      updateNavbarPage(session, "tabs",selected = "Selection")
      
      if(get("UserAdmin",envir = get(miUsuario))==TRUE){
        
        shiny::showTab(inputId = "tabs", target = "Admin")
        shinyjs::show(selector = '#tabs li a[data-value="Admin"')
        
        output$TablaPermisos <- renderDataTable ({get("tabla",envir = get(miUsuario))}) 
        
        output$Delete1       <- renderUI({textInput    ("DeleteuserUI",  "User name to delete")})
        output$Delete2       <- renderUI({actionButton ("deleteUser",    "Delete", style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F);')})
        output$Add1          <- renderUI({textInput    ("AddUserUI",     "User name to add")})
        output$Add2          <- renderUI({actionButton ("AddUser",       "Add", style = 'color:white; background:linear-gradient(	#37BFD0, #187D94, #073D5F); border:linear-gradient(	#37BFD0, #187D94, #073D5F);')})
        output$Add3          <- renderUI({checkboxInput('AddUser_Admin', strong('Administrator'), FALSE)})
        output$Add4          <- renderUI({textInput    ("AddPasswordUI", "New user password")})
        
      }
      
    }else{
      
      if(get("tipoErrorLogin",      envir = get(miUsuario))==1){
        
        output$errorMensageLogin <- renderUI({expr =helpText(div('User does not exist; try again', style ='color:red'))})
        
      }else if(get("tipoErrorLogin",envir = get(miUsuario))==2){
        
        output$errorMensageLogin <- renderUI({expr =helpText(div('Wrong password; try again', style ='color:red'))})
        
      }
    }
    
  })
  
  observeEvent(input$reload,         {
    
    session$reload()
    
  })
  
})

