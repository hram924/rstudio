data = readLines("http://www.stats.govt.nz/Census/2013-census/data-tables/
tables-about-a-place.aspx?request_value=24394&reportid=14&tabname=Ageandsex")
head(data)
tablelines <- grep("  <table", data)
endtablelines <- grep("/table>", data)
tables <- cbind(tablelines, endtablelines)
tables
values <- gsub( " *\\<.*?\\> *", "", data)
values