setwd('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC')
list.files()

library(tidyverse)
library(broom)
library(dplyr)
library(BiocManager)
library(Biostrings)
library(readr)
library(readxl)

library(parallel)
library(glmnet)
library(ranger)
library(ROCR)


library(dplyr)
library(Biobase)
library(AnnotationDbi)
library(GO.db)
library(impute)
library(preprocessCore)
library(WGCNA)


#df <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/GSE65682AnnotatedNC.tsv') %>% as.data.frame

df1 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GeneID.csv') %>% as.data.frame
df4421_51 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/EMTAB4421_51_ordered.tsv') %>% as.data.frame
df_4421 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/EMTAB4421AnnotatedNC.tsv') %>% as.data.frame
df_4451 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/EMTAB4451AnnotatedNC.tsv') %>% as.data.frame
df_33314 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GSE33341AnnotatedNC.tsv') %>% as.data.frame
df_54514 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GSE54514AnnotatedNC.tsv') %>% as.data.frame
df_95233<- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GSE95233AnnotatedNC.tsv') %>% as.data.frame
df_65682 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GSE65682AnnotatedNC.tsv') %>% as.data.frame
df_27131 <- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/GSE27131AnnotatedNC.tsv') %>% as.data.frame


#Inner join to merge into 1 data
data <-  df4421_51  %>%
  inner_join(df_33314,by="Gene_ID",multiple='all')  %>%
  inner_join(df_54514,by="Gene_ID", multiple='all') %>%
  inner_join(df_95233,by="Gene_ID", multiple='all') %>%
  inner_join(df_65682,by="Gene_ID", multiple='all') %>%
  inner_join(df_27131,by="Gene_ID", multiple='all')

data1_1 <- df4421_51 %>% 
  inner_join(df_33314,by="Gene_ID", relationship = "many-to-many")  %>%
  inner_join(df_54514,by="Gene_ID", relationship = "many-to-many") %>%
  inner_join(df_95233,by="Gene_ID", relationship = "many-to-many") %>%
  inner_join(df_65682,by="Gene_ID", relationship = "many-to-many") %>%
  inner_join(df_27131,by="Gene_ID", relationship = "many-to-many")

data1_2 <-  df4421_51  %>%
  inner_join(df_33314,by="Gene_ID",multiple='any')  %>%
  inner_join(df_54514,by="Gene_ID", multiple='any') %>%
  inner_join(df_95233,by="Gene_ID", multiple='any') %>%
  inner_join(df_65682,by="Gene_ID", multiple='any') %>%
  inner_join(df_27131,by="Gene_ID", multiple='any')
j
df_T2 <- t(data3) %>% as.data.frame
readr::write_tsv(df_T2,'GeneExpressioncombined_MuliplesAdded.tsv')

memory.limit(size=2500)
names(df4421_51)

