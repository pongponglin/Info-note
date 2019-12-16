## bigrqurery
library(bigrquery)

## Token
bigrquery::set_service_token('/home/shiny/auth-migo-shiny-bigquery-ro.json')

##### Query command
query_exec(" select ... from 
	", project = "project_id", max_pages = Inf, use_legacy_sql = F) -> temp

query <- "select  ..."
names <- query_exec(query = query,
	project = "project_id", max_pages = Inf, use_legacy_sql = F)


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

#### dataset
delete_dataset(
  project = project,
  dataset = str_glue("{client}_business_individual_m"),
  deleteContents = T
)

bq_dataset_create(str_glue("{project}.bq_{client}_nes_individual_m_pega"))

#### list all tables
section_tables <- list_tables(project = project, 
                              dataset = str_glue("bq_{client}_nes_section_m_penny"))

#### copy table
bq_table_copy(str_glue("{project}.bq_{client}_nes_section_m_penny.{section_tables[i]}"),
              dest = str_glue("{project}.bq_{client}_nes_section_m_pega.{section_tables[i]}"))

#### 挑出dataset 裡的 data table
section_tables <- list_tables(project = project, 
                              dataset = str_glue("{client}_individual_q")) %>% 
  str_subset("overall_comp_type")

ds <- bq_dataset(project = project, 
                 dataset = str_glue("{client}_individual_q"))
for(i in 1:4){
  bq_mtcars <- bq_table(ds, section_tables[i])
  bq_table_delete(bq_mtcars)
}


