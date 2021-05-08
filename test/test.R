ensembl_path = "test/test_ids_input_test.tsv"
hugo_path = "test/hgnc_custom_test.tsv"

ENSEMBL_TABLE <<- read.table(file=ensembl_path, header=TRUE)
HUGO_TABLE <<- read.table(file=hugo_path, header=TRUE , sep="\t", fill = TRUE)

translate("ENSG00000133703", ENSEMBL_TABLE, HUGO_TABLE) == "KRAS"
translate("ENST00000557334.1", ENSEMBL_TABLE, HUGO_TABLE) == "KRAS"
translate("ENST00000557334.1", ENSEMBL_TABLE, HUGO_TABLE) == translate("ENST00000556131.1", ENSEMBL_TABLE, HUGO_TABLE)
translate("KRAS", ENSEMBL_TABLE, HUGO_TABLE) == "ENSG00000133703"

detect_id_type("ENSG00000151360") == "ens_gene"
detect_id_type("ENST00000151360") == "ens_transcript"
detect_id_type("KRAS proto-oncogene, GTPase") == "hugo_gene"

remove_suffix("ENST00000373031.4") == "ENST00000373031"

