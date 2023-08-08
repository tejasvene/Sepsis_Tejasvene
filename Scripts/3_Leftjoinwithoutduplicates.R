#EMTAB4421_51

expr= df4421_51

tmp.expr = dplyr::select(expr, -Gene_ID)
rownames(tmp.expr) = paste('Genes', 1:dim(tmp.expr)[1], sep = '')
tmp.expr = WGCNA::collapseRows(tmp.expr, expr$Gene_ID, rownames(tmp.expr))$datETcollapsed
expr = tmp.expr
expr[is.na(expr)] = 0
df5_4421_51 = expr  %>% as.data.frame()
df5_4421_51 <- cbind(Gene_ID = rownames(df5_4421_51), df5_4421_51)



#readr::write_tsv(dfT2,'/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/NC_Corrected/EMTAB4421_51.tsv')


#GSE33314
expr1= df_33314

tmp.expr1 = dplyr::select(expr1, -Gene_ID)
rownames(tmp.expr1) = paste('Genes', 1:dim(tmp.expr1)[1], sep = '')
tmp.expr1 = WGCNA::collapseRows(tmp.expr1, expr1$Gene_ID, rownames(tmp.expr1))$datETcollapsed
expr1 = tmp.expr1
expr1[is.na(expr1)] = 0
df5_33314 = expr1  %>% as.data.frame()
df5_33314 <- cbind(Gene_ID = rownames(df5_33314), df5_33314)


#readr::write_tsv(df4_33314,'/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/NC_Corrected/GSE33314 .tsv')



#GSE27131
expr2= df_27131

tmp.expr2 = dplyr::select(expr2, -Gene_ID)
rownames(tmp.expr2) = paste('Genes', 1:dim(tmp.expr2)[1], sep = '')
tmp.expr2 = WGCNA::collapseRows(tmp.expr2, expr2$Gene_ID, rownames(tmp.expr2))$datETcollapsed
expr2 = tmp.expr2
expr2[is.na(expr2)] = 0
df5_27131 = expr2  %>% as.data.frame()
df5_27131 <- cbind(Gene_ID = rownames(df5_27131), df5_27131)


#readr::write_tsv(df4_27131,'/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/NC_Corrected/GSE27131.tsv')


#GSE54514
expr3= df_54514

tmp.expr3 = dplyr::select(expr3, -Gene_ID)
rownames(tmp.expr3) = paste('Genes', 1:dim(tmp.expr3)[1], sep = '')
tmp.expr3 = WGCNA::collapseRows(tmp.expr3, expr3$Gene_ID, rownames(tmp.expr3))$datETcollapsed
expr3 = tmp.expr3
expr3[is.na(expr3)] = 0
df5_54514 = expr3  %>% as.data.frame()
df5_54514 <- cbind(Gene_ID = rownames(df5_54514), df5_54514)

#readr::write_tsv(df4_54514,'/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/NC_Corrected/GSE54514.tsv')

#GSE95233

expr4= df_95233

tmp.expr4 = dplyr::select(expr4, -Gene_ID)
rownames(tmp.expr4) = paste('Genes', 1:dim(tmp.expr4)[1], sep = '')
tmp.expr4 = WGCNA::collapseRows(tmp.expr4, expr4$Gene_ID, rownames(tmp.expr4))$datETcollapsed
expr4 = tmp.expr4
expr4[is.na(expr4)] = 0
df5_95233 = expr4  %>% as.data.frame()
df5_95233 <- cbind(Gene_ID = rownames(df5_95233), df5_95233)

#GSE65682

expr5= df_65682

tmp.expr5 = dplyr::select(expr5, -Gene_ID)
rownames(tmp.expr5) = paste('Genes', 1:dim(tmp.expr5)[1], sep = '')
tmp.expr5 = WGCNA::collapseRows(tmp.expr5, expr5$Gene_ID, rownames(tmp.expr5))$datETcollapsed
expr5 = tmp.expr5
expr5[is.na(expr5)] = 0
df5_65682 = expr5  %>% as.data.frame()
df5_65682 <- cbind(Gene_ID = rownames(df5_65682), df5_65682)



#leftjoin with df1 without duplicates
df2_4421_51 <- left_join(x=df1, y= df5_4421_51) %>% distinct(Gene_ID, .keep_all =TRUE)

#df2_4421 <- left_join(x=df1, y= df_4421, by="Gene_ID")

#df2_4451 <- left_join(x=df1, y= df_4451) %>% distinct(Gene_ID, .keep_all =TRUE) 


df2_33314 <- left_join(x=df1, y=,df5_33314) %>% distinct(Gene_ID, .keep_all =TRUE)

df2_54514 <- left_join(x=df1, y=,df5_54514) %>% distinct(Gene_ID, .keep_all =TRUE)

df2_95233<- left_join(x=df1, y=df5_95233)  %>% distinct(Gene_ID, .keep_all =TRUE)
df2_65682 <- left_join(x=df1, y=,df5_65682) %>% distinct(Gene_ID, .keep_all =TRUE)
df2_27131 <- left_join(x=df1, y=,df5_27131) %>% distinct(Gene_ID, .keep_all =TRUE)

#Inner join to merge into 1 data
Combined5 <- df2_4421_51  %>%
  inner_join(df2_33314,by="Gene_ID")  %>%
  inner_join(df2_54514,by="Gene_ID") %>%
  inner_join(df2_95233,by="Gene_ID") %>%
  inner_join(df2_65682,by="Gene_ID") %>%
  inner_join(df2_27131,by="Gene_ID")

exprC= Combined5
exprC[is.na(exprC)] = 0
Combined = exprC  %>% as.data.frame()

library(data.table)
library(tibble)

Combined_T <- as.data.frame(t(Combined))


#redefine row and column names
X <- colnames(Combined)
Y <- rownames(Combined)

#Combined_T <- as.data.frame(t(Combined[,-1]))
rownames(Combined_T) <- X
colnames(Combined_T) <- Y
Combined_T$myfactor <- factor(row.names(Combined_T))
Combined_T <- cbind(Gene_ID = rownames(Combined_T), Combined_T)
readr::write_tsv(Combined_T %>% rownames_to_column(),'GeneExpressionData_LR.tsv')
write.table(Combined_T,'GeneExpressionData_LR2.tsv',sep = '\t')

n <- df4421_51$Gene_ID
dfT <- as.data.frame(t(df4421_51[,-1]))
colnames(dfT) <- n
dfT$myfactor <- factor(row.names(dfT))
dfT <- cbind(Gene_ID = rownames(dfT), dfT)
str(dfT) 
names(dfT)



