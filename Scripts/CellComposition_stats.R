celltypes<- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/Cleaned_CellTypePredictionsWithMetadata.tsv') %>% as.data.frame


is.numeric(celltypes$Death)

# statistical analysis
survivor = celltypes[celltypes$Death==0,]
dead = celltypes[celltypes$Death==1,]
names(celltypes)

for (i in 10){
  result = wilcox.test(survivor[,i],dead[,i])
  print(result)
}

summary(celltypes)

install.packages(BSDA)

library(broom)
celltypes$statistic 
x = celltypes[celltypes$Death==0,]
y = celltypes[celltypes$Death==1,]
names(celltypes)

for (i in 11){
  result = z.test(x= x[,i], y = y[,i])
  print(result)
}

nrows(x)

install.packages(c("pastecs","psych"))
library(pastecs)
library(psych)
Stat_cell<- stat.desc(celltypes)
write.table(Stat_cell, '/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/NC/NC_Corrected/Statistics_Cells.tsv', sep ='\t')
describe.by(celltypes, celltypes$Death)
summary(celltypes)
inspect(celltypes)




library(aod)
library(ggplot2)

celltypes<- readr::read_tsv('/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/Cleaned_CellTypePredictionsWithMetadata.tsv') %>% as.data.frame
colnames(celltypes)

cell <- celltypes[,c(11:36)]

#for (i in cell){
#  logit <- glm(Death ~ Age +Sex + i , data= celltypes)
#}

#summary(logit)

logit <- glm(Death ~ Age +Sex + MSC, data= celltypes,family="binomial")
summary(logit)
confint(logit)



write_tsv(result,"/Users/tejasveneramesh/Document/PSCI/Serghei_lab/AnnotatedFiles/MSC")

