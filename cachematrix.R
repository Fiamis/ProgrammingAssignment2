## makeCacheMatrix and cacheSolve are functions that cache the inverse of a matrix.

##This function creates a special "matrix" object that can cache its inverse.
##this function returned functions instead of an actual matrix
##some of these functions are: set, get, set_inverse, get_inverse

makeCacheMatrix<-function(x=matrix())
{
  a<- NULL
  set<-function(z)
    {
      x<<-z
      a<<- NULL
    }
    
  get<-function() x   
  
  set_inverse<- function(inverse)
    
    a<<-inverse
  
  get_inverse  <- function() a
  
  list(set= set, get = get,set_inverse = set_inverse,get_inverse = get_inverse)
  
}
##The matrix is actually stored in memory of in the 
##parent environment of these functions.
##These functions allow us to save and fetch the matrix.

#########################################################################################

##The cacheSolve function computes the inverse of 
##the special "matrix" returned by makeCacheMatrix above.

##If the inverse has already been calculated and the matrix has not changed
##then it should retrieve the inverse from the cache.

cacheSolve<-function(x, ...)
{
  
    a<- x$get_inverse()
    if (!is.null(a))
      {
        message("getting cached data")
        return(i)
      }
    
    data<-x$get()
    a<- solve(data, ...)
    x$set_inverse(a)
    
    a
}
