## these functions are designed to cache the inverse of a matrix in the parent environment of the function to avoid the inverse being rewritten. This saves computing time and speeds things up

## this first function creates a matrix, sets the value of the matrix, gets the value of the matrix, gets the inverse of the matrix using solve then gets the value of the inverse and returns a list.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
  
}


## this second function calculates the inverse of the matrix created in the previous function but checks the value of the matrix, and if it is already calculated, gets the inverse from the cache, otherwise it calculates the inverse and sets it.

cacheSolve <- function(x=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
  }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}
