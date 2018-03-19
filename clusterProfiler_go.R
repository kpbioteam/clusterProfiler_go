require("clusterProfiler", quietly = TRUE)
require("org.Hs.eg.db", quietly = TRUE)
require("ggplot2", quietly = TRUE)

args <- commandArgs(trailingOnly = TRUE)

input1 = args[1]
output1 = args[2]
output2 = args[3]

gene <- read.table(input1)
ego <- enrichGO(gene          = c(gene$V2),
                keyType = "ENTREZID",
                OrgDb         = org.Hs.eg.db,
                ont           = "BP",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.01,
                qvalueCutoff  = 0.05,
                readable      = TRUE)                

write.table(ego, output1)
dotplot(ego)
ggsave(file = output2, device = "pdf")
