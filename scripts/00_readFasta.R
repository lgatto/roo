
# Function to read in data
readFasta <- function(infile){
  lines <- readLines(infile)
  header <- grep("^>", lines)
  if (length(header) > 1) {
    warning("Reading first sequence only.")
    lines <- lines[header[1]:(header[2]-1)]
    header <- header[1]
  }
  .id <- sub("^> *", "", lines[header], perl = TRUE)
  .sequence <- toupper(paste(lines[(header + 1):length(lines)],
                             collapse = ""))
  .alphabet <- toupper(unique(strsplit(.sequence, "")[[1]]))
  
  list(id = .id,
       alphabet = .alphabet,
       sequence = .sequence)
}
