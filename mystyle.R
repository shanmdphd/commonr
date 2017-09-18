#' mystyle.R
#' 
#' functions that make a flex table with border setting and
#' pot that contains other parameter setting.

# subscript, superscript

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

# PK parameters ----

# mad

mystyle$Cmax <- 'C' + pot('max', mystyle$subscript) + ' (ng/mL)'
mystyle$AUC24 <- 'AUC' + pot('0-24', mystyle$subscript) + ' (ng·h/mL)'
mystyle$Tmax <- 'T' + pot('max', mystyle$subscript) + ' (hr)'
mystyle$HL <- 'T' + pot('1/2β', mystyle$subscript) + ' (hr)'
mystyle$CLF <- 'CL/F (L/h)'
mystyle$VzF <- 'Vz/F (L)'
mystyle$RAUAUC24 <- 'RAU AUC' + pot('0-24', mystyle$subscript)
mystyle$RAUCmax <- 'RAU C'+ pot('max', mystyle$subscript)

# sad
mystyle$AUClast <- 'AUC' + pot('last', mystyle$subscript) + ' (ng·h/mL)'
mystyle$CLR <- 'CL' + pot('R', mystyle$subscript) + ' (L/h)'

param <- list()

param$AUCinf <- "AUC" + pot("0-∞", mystyle$subscript) + " (ng·h/mL)"
param$AUCinfDose <- "AUC" + pot("0-∞", mystyle$subscript) + "/dose (ng·h/mL/mg)"
param$CmaxDose <- "C" + pot("max", mystyle$subscript) + "/dose (ng/mL/mg)"
param$Vz <- "V" + pot("z", mystyle$subscript) + " (L)"
param$Vdss <- "V" + pot("d,ss", mystyle$subscript) + " (L)"
param$CL <- "CL (L/h)"
param$HL <- "t" + pot("1/2β", mystyle$subscript) + " (h)"
param$Ae <- "A" + pot("e", mystyle$subscript) + " (mg)"
param$AUCtau <- "AUC" + potsub("τ,1st dose") + " (ng·h/mL)"
param$AUCtauss <- "AUC" + potsub("τ,ss") + " (ng·h/mL)"
param$Cmax1st <- "C" + potsub("max,1st dose") + " (ng/mL)"
param$Cmaxss <- "C" + potsub("max,ss") + " (ng/mL)"
param$Cavss <- "C" + potsub("av,ss") + " (ng/mL)"
param$CLss <- "CL" + potsub("ss") + " (L/h)"
param$Vz <- "V" + potsub("z") + " (L)"
param$Vdss <- "V" + potsub("d,ss") + " (L)"
param$HL <- "t" + potsub("1/2β") + " (L)"
param$HLeff <-  "t" + potsub("1/2,eff") + " (L)"
param$obsAI <-  "Observed AI" + potsuper("a")
param$predAI <-  "Predicted AI"
param$Ae1st <-  "A" + potsub("e,1st dose") + " (mg)"
param$Ae <-  "A" + potsub("e,last dose") + " (mg)"
param$CLR1st <-  "CL" + potsub("R,1st dose") + " (L/h)"
param$CLRlast <-  "CL" + potsub("R,last dose") + " (L/h)"
