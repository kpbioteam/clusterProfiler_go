require("clusterProfiler", quietly = TRUE)
require("org.Hs.eg.db", quietly = TRUE)

args <- commandArgs(trailingOnly = TRUE)

input1 = args[1]
input2 = args[2]
output1 = args[3]
output2 = args[4]

gene <- c(read.table(input1))
ego <- enrichGO(gene          = gene$V1,
                OrgDb         = org.Hs.eg.db, 
                keyType = input2)

write.table(ego, output1)

png(file = output2,
    width = 1200,
    height = 600)

dotplot(ego)

dev.off()
