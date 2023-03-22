#### highcharter ####

library(highcharter)

highchart() %>%
  hc_xAxis(categories= ) %>% 
  hc_add_series( , name="")

highchart() %>%
  hc_title(text="This is <i>斜體</i> and <b>粗體</b>", align = "left",
           style = list(color = "#99000d")) # 給標題
hc_xAxis(categories= citytemp$month, type = 'datetime') # Ｘ軸變數
hc_yAxis(title=list(text=" "), min=, max= ) # Ｙ軸變數# 調y軸上下界
hc_add_series(citytemp$tokyo, name="Tokyo", color=col[1]) # 加資料集
hc_add_series(citytemp$london, name="London", type="column", color=col[2])  
hc_add_series(citytemp$new_york, name="New York", color=col[3]) 
hc_subtitle(text = "Citytemp",    # 給副標題
            align = "right", 
            style=list( color = "#2b908f", fontWeight = "bold"))
hc_tooltip(headerFormat = "<b>{series.name} cylinders</b><br>",
           pointFormat = "{point.x} (lb/1000), {point.y} (miles/gallon)")   
#定義 當滑標指到時顯示的方式
hc_add_theme(hc_theme_google())

highchart() %>% 
  hc_add_series_scatter(cars$speed, cars$dist)  # scatter plot

# 圖顯示中文
par(family=“STXihei”)

### 另一種資料格式
hchart( "line", hcaes(x = as.factor(hosp_type), 
                      y = type_rate, group = dis_type), 
        color=c("")) 

### abline
hc_xAxis(type = 'datetime',
         plotLines = list(
           list(
             label = list(text = "This is a plotLine"),
             color = "#FF0000",
             width = 5,
             value = as.Date('1990-01-01', tz = 'UTC')
           )
         ),
         plotBands = list(
           list(
             label = list(text = "This is a plotBand"),
             color = "rgba(100, 0, 0, 0.1)",
             from = as.Date('1995-01-01', tz = 'UTC'),
             to = as.Date('1996-01-01', tz = 'UTC')
           )
         )
)

## stack bar plot + line(total) 
bs.table = data.frame(
  Closing.Date = paste(2013:2017, 12, sep = "/"),
  Non.Current.Assets = c(13637344, 14075507, 14578093, 10911628, 10680998),
  Current.Assets = c(13078654, 12772388, 14226181, 10205708, 10950779),
  Non.Current.Liabilities = c(9376243, 8895126, 9715914, 9810157, 13493110),
  Current.Liabilities = c(5075985, 4963856, 5992229, 8859263, 4094183)
)

highchart() %>% 
  hc_chart(type = "column") %>%
  hc_plotOptions(column = list(stacking = "normal")) %>%
  hc_xAxis(categories = bs.table$Closing.Date) %>%
  hc_add_series(name="Non Current Assets",
                data = bs.table$Non.Current.Assets,
                stack = "Assets") %>%
  hc_add_series(name="Current Assets",
                data = bs.table$Current.Assets,
                stack = "Assets") %>% 
  hc_add_series(name = "A another data", type = "line", color = "#1FA67A",
                dataLabels = list(align = "center", enabled = TRUE), #顯示數字在圖上
                data = bs.table$Non.Current.Liabilities)
