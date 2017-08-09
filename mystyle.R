# potsubsuper

potsub <- function(char) ReporteRs::pot(char, textProperties(vertical.align = 'subscript'))
potsuper <- function(char) ReporteRs::pot(char, textProperties(vertical.align = 'superscript'))

mystyle <- list()

# Style

mystyle$no <- borderProperties( width = 0 )
mystyle$big <- borderProperties( width = 2 )
mystyle$std <- borderProperties( width = 1 )
mystyle$another <- borderProperties(width = 2, color = 'red', style = 'dashed')
mystyle$right3 <- parProperties( text.align = 'right', padding = 3 )
mystyle$bottom5 <-  cellProperties(padding.top = 10, vertical.align = 'bottom')
mystyle$subscript <- textProperties(vertical.align = 'subscript')

# PK parameters

mystyle$AUClast <- 'AUC' + pot('last', mystyle$subscript) + ' (ng·h/mL)'
mystyle$Cmax <- 'C' + pot('max', mystyle$subscript) + ' (ng/mL)'
mystyle$CLR <- 'CL' + pot('R', mystyle$subscript) + ' (L/h)'

# Finalization

#File <- 'docs/lg-raw'
#system(paste0('rm ', File , '-*.docx'))
#wordfile <- paste0(File, '-', gsub('[^0-9]', '-', Sys.time()), '.docx')
#writeDoc(doc, file = wordfile)
#print(wordfile)
#if (interactive() == TRUE) browseURL(wordfile)

fastdoc <- function(df, Level = 4, Caption = "", pagebreak = TRUE){
  
  Table <- vanilla.table(df)
  Table[] <- parProperties(text.align = "left", padding = 0)
  
  if (Caption != "") doc <<- addTitle(doc , Caption, level = Level)
  doc <<- addFlexTable(doc , Table)
  
  if (pagebreak == TRUE) doc <<- addPageBreak(doc)
}
