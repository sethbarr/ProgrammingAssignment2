## Put comments here that give an overall description of what your
## functions do

## produce an object that contains containers for the matrix inverse
## set seems to just put the data into a matrix while keeping slots open for the inverse
## get returns x
## setInv uses the solve function to calculate the matrix inverse (bit confused about 
## the <<- here, why needing to look outside this space)
## return the inverse with getInv

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setInv <- function(solve) inv <<- solve
	getInv <- function() inv
	list(set=set, get=get, setInv=setInv, getInv=getInv)

}


## store the inverse in the inv spot if it hasn't already been calculated
## first check if there's anythign there, if not fill it and return the value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInv()
	if(!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setInv(inv)
	inv
}



# from example for doing the same but caching the mean
# makeVector <- function(x = numeric()) {
#         m <- NULL
#         set <- function(y) {
#                 x <<- y
#                 m <<- NULL
#         }
#         get <- function() x
#         setmean <- function(mean) m <<- mean
#         getmean <- function() m
#         list(set = set, get = get,
#              setmean = setmean,
#              getmean = getmean)
# }

# cachemean <- function(x, ...) {
#         m <- x$getmean()
#         if(!is.null(m)) {
#                 message("getting cached data")
#                 return(m)
#         }
#         data <- x$get()
#         m <- mean(data, ...)
#         x$setmean(m)
#         m
# }