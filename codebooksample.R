descrip <- c("greendog", "bluecat")
explanation <- descrip
explanation <- gsub("green", "It is a green ", explanation)
explanation <- gsub("blue", "It is a blue ", explanation)
codebook <- paste("* ",descrip,"\n",explanation,"\n")
write.table(codebook, "codebook_basis.md", quote = FALSE, row.names = FALSE, col.names = FALSE)
