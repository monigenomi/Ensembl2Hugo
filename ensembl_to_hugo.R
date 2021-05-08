library(stringr)
library(argparse)

remove_suffix <- function(ensembl_id) {
  return(str_remove(ensembl_id, "\\.\\d+"))
}

detect_id_type <- function(name) {
  sub = substr(name, 1, 4)
  if(sub == "ENSG") {
    return("ens_gene")
  }
  else if(sub == "ENST") {
    return("ens_transcript")
  }
  return("hugo_gene")
}

translate <- function(query, ensembl_table, hugo_table) {
  
  ensembl_gene <- remove_suffix(ensembl_table$gene_id)
  ensembl_transcript = remove_suffix(ensembl_table$transcript_id)
  
  hugo_gene_symbol = hugo_table$Approved.symbol
  hugo_ensembl_id = hugo_table$Ensembl.ID.supplied.by.Ensembl.
  
  type = detect_id_type(query)
  query = remove_suffix(query)
  if(type == "ens_gene") {
    return(hugo_gene_symbol[hugo_ensembl_id == query])
  }
  else if(type == "ens_transcript") {
    gene = ensembl_gene[ensembl_transcript == query]
    return(hugo_gene_symbol[hugo_ensembl_id == gene])
  }
  return(hugo_ensembl_id[hugo_gene_symbol == query])
}

main <- function(parsed) {
  if (length(parsed$items) == 0) {
    return()
  }
  
  ensembl_path = "data/test_ids_input.tsv"
  hugo_path = "data/hgnc_custom.tsv"
  ENSEMBL_TABLE <<- read.table(file=ensembl_path, header=TRUE)
  HUGO_TABLE <<- read.table(file=hugo_path, header=TRUE , sep="\t", fill = TRUE)
  result = c()
  for (item in parsed$items) {
    result <- c(result, translate(item, ENSEMBL_TABLE, HUGO_TABLE))
  }
  return(result)
}

parser <- ArgumentParser(description='Process some integers')
parser$add_argument('-i', '--items', nargs='+',
                    help='list of items')
main(parser$parse_args(commandArgs(trailingOnly = TRUE)))

