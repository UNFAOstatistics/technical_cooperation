#!/bin/bash

textsOutput <- "./output/"

library(RCurl)
library(stringr)

# download text from etherpad
download.file("https://pad.okfn.org/p/faodemo-minute/export/txt", destfile = local_text, method = "curl")
# read in R
tx <- readLines(local_text,encoding="UTF-8")
# Clean the raw text
tx <- tx[-grep("^<!--",tx)] # exclude the rows that with begin "<!--"
# Extract title row numbers
title_rows <- grep("^§§§§", tx)

# Loop for all the lines between title rows
for (i in 1:length(title_rows)) {
  file_name <- str_trim(str_replace(tx[title_rows[i]], pattern = "§§§§", replacement = ""))
  if (i < length(title_rows)) content <- tx[(title_rows[i]+1):(title_rows[i+1]-1)]
  if (i == length(title_rows)) content <- tx[(title_rows[i]+1):length(tx)]
  #   for (nr in 1:length(content)) {
  #     content <- append(x = content, "", content[nr])
  #   }
  content <- c(content,paste("`Compiled at",as.character(Sys.time())),"`")
  writeLines(content, con = paste0(textsOutput,file_name,".md"), sep = "\n", useBytes = FALSE)
  system(paste("pandoc -o", paste0(textsOutput,file_name,".pdf"),
               paste0(textsOutput,file_name,".md")))
  system(paste("pandoc -o", paste0(textsOutput,file_name,".docx"),
               paste0(textsOutput,file_name,".md")))
  system(paste("pandoc -o", paste0(textsOutput,file_name,".odt"),
               paste0(textsOutput,file_name,".md")))
}
