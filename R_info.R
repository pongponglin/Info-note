##### R 指南 #####
library(dplyr)
library(tidyr)
library(magrittr)
library(stringr)
rm(list=ls())
## attached packages
(.packages()) 

##### str_glue #####
str_glue("{paste(text_col, collapse = ', \" \" , ')}")

##### datatable #####
library(data.table)
data %>% datatable(extensions = 'Buttons', 
                   options = list(dom = 'Bt', scrollX = TRUE,
                                  buttons = c('copy', 'csv', 'excel')), rownames = F)

#### color ####
#paper use
#### 兩兩比較
#4CB2D4 湖水藍
#EB7B2D 橘
#### 三者比較
#F36993

#99000d 深紅
#2171b5 藍

#### highcharter ####

library(highcharter)

highchart() %>%
  hc_xAxis(categories= ) %>% 
  hc_add_series( , name="")

highchart() %>%
  hc_title(text="This is <i>斜體</i> and <b>粗體</b>", align = "left",
           style = list(color = "#99000d")) # 給標題
hc_xAxis(categories= citytemp$month) # Ｘ軸變數
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

###### ggplot ######
library(ggplot2)

#通用公式
#ggplot(data=…, aes(x=…, y=…)) + geom_xxx(…)
#data = 畫圖所需資料
#aes = x、y所想擺放的變數
#geom_XXX 則代表你想畫哪一種圖
#ex:geom_bar、geom_points……
#ggplot僅能使用data.frame儲存資料(不可丟其他屬性的物件)


geom_boxplot(outlier.shape = NA) #直接不要outlier值
# 直接畫迴歸線 不給 method 會配最適線（曲線）
stat_smooth(method=lm, level=.95) ＃se=FALSE 則為不要信賴區間

#標題置中
ggplot() +
  theme(plot.title = element_text(h sjust = 0.5))

#科學符號顯示數字
library(scales)  
scale_x_continuous(labels = comma)

#更改標題跟xy軸的顯示
labs(title ="捷運站沿線交易座標", x = "lon", y = " lat")

#更改右邊legend顯示
scale_colour_discrete(name  ="捷運站別",
                      labels=c("東門站", "大安森林公園站","大安站",
                               "信義安和站","台北101站","象山站"))

scale_fill_discrete(name  ="使用分區或編定") #bar

#在長條圖的上面加上數字
geom_text(aes(label=round(欄名稱, 3)), position=position_dodge(width=0.5), vjust=-0.45)

#要不要顯示右邊的legend
guides(size="none",color="none")

#消除背景 x y軸
theme(panel.border = element_blank(),
      panel.background = element_blank(),
      axis.ticks = element_blank(),
      axis.text = element_blank())

#更改範圍
coord_cartesian(ylim = c(21.89, 25.3),xlim = c(119.4,122.5))

#儲存圖片
ggsave('/Users/hsiaoling/Desktop/R_team/pong0team/圖片檔/.jpg')

#加上垂直線
geom_abline(aes(xintercept=10212),colour = "blue",linetype = "dashed", size = 1)
?geom_abline()

#加上文字
annotate("text", x =2, y =190, label ="幹",family="STHeiti", colour = "black", size=5.5)

#調色盤 看顏色
colors()
library(RColorBrewer)
display.brewer.all()  #看內建調色盤
#前面有color=欄位名
scale_colour_manual(values = c('#edf8e9','#c7e9c0','#a1d99b','#74c476','#31a354','#006d2c')) 
scale_colour_brewer(palette="Set1") 


#圖形顯示中文字
+ theme_grey(base_family="STHeiti")

#標題太長的時候可以轉角度
+ theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

#改lable的字體大小
+  theme(axis.title.x = element_text(size = rel(4),face="bold"))

# 要x軸（類別）按照想要的順序
sp$city_o = factor(sp$city_o, levels = popu$縣市)

# lm 配飾圖
ggplot(data = train, aes(x = year, y = active_rate, label = year))+
  geom_point()+
  geom_smooth(method = 'lm', se = F)+
  scale_x_continuous(breaks = 2013:2019)+
  scale_y_continuous(breaks = 513885)+
  geom_label_repel(data = filter(data_tmp, year == 2019)) + 
  labs(title = "2019 IFB Active Member Estimation", x = "Year", y = "Num. of Active Member")


###### Plotly ######
library(ployly)
p=ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, 
                   color=Species, shape=Species)) + 
  geom_point(size=6, alpha=0.6)+ 
  theme(legend.position = c(.83, .9))
ggplotly(p)


######  rdgal ######
# shape file 
library(rgdal)
library(ggplot2)

shape<-readOGR(dsn="台北里界圖",layer="G97_A_CAVLGE_P") #資料夾名稱，要讀的檔名
plot(shape)

head(shape@data)   
shape@polygons[[1]]         # polygons 是放經緯度的地方
names(shape)
fortify(shape, region = "行政區域")


##### 畫地圖 #######
library(dismo)
#library(rbokeh)
library(rgdal)
library(mapproj)
library(dplyr)
library(maps)
library(ggmap)
library(gpclib)
library(devtools)
library(geosphere)
library(maptools)
### Error: isTRUE(gpclibPermitStatus()) is not TRUE
install.packages("gpclib")
library(maptools)
gpclibPermit()

base.map <- gmap("taipei", type = "terrain", exp = 0.5) #google地圖
plot(base.map)
sfn <- readOGR(dsn='/Users/apple/nicole/R code/mission/村里界圖',layer="Village_NLSC_1050715")
sfn@data %>% head
sfn@data$CT_Name <- paste0(sfn@data$C_Name,sfn@data$T_Name)
tic=sfn[sfn@data$C_Name %in% c("臺北市"),]
sfn.f <- tic %>% fortify(region='V_Name') 

gmap(lat = 25.067566,lng = 121.552699, zoom = 10) %>%
  ly_polygons(long, lat, group = group, data = sfn.f,
              fill_alpha = 0.1, line_width = 2, color = "orange")

base.map <- gmap("臺中", type = "terrain") #google地圖
plot(base.map)
# exp 數字越小越拉近

gs = gmap('Sydney, New South Wales, Australia', type='satellite') #衛星圖
plot(gs, inter=TRUE)
gs = gmap('Sydney, Australia', type='satellite', exp=3)
plot(gs, inter=TRUE)
gs = gmap('Sydney, Australia', type='hybrid', exp=8)
plot(gs, inter=TRUE)


g.map <- get_map(location = "Taipei", zoom = 12) 
ggmap(g.map)
map <- get_map(location = c(lon = 120.233937, lat = 22.993013),
               zoom = 10, language = "zh-TW", maptype = "roadmap")
ggmap(map)

###### Google  ######
library(googlesheets)
gs_auth(token = "~/data_cleansing_process/ysbpan.rds")
counting <- gs_title("Existing member purchase(for 2019 yearly report)") 
df <- gs_read(counting,  ws = "ExistingforR") ## ws: sheet 名稱

gs_new(title = "IB company", input = temp)

###### read xlsx 檔 ######
library(readxl)
library(xlsx)
tables <- read_excel("~/aaa.xlsx", sheet = 1) 
# mtemp <- read.xlsx(file=paste0("~/MAR/",mar[j]),sheetIndex=i,encoding = "UTF-8") 
## 會用到Java的東西，然後會失敗

###### Rmarkdown ######

output:
  html_document: 
  highlight: haddock
theme: spacelab
toc: yes
toc_depth: 3
toc_float: yes
code_folding : hide   
---
  
  <br/>
  
  ## setup
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE
)

```

## css code
# 置中
# <img  src="plot/官方2.png" width=300">

