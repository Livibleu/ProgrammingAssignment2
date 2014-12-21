## Mise en cache du resultat de la moyenne d'une matrice
## Put in cache the mean of a matrix
## makeCacheMatrix va stocker la valeur numerique de la moyenne d'une matrice
## makeCacheMatrix will keep the mean value of a matrix

makeCacheMatrix <- function(x = matrix()) {
  ## s will store the inverse
  s <- NULL
  ## set is used to alter the matrix
  ## it invalidates the cache
  set <- function(y){
    x <<- y
    s <<- NULL
  }
## get returns the raw matrix
get <- function() {
  x
}
## setsolve sets the s variable
## is only used by cacheSole
setsolve <- function(solve){
  s <<- solve
}
## getsolve gets the cache inverse
getsolve <- function() {
  s
}

## return the special matrix
list(set = set,
     get = get,
     setsolve = setsolve,
     getsolve = getsolve)
 }


## Cette fonction va renvoyer une matrice qui sera l'inverse de x
## This function will convert the value of x in a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$gets()
## if the value of s is not null I load this value
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
data <- x$get()
s <- solve(data, ...)
x$sets(s)
return(s)
}

##Test:
# a_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
#cacheSolve(a_matrix)
#a_matrix$set(matrix(5:8, 2,2))
#cacheSolve(a_matrix)
# cacheSolve(a_matrix) ##"Getting cached inverse"