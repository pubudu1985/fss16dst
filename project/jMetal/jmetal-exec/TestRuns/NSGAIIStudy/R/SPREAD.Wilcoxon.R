write("", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex",append=FALSE)
resultDirectory<-"TestRuns/NSGAIIStudy/data"
latexHeader <- function() {
  write("\\documentclass{article}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(problem, "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(".SPREAD.}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(problem, "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(".SPREAD.}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)

  write("\\centering", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(tabularString, "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
}

printTableLine <- function(indicator, algorithm1, algorithm2, i, j, problem) { 
  file1<-paste(resultDirectory, algorithm1, sep="/")
  file1<-paste(file1, problem, sep="/")
  file1<-paste(file1, indicator, sep="/")
  data1<-scan(file1)
  file2<-paste(resultDirectory, algorithm2, sep="/")
  file2<-paste(file2, problem, sep="/")
  file2<-paste(file2, indicator, sep="/")
  data2<-scan(file2)
  if (i == j) {
    write("-- ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) <= median(data2)) {
        write("$\\blacktriangle$", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("--", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("ZDT1", "ZDT2", "ZDT3", "ZDT4", "ZDT6") 
algorithmList <-c("NSGAIIa", "NSGAIIb", "NSGAIIc", "NSGAIId") 
tabularString <-c("lccc") 
latexTableFirstLine <-c("\\hline  & NSGAIIb & NSGAIIc & NSGAIId\\\\ ") 
indicator<-"SPREAD"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm } | p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm } | p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm }p{0.15cm } | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} & \\multicolumn{5}{c|}{NSGAIIb} & \\multicolumn{5}{c|}{NSGAIIc} & \\multicolumn{5}{c|}{NSGAIId} \\\\") 

# Step 3. Problem loop 
latexTableHeader("ZDT1 ZDT2 ZDT3 ZDT4 ZDT6 ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAIId") {
    write(i , "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
    write(" & ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "ZDT6") {
            if (j == "NSGAIId") {
              write(" \\\\ ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "TestRuns/NSGAIIStudy/R/SPREAD.Wilcoxon.tex", append=TRUE)
     }
        }
      }
      jndx = jndx + 1
    }
    indx = indx + 1
  }
} # for algorithm

  latexTableTail()

#Step 3. Writes the end of latex file 
latexTail()

