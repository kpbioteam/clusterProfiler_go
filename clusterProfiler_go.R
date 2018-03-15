require("clusterProfiler", quietly = TRUE)
require("org.Hs.eg.db", quietly = TRUE)

args <- commandArgs(trailingOnly = TRUE)

input1 = args[1]
input2 = args[2]
output = args[3]

gene <- c(read.table(input1))
ego <- enrichGO(gene          = gene$V1,
                OrgDb         = org.Hs.eg.db, 
                keyType = input2)

write.table(ego, output)
