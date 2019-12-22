## These functions get, set, and cache the inverse of a matrix

## This function gets/sets the inverted matrix in the cache

makeCacheMatrix <- function(x = matrix()) {
  n <- NULL
  set <- function(y) {
    x <<- y #sets the cached matrix
    n <<- NULL #sets the cached inverse to null
  }
  get <- function(){x} #gets the matrix
  setinverse <- function(inv){n <<- inv} #sets the cached inverse
  getinverse <- function(){n} #returns the cached inverse
}


## This function retrieves the Cached Inverse of the Matrix if available, or calculates it again

cacheSolve <- function(x, ...) {
  n <- x$getinverse()
  if(!is.null(n)) { #Checks if inverse is cached, and uses cached inverse if available
    message("getting cached data")
    return(n)
  }
  data <- x$get() #assigns the matrix x into data
  n <- solve(data) #generates inverse of matrix, assigns to n
  x$setinverse(n) # uses the makeCacheMatrix function to store the inverse in the Cache
  n #returns the inverted matrix
}
