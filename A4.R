Data <- https://www.stat.auckland.ac.nz/~stats380/A4
generateFileNames <- function() {
  years <- c(1998:2012)
  theyears <- paste("Y",years, sep="")
  filenames <- paste(theyears, "html", sep=".")
  file.path("https://www.stat.auckland.ac.nz/~stats380/A4", filenames)
}
pathnames <- generateFileNames()
matrix2df <- function(matrix, label) {
  area <- matrix[, 1]
  ageg <- matrix[, 2]
  malepop <- matrix[, 3]
  femalepop <- matrix[, 4]
  url <- charDataMatrix[, 1]
  data.frame(url, area, ageg, malepop, femalepop,
             label=label)
}
extractCharData <- function(line) {
  dataPieces <- strsplit(line, "</td><td>")[[1]]
  URLtemp <- gsub("</a>", "", dataPieces[1])
  URL <- gsub("^.+>", "", URLtemp)
  area <- matrix[, 1]
  ageg <- matrix[, 2]
  malepop <- matrix[, 3]
  femalepop <- matrix[, 4]
  exitText <- gsub("<.+$", "", dataPieces[4])
  c(URL, viewedText, sizeText, entryText, exitText)
}

processHTML <- function(filename) {
  html <- readLines(filename)
  dataLines <- grep('<tr><td class="aws"', html)
  dataText <- html[dataLines]
  charData <- lapply(dataText, extractCharData)
  charDataMatrix <- do.call("rbind", charData)
  print(charDataMatrix)
  matrix2df(charDataMatrix, label=filename)
}

allData <- lapply(pathnames, processHTML)
head(allData)



