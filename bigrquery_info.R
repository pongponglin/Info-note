## bigrqurery
library(bigrquery)

## Token
bigrquery::set_service_token('/home/shiny/auth-migo-shiny-bigquery-ro.json')

##### Query command
query_exec(" select ... from 
	", project = "project_id", max_pages = Inf, use_lagacy_sql = F) -> temp

query <- "select  ..."
names <- query_exec(query = query,
	project = "project_id", max_pages = Inf, use_lagacy_sql = F)


##### Query and save table
query_exec(" select ... from 
           ", project = 'project_id', max_pages = 0,
           use_legacy_sql = F, 
           destination_table = 'dataset_name.table_name', 
           write_disposition="WRITE_TRUNCATE", job_info = T)

## write_disposition: "WEITE_EMPTY", "WRITE_TRUNCCATE", "WRITE_APPEND"


###### Upload to BQ Table
bigrquery::insert_upload_job(project="ikea-1611" ,
                             write_disposition='WRITE_TRUNCATE',
                             dataset="bq_ikea_RFM_table_ex_ver_1_99999999",
                             table = "tmp",
              	             iris %>% select(Species))


