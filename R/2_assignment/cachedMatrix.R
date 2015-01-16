makeCacheMatrix<- function(x = matrix()) {
  invX <- NULL
  set <- function(y) {
    x <<- y
    invX <<- NULL
  }
  get <- function() x
  setinvert <- function(givenMr) invX <<- givenMr
  getinvert <- function() invX
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
  
}

cacheSolve <- function(x, ...) {
  inv <- x$getinvert()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinvert(inv)
  inv
}