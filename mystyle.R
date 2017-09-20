# setup ----

library(ReporteRs)

#' mystyle.R
#' 
#' functions that make a flex table with border setting and
#' pot that contains other mystyleeter setting.

# subscript, superscript

potsub <- function(char) pot(char, textProperties(vertical.align = 'subscript'))
potsuper <- function(char) pot(char, textProperties(vertical.align = 'superscript'))
fastdoc <- function(df, Level = 4, Caption = "", pagebreak = TRUE){
  
  Table <- vanilla.table(df)
  Table[] <- parProperties(text.align = "left", padding = 0)
  
  if (Caption != "") doc <<- addTitle(doc , Caption, level = Level)
  doc <<- addFlexTable(doc , Table)
  
  if (pagebreak == TRUE) doc <<- addPageBreak(doc)
}

mystyle <- list()
mystyle$no <- borderProperties( width = 0 )
mystyle$big <- borderProperties( width = 2 )
mystyle$std <- borderProperties( width = 1 )
mystyle$another <- borderProperties(width = 2, color = 'red', style = 'dashed')
mystyle$right3 <- parProperties( text.align = 'right', padding = 3 )
mystyle$bottom5 <-  cellProperties(padding.top = 10, vertical.align = 'bottom')
mystyle$subscript <- textProperties(vertical.align = 'subscript')

# PK mystyleeters ----

mystyle$AUC24 <- 'AUC' + pot('0-24', mystyle$subscript) + ' (ng·h/mL)'
mystyle$AUCinf <- "AUC" + pot("0-∞", mystyle$subscript) + " (ng·h/mL)"
mystyle$AUCinfDose <- "AUC" + pot("0-∞", mystyle$subscript) + "/dose (ng·h/mL/mg)"
mystyle$AUClast <- 'AUC' + pot('last', mystyle$subscript) + ' (ng·h/mL)'
mystyle$AUCtau <- "AUC" + potsub("τ,1st dose") + " (ng·h/mL)"
mystyle$AUCtauss <- "AUC" + potsub("τ,ss") + " (ng·h/mL)"
mystyle$Ae <-  "A" + potsub("e,last dose") + " (mg)"
mystyle$Ae <- "A" + pot("e", mystyle$subscript) + " (mg)"
mystyle$Ae1st <-  "A" + potsub("e,1st dose") + " (mg)"
mystyle$CL <- "CL (L/h)"
mystyle$CLF <- 'CL/F (L/h)'
mystyle$CLR <- 'CL' + pot('R', mystyle$subscript) + ' (L/h)'
mystyle$CLR1st <-  "CL" + potsub("R,1st dose") + " (L/h)"
mystyle$CLRlast <-  "CL" + potsub("R,last dose") + " (L/h)"
mystyle$CLss <- "CL" + potsub("ss") + " (L/h)"
mystyle$Cavss <- "C" + potsub("av,ss") + " (ng/mL)"
mystyle$Cmax <- 'C' + pot('max', mystyle$subscript) + ' (ng/mL)'
mystyle$Cmax1st <- "C" + potsub("max,1st dose") + " (ng/mL)"
mystyle$CmaxDose <- "C" + pot("max", mystyle$subscript) + "/dose (ng/mL/mg)"
mystyle$Cmaxss <- "C" + potsub("max,ss") + " (ng/mL)"
mystyle$HL <- "t" + potsub("1/2β") + " (L)"
mystyle$HLeff <-  "t" + potsub("1/2,eff") + " (L)"
mystyle$RAUAUC24 <- 'RAU AUC' + pot('0-24', mystyle$subscript)
mystyle$RAUCmax <- 'RAU C'+ pot('max', mystyle$subscript)
mystyle$Tmax <- 'T' + pot('max', mystyle$subscript) + ' (hr)'
mystyle$Vdss <- "V" + pot("d,ss", mystyle$subscript) + " (L)"
mystyle$Vdss <- "V" + potsub("d,ss") + " (L)"
mystyle$Vz <- "V" + potsub("z") + " (L)"
mystyle$VzF <- 'Vz/F (L)'
mystyle$obsAI <-  "Observed AI" + potsuper("a")
mystyle$predAI <-  "Predicted AI"

# Finalization ----

#File <- 'docs/lg-raw'
#system(paste0('rm ', File , '-*.docx'))
#wordfile <- paste0(File, '-', gsub('[^0-9]', '-', Sys.time()), '.docx')
#writeDoc(doc, file = wordfile)
#print(wordfile)
#if (interactive() == TRUE) browseURL(wordfile)

