source("../../ensembl_to_hugo.R")
context("Test functions for ensembl to hugo.")

test_that("Test simple functions.", {
  expect_equal(detect_id_type("ENSG00000151360"), "ens_gene")
  expect_equal(detect_id_type("ENST00000151360"), "ens_transcript")
  expect_equal(detect_id_type("KRAS proto-oncogene, GTPase"),"hugo_gene")
  expect_equal(remove_suffix("ENST00000373031.4"), "ENST00000373031")
})


test_that("Test translation function.", {
  ensembl_path = "../test_ids_input_test.tsv"
  hugo_path = "../hgnc_custom_test.tsv"
  ENSEMBL_TABLE <<- read.table(file=ensembl_path, header=TRUE)
  HUGO_TABLE <<- read.table(file=hugo_path, header=TRUE , sep="\t", fill = TRUE)
  
  expect_equal(translate("ENSG00000133703", ENSEMBL_TABLE, HUGO_TABLE), "KRAS")
  expect_equal(translate("ENST00000557334.1", ENSEMBL_TABLE, HUGO_TABLE),"KRAS")
  expect_equal(translate("ENST00000557334.1", ENSEMBL_TABLE, HUGO_TABLE), translate("ENST00000556131.1", ENSEMBL_TABLE, HUGO_TABLE))
  expect_equal(translate("KRAS", ENSEMBL_TABLE, HUGO_TABLE), "ENSG00000133703")
})

