from sys import *

ConversionFile = argv[1]
ExpressionFile = argv[2]

ConversionTable = {}
for line in open(ConversionFile,"r"):
    parts = line.strip().split("\t")
    try:
        EnsemblID = parts[0]
        GeneName = parts[4]
        ConversionTable[EnsemblID] = GeneName
    except:
        continue

for line in open(ExpressionFile,"r"):
    parts = line.strip().split("\t")
    if parts[0] in ConversionTable:
        NewParts= [ConversionTable[parts[0]]] + parts[1:]
        result = "\t".join(NewParts)
        print(result)
