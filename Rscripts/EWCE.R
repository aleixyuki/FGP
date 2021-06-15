library(EWCE)

setwd("~/Bioinfo/TFG/results/plots")

genes <- scan('/home/aleix/Bioinfo/TFG/results/Enrichr/genelistBIP.txt', what=" ")
genesbd1 <- scan('/home/aleix/Bioinfo/TFG/results/Enrichr/genelistBD1.txt', what=" ")
data("ctd")

data("mouse_to_human_homologs")
m2h = unique(mouse_to_human_homologs[,c("HGNC.symbol","MGI.symbol")])

reps=10000 # <- Use 100 bootstrap lists so it runs quickly, for publishable analysis use >1000

human.hits = genes
human.bg = unique(c(human.hits,m2h$HGNC.symbol))

set.seed(123)

cont_results_bip_1 = bootstrap.enrichment.test(sct_data=ctd,hits=human.hits,
                                         bg=human.bg,reps=reps,annotLevel=1,
                                         geneSizeControl=TRUE,genelistSpecies="human",
                                         sctSpecies="mouse")

print(cont_results_bip_1$results[order(cont_results_bip_1$results$p),3:5][1:7,])
print(ewce.plot(cont_results_bip_1$results,mtc_method="BH")$plain)


# Bootstrap significance testing controlling for transcript length and GC content
cont_results_bip_2 = bootstrap.enrichment.test(sct_data=ctd,hits=human.hits,
                                         bg=human.bg,reps=reps,annotLevel=2,
                                         geneSizeControl=TRUE,genelistSpecies="human",
                                         sctSpecies="mouse")

print(cont_results_bip_2$results[order(cont_results_bip_2$results$p),3:5][1:7,])
print(ewce.plot(cont_results_bip_2$results,mtc_method="BH")$plain)




##########################


human.hits = genesbd1
human.bg = unique(c(human.hits,m2h$HGNC.symbol))

set.seed(123)

cont_results_bd1_1 = bootstrap.enrichment.test(sct_data=ctd,hits=human.hits,
                                         bg=human.bg,reps=reps,annotLevel=1,
                                         geneSizeControl=TRUE,genelistSpecies="human",
                                         sctSpecies="mouse")

print(cont_results_bd1_1$results[order(cont_results_bd1_1$results$p),3:5][1:7,])
print(ewce.plot(cont_results_bd1_1$results,mtc_method="BH")$plain)




# Bootstrap significance testing controlling for transcript length and GC content
cont_results_bd1_2 = bootstrap.enrichment.test(sct_data=ctd,hits=human.hits,
                                         bg=human.bg,reps=reps,annotLevel=2,
                                         geneSizeControl=TRUE,genelistSpecies="human",
                                         sctSpecies="mouse")

print(cont_results_bd1_2$results[order(cont_results_bd1_2$results$p),3:5][1:7,])
print(ewce.plot(cont_results_bd1_2$results,mtc_method="BH")$plain)


