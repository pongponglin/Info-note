## 研究將資料帶進xlsx

options(java.parameters = "-Xmx10240m") ##註解 https://stackoverflow.com/questions/27153974/how-to-fix-outofmemoryerror-java-gc-overhead-limit-exceeded-in-r
library(readxl)
library(xlsx)
library(writexl)

KPI <- read.csv("./KPI_temp.csv")

KPI$store<- "test"

write_xlsx(KPI, "~/file1.xlsx")

red <- read.xlsx("~/file1.xlsx", sheetIndex=1)
red$store<- "test"

write.xlsx(red, file="/home/nicole_lin/write.xlsx", sheetName="KPI")
write.xlsx(red, file="/home/nicole_lin/write.xlsx", sheetName="KPI2", append=TRUE, showNA=TRUE)

write.xlsx(red, file="/home/nicole_lin/write.xlsx", sheetName="KPI", append=TRUE)
# 沒辦法直接取代已存在的sheet

wb <- createWorkbook()
wb <- loadWorkbook("~/file1.xlsx")

sheets<- getSheets(wb)

sheet1 <- createSheet(wb, "Sheet1")

addDataFrame(KPI, sheets$KPI)

saveWorkbook(wb,"/home/nicole_lin/write2.xlsx")
             
saveWorkbook(wb, "/home/nicole_lin/test_add.xlsx")

write.xlsx(KPI, file="/home/nicole_lin/write.xlsx")

write.xlsx(KPI, file="~/file1.xlsx", sheetName="KPI", row.names=FALSE)
write.xlsx2(KPI, file="~/file1.xlsx", sheetName="KPI", row.names=FALSE)

write.xlsx2(KPI, file="~/table.xlsx", sheetName="IRIS",  append=FALSE) # append表示在指定的文件中添加一个新sheet

#### 默默成功的部分 -> flow ######
KPI <- read.csv("~/KPI_temp.csv")
KPI$M01 <- rnorm(mean= 10,6)

# 1.load IB report template, 有點大
wb <- loadWorkbook("/home/nicole_lin/IB_report_template.xlsx")
wb <- loadWorkbook("/home/nicole_lin/IB_report_template_emp.xlsx")
sheets<- getSheets(wb)
names(sheets)

addDataFrame(Odata, sheets$Odata,  row.names=FALSE)
addDataFrame(HFdata, sheets$HFData,  row.names=FALSE)
addDataFrame(KPI, sheets$KPI,  row.names=FALSE)
addDataFrame(Sdata, sheets$Sdata,  row.names=FALSE)
addDataFrame(Pdata, sheets$Pdata,  row.names=FALSE)

saveWorkbook(wb,"/home/nicole_lin/IB_report_output.xlsx")

####成功了！！！！！ 要再測試每個檔案～
wb <- loadWorkbook("~/file1.xlsx")
sheets <- getSheets(wb)
rows <- getRows(sheets$Sheet1)
cells <- createCell(rows, colIndex=2)

setCellValue(cells[[2,1]], "屎屎")
setCellValue(cells[[3,1]], "nicole")
setCellValue(cells[[4,1]], "bacon")
saveWorkbook(wb, "./test.xlsx")
             
setCellValue(cell, value, richTextString=FALSE, showNA=TRUE)




