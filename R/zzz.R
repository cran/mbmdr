
.First.lib <- function(...){
    mbmdr.ver <- read.dcf(file=system.file("DESCRIPTION", package="mbmdr"), fields="Version")
    cat("\n mbmdr ",mbmdr.ver,"\n\n")
}