gawk -v OFS='\t' '{if (NR!=1) {print $2, $11}}' /home/aleix/Bioinfo/TFG/data/daner_PGC_BIP32b_mds7a_0416a \
                                            > /home/aleix/Bioinfo/TFG/data/BIP_PASCAL_input.txt

gawk -v OFS='\t' '{if (NR!=1) {print $2, $11}}' /home/aleix/Bioinfo/TFG/data/daner_PGC_BIP32b_mds7a_mds7a_BD1.0416a_INFO6_A5_NTOT \
                                            > /home/aleix/Bioinfo/TFG/data/BD1_PASCAL_input.txt
                                            
gawk -v OFS='\t' '{if (NR!=1) {print $2, $11}}' /home/aleix/Bioinfo/TFG/data/daner_PGC_BIP32b_mds7a_mds7a_BD2.0416a_INFO6_A5_NTOT \
                                            > /home/aleix/Bioinfo/TFG/data/BD2_PASCAL_input.txt

for i in {1..21};
  do
    ./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BIP_PASCAL_input.txt --chr=$i
  done

for i in {1..21};
  do
    ./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BD1_PASCAL_input.txt --chr=$i
  done

for i in {1..21};
  do
    ./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BD2_PASCAL_input.txt --chr=$i
  done


./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BIP_PASCAL_input.txt --chr=22 --customdir=examples --custom=out12

./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BD1_PASCAL_input.txt --chr=22 --customdir=examples --custom=out12

./Pascal --pval=/home/aleix/Bioinfo/TFG/data/BD2_PASCAL_input.txt --chr=22 --customdir=examples --custom=out12


touch /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_unfiltered.txt

touch /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_unfiltered.txt

touch /home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_unfiltered.txt

for i in {1..22}
  do 
    awk -v OFS='\t' 'NR>1 {print $0}' \
    /home/aleix/Bioinfo/TFG/PASCAL/output/BIP_PASCAL_input.sum.genescores.chr${i}.txt \
    >> /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_unfiltered.txt
  done
  
for i in {1..22}
  do 
    awk -v OFS='\t' 'NR>1 {print $0}' \
    /home/aleix/Bioinfo/TFG/PASCAL/output/BD1_PASCAL_input.sum.genescores.chr${i}.txt \
    >> /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_unfiltered.txt
  done
  
 for i in {1..22}
  do 
    awk -v OFS='\t' 'NR>1 {print $0}' \
    /home/aleix/Bioinfo/TFG/PASCAL/output/BD2_PASCAL_input.sum.genescores.chr${i}.txt \
    >> /home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_unfiltered.txt
  done

wc -l /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_unfiltered.txt

wc -l /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_unfiltered.txt 

wc -l /home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_unfiltered.txt

############  
 
touch /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_filtered.txt
  
touch /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_filtered.txt

touch /home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_filtered.txt
 
awk -v OFS='\t' \
'{if (substr($8,length($8),1) == 6 && substr($8,1,4) <= 2.26 || substr($8,length($8),1) > 6) \
{print $0}}' \
/home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_unfiltered.txt \
>> /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_filtered.txt 
  
awk -v OFS='\t' \
'{if (substr($8,length($8),1) == 6 && substr($8,1,4) <= 2.28 || substr($8,length($8),1) > 6) \
{print $0}}' \
/home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_unfiltered.txt \
>> /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_filtered.txt


awk -v OFS='\t' \
'{if (substr($8,length($8),1) == 6 && substr($8,1,4) <= 2.29 || substr($8,length($8),1) > 6) \
{print $0}}' \
/home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_unfiltered.txt \
>> /home/aleix/Bioinfo/TFG/results/Pascal/BD2_PASCAL_filtered.txt


awk 'NR==FNR{a[$1]=$6;next} !($6 in a) {print $6}' \
	/home/aleix/Bioinfo/Internship/results/BIP_magma/BIP_MAGMA_genelist.txt \
	/home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_filtered.txt
	
awk 'NR==FNR{a[$1]=$6;next} !($6 in a) {print $6}' \
	/home/aleix/Bioinfo/Internship/results/BIP_magma/BIP_MAGMA_genelist.txt \
	/home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_filtered.txt
	
#generate genelist

awk '{print $6}' /home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_filtered.txt > /home/aleix/Bioinfo/TFG/results/Enrichr/genelistBD1.txt

awk '{print $6}' /home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_filtered.txt > /home/aleix/Bioinfo/TFG/results/Enrichr/genelistBIP.txt


awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Biological_Process_2018 
awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Cellular_Component_2018
awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Molecular_Function_2018


awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Biological_Process_2018_BD1 
awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Cellular_Component_2018_BD1
awk 'BEGIN{ FS=OFS="\t" } NR>=2 && NR<=42 { print substr($1,length($1)-11,10), $3 }' /home/aleix/Bioinfo/TFG/results/Enrichr/GO_Molecular_Function_2018_BD1

	
#BD latex table
awk -v OFS='\t' '{print $6, substr($1,4,2), $2, $3, $7, substr($8,1,4), substr($8,length($8)-1,length($8))}' \
	/home/aleix/Bioinfo/TFG/results/Pascal/BIP_PASCAL_filtered.txt \
	> /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex

awk -F'\t' -v OFS='\t' '{ $1 = "\\textit{" $1 "}"}1' < /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex > /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex2

awk -F'\t' -v OFS='\t' '{ $6 = "$" $6 " \\times 10^{" $7 "}$\\\\" }1' /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex2 > /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex

awk -F'\t' -v OFS='\t' '{ $7 = "" }1' /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex > /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex2
 
awk -F'\t' -v OFS='\t & \t' '{ print $1, $2, $3, $4, $5, $6 } NR % 2 == 0 { print "\\rowcolor{Gray}"; }' /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex2 > /home/aleix/Bioinfo/TFG/results/plots/BIP/BIP_latex


#BD1 latex table
awk -v OFS='\t' '{print $6, substr($1,4,2), $2, $3, $7, substr($8,1,4), substr($8,length($8)-1,length($8))}' \
	/home/aleix/Bioinfo/TFG/results/Pascal/BD1_PASCAL_filtered.txt \
	> /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex

awk -F'\t' -v OFS='\t' '{ $1 = "\\textit{" $1 "}"}1' < /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex > /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex2

awk -F'\t' -v OFS='\t' '{ $6 = "$" $6 " \\times 10^{" $7 "}$\\\\" }1' /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex2 > /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex

awk -F'\t' -v OFS='\t' '{ $7 = "" }1' /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex > /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex2
 
awk -F'\t' -v OFS='\t & \t' '{ print $1, $2, $3, $4, $5, $6 } NR % 2 == 0 { print "\\rowcolor{Gray}"; }' /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex2 > /home/aleix/Bioinfo/TFG/results/plots/BD1/BD1_latex


