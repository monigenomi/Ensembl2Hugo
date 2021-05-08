# Ensembl to Hugo

Program translates transcript id or gene id from Ensembl to Hugo gene nomenclature. 


## Donwloaded data

Data donwnloaded from https://www.genenames.org/download/custom/


```
curl -L "https://www.genenames.org/cgi-bin/download/custom?col=gd_hgnc_id&col=gd_app_name&col=md_ensembl_id&status=Approved&status=Entry%20Withdrawn&hgnc_dbtag=on&order_by=gd_app_sym_sort&format=text&submit=submit" -o hgnc_custom.txt
```
