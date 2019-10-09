source("01_basic_S4.R")

#### S4 methods

## generics
setGeneric("alphabet", function(object, ...) standardGeneric("alphabet"))

## There is already a 'seq' method (see ?seq), although not an S4
## generic one (see isGeneric(seq)). The S4 generic will be created
## implicitly when created the method.
## setGeneric("seq", function(...) standardGeneric("seq"))

setGeneric("seq<-", function(object,value) standardGeneric("seq<-"))

## length is a primitive, which is an implicit generic

# methods
setMethod("alphabet", "GenericSeq", function(object, ...) object@alphabet)
setMethod("length", "GenericSeq", function(x) nchar(x@sequence))
setMethod("seq", "GenericSeq", function(object, ...) object@sequence)

setReplaceMethod("seq",
                 signature(object="GenericSeq",
                           value="character"),
                 function(object, value) {
                   object@sequence <- value
                   return(object)
                 })

### test code

print( seq(genseq) )
print( alphabet(genseq) )
print( length(genseq) )

seq(genseq) <- "AAAATTT"
print( seq(genseq) )



