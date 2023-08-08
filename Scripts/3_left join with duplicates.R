
#leftjoin with df1 with duplicates


df1_4421_51 <- left_join(x=df1, y= df4421_51,by="Gene_ID", multiple="all")

dfT <- as.data.frame(t(df1_4421_51))





       
# transpose all but the first column (name)
n <- df4421_51$Gene_ID
dfT <- as.data.frame(t(df4421_51[,-1]))
colnames(dfT) <- n
dfT$myfactor <- factor(row.names(dfT))
dfT <- cbind(Gene_ID = rownames(dfT), dfT)
str(dfT) 
names(dfT)

#order the samples in ascending order 
colnames(dfT)[1] 
df2 <- dfT[order(dfT$Gene_ID),]

#df_4421_51
m <- df2$Gene_ID
dfT2 <- as.data.frame(t(df2[,-1]))
colnames(dfT2) <- m
dfT2$myfactor <- factor(row.names(dfT))
dfT2 <- cbind(Gene_ID = rownames(dfT2), dfT2)
#str(dfT2) 
names(dfT2)
#drop(dfT2$myfactor)
colnames(df2)

readr::write_tsv(dfT2,'/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/EMTAB4421_51_ordered.tsv')

#%>% distinct(Gene_ID, .keep_all =TRUE)
#df2_4421 <- left_join(x=df1, y= df_4421, by="Gene_ID")

#df3_4451 <- left_join(x=df1, y= df_4451,by="Gene_ID",multiple="all") 
#%>% distinct(Gene_ID, .keep_all =TRUE) 

df1_4421_51 <- left_join(x=df1, y= df4421_51,by="Gene_ID", multiple="all")
df1_33314 <- left_join(x=df1, y=,df_33314,by="Gene_ID",multiple="all") 
#%>% distinct(Gene_ID, .keep_all =TRUE)

df1_54514 <- left_join(x=df1, y=,df_54514,by="Gene_ID",multiple="all") 
#%>% distinct(Gene_ID, .keep_all =TRUE)

df1_95233<- left_join(x=df1, y=df_95233,by="Gene_ID",multiple="all") 
#%>% distinct(Gene_ID, .keep_all =TRUE)
df1_65682 <- left_join(x=df1, y=,df_65682,by="Gene_ID",multiple="all")

#%>% distinct(Gene_ID, .keep_all =TRUE)
df1_27131 <- left_join(x=df1, y=,df_27131,by="Gene_ID",multiple="all")
#%>% distinct(Gene_ID, .keep_all =TRUE)

#Inner join to merge into 1 data

data <- dfT2 %>% 
  inner_join(df1_33314,by="Gene_ID", relationship="many-to-many")  %>%
  inner_join(df1_54514,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df1_95233,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df1_65682,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df1_27131,by="Gene_ID", relationship="many-to-many")

data <-  t(df4421_51) %>% as.data.frame
readr::write_tsv(data,'ETMAB4421_51_transposed.tsv')



data2_1 <- df3_4421 %>%  inner_join(df3_4451,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df3_33314,by="Gene_ID", relationship="many-to-many")  %>%
  inner_join(df3_54514,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df3_95233,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df3_65682,by="Gene_ID", relationship="many-to-many") %>%
  inner_join(df3_27131,by="Gene_ID", relationship="many-to-many")

data2_3 <- df3_4421 %>%  inner_join(df3_4451,by="Gene_ID",multiple="any") %>%
  inner_join(df3_33314,by="Gene_ID",multiple="any") %>%
  inner_join(df3_54514,by="Gene_ID",multiple="any") %>% 
  inner_join(df3_95233,by="Gene_ID",multiple="any") %>%
  inner_join(df3_65682,by="Gene_ID",multiple="any") %>%
  inner_join(df3_27131,by="Gene_ID",multiple="any")



library(BiocManager)
#BiocManager::install(c("WGCNA","impute", "preprocessCore", "GO.db","AnnotationDbi"))

#install.packages("WGCNA")

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


rownames(tmp.expr) = as.data.frame(rownames(tmp.expr))
  
expr= df4421_51
  
tmp.expr = dplyr::select(expr, -Gene_ID)
rownames(tmp.expr) = paste('Genes', 1:dim(tmp.expr)[1], sep = '')
tmp.expr = WGCNA::collapseRows(tmp.expr, expr$Gene_ID, rownames(tmp.expr))$datETcollapsed
expr = tmp.expr
expr[is.na(expr)] = 0
df3_4421_51 = expr  %>% as.data.frame()





as.atomic(df3_4421_51)
tmp.expr = dplyr::select(df3_4421_51, -Gene_ID)
nrow(tmp.expr)
rownames(tmp.expr) = paste ('Genes',  1:dim(tmp.expr)[1], sep = '')  %>% as.data.frame()
tmp.expr = WGCNA::collapseRows(df3_4421_51, df3_4421_51$Gene_ID, rownames(tmp.expr))$datETcollapsed

expr = tmp.expr
expr[is.na(expr)] = 0

rm(expr)

expr = data2[-1]
expr

tmp.expr = dplyr::select(expr, -Gene_ID)
rownames(tmp.expr) = paste('Genes', 1:dim(tmp.expr)[1], sep = '')
tmp.expr = WGCNA::collapseRows(tmp.expr, expr$Gene_ID, rownames(tmp.expr))$datETcollapsed
expr = tmp.expr
expr[is.na(expr)] = 0

as.numeric(data2$Gene_ID)



#IF(C4="NonSurvivor",1,0)