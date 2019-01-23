#week 3....
#week three....
read.csv("data/tidy.csv")
#vectors
weight_g <- c(50,60,31,89)
weight_g
#characters
animal <- c("mouse","rat","bat", "frog")
animal
#what to do about hundress of values in a vector? Many tools for visualizing these. 
#vector exploration tools
length(weight_g)
length (animal)
#can see hwat kind of data are contained in a vector by using the class function
class(weight_g)
class(animal)
#to get all that info at once use teh "str" function (structure)
str(weight_g)
str(animal)
x <- 4
x
str(x)
#str is go-to for fist exploration of an object
weight_g <-c(weight_g, 105)
weight_g
str(weight_g)
weight_g
weight_g <- c(25, weight_g)
weight_g
#be careful of adding values and running lines multiple times
weight_g
#num and char are "atomic" vectors -- irreducible. Can't split to any simpler components. There are two more types of atomic vectors
#six total types of atomic vectors. four types most comonly used
#numeric ("double"); character; logical; integer. Also can have "complex" and "raw" (binary....0s and 1s)
#In week 2 we saw in doing comparisons, logical values, another type of atomic vector. 
#use type of fxn to check which kind of vector you have
typeof(weight_g)
typeof(animal)
#type is automatically assigned.  ??How does it deal with alphanumeric???
weight_integer <- c(20L, 21L, 85L)
class(weight_integer)
#vectors can hold one type of data. think of them like spreadsheet columns
#challenge from course materials
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
num_char
class(num_char)
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)
#once you throw one charcter in, stored as char
#num logical read as number
#once you mix num and char, you get char
#only _get numerical and logical if all numerical and logical 
#this is called coercion. R will coerce all values to one type and will pick whichever category all values will fit into.
#categories broad to specific: characters - double - integers - true false 
#R for data science book. Strings chapter is amazing.
#if you have a huge dataset and have some data stored as an incorrect type
#subsetting vectors
animal[3]
animal[2,3]
animal[c(2,3)]
animal[c(3,1,3)]
#conditional subset
weight_g

#true and false can be T and F. NEVER name any of your data values true, false, T, F, or any version thereof
weight_g[c(T,F,T,T,F,T,T)]
weight_g > 50
weight_g(weight_g > 50)
weight_g[weight_g > 50]
weight_g[weight_g<30 | weight_g>50]
weight_g[weight_g >=30 & weight_g ==90]
#a return of "numeric(0)" means nothing meets the argument
weight_g[weight_g >=30 & weight_g ==89]
animal[animal == "bat" | animal == "rat"]
animal %in% c("rat", "antelope", "giraffe")
animal[animal %in% c("rat", "antelope", "giraffe")]
"four">"five"
"six">"five"
"eight">"five"
#this uses alphabetical order as the logic behind "greater than"...   
#missimg data - R conceptualizes missing values in certain way
heights <- c(2,4,4,NA,6)
str(heights)
mean(weight_g)
mean(heights)
max(heights)
#R recognizes missing data and NA
mean(x = heights, na.rm = TRUE)
max (x = heights, na.rm = TRUE)
# some fxns that are useful when addressing NAs  "is.na"
is.na(heights)
complete.cases (heights)
#complete.cases () is useful when you want to select only your data rows where ALL values are complete (ie., no NAs)