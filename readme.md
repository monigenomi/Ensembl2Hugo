# Ensembl to Hugo

Program translates transcript id or gene id from Ensembl to Hugo gene nomenclature. 


## Donwloaded data

Data donwnloaded from https://www.genenames.org/download/custom/

Selected data:

- Approved symbol	
- Ensembl ID(supplied by Ensembl)

```
curl -L "https://www.genenames.org/cgi-bin/download/custom?col=gd_app_sym&col=md_ensembl_id&status=Approved&status=Entry%20Withdrawn&hgnc_dbtag=on&order_by=gd_app_sym_sort&format=text&submit=submit" > hgnc_custom.tsv

```

## Test data

Hugo data

```
cat hgnc_custom.tsv | head -1 > test/hgnc_custom_test.tsv
cat hgnc_custom.tsv | grep KRAS | head -1 >> test/hgnc_custom_test.tsv

```

Ensembl data

```
cat test_ids_input.tsv | head -1 > test/test_ids_input_test.tsv
cat test_ids_input.tsv | grep ENSG00000133703 >> test/test_ids_input_test.tsv

```
