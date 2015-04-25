## The following code was modified from the 'makeVector' and 'cachemean'
## example code that was provided in the assignment details.


## The 'makeCacheMatrix' function creates a cacheable matrix that can be inverted.
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        set_inv <- function(inverse) inv <<- inverse
        get_inv <- function() inv
        list(set = set, get = get,
             set_inv = set_inv,
             get_inv = get_inv)
}

## The 'cacheSolve' function calculates and returns the inverse of a matrix.
cacheSolve <- function(x, ...) {
        inv <- x$get_inv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...) ## 'solve' is used to return the inverse of a matrix.
        x$set_inv(inv)
        inv
}