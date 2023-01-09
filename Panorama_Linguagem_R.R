#Estruturas de repetição

#For

for(i in seq(12)){
  print(i)
}

#While

i <- 0 
while(i <=10){
  print(i)
  i = i + 1
}

#---------------------
#Controle de fluxo

x = 10

if(x>0){
  print("Número positivo")
}

nota = 4

if(nota >= 7 ){
  print("Aprovado")
}else if(nota > 5 && nota < 7){
  print("Recuperação")
}else{
  print("Reprovado")
}

#--------------------------
#Criando funções

par.impar <- function(num){
  if((num%%2)==0){
    return("Par")
  }else{
    return("Impar")
  }
  
}

num = 3
par.impar(num)

#-------------------------------
#Utilizando a funcao apply
#Apply()
?apply

x <- seq(1:9)

matriz <- matrix(x, ncol = 3)
print(matriz)

result1 <- apply(matriz,1,sum)
print(result1)
#será realizado operações nas linhas

result2 <- apply(matriz,2,sum)
print(result2)
#será realizado operações nas colunas

#Lapply()
#É similar a função apply(), mas é aplicada em vetores e listas

numeros.p <- c(2,4,6,8,10,12)
numeros.i <- c(1,3,5,7,9,11)

numeros <- list(numeros.p, numeros.i)

print(numeros)

lapply(numeros, mean)
#retornara a media das listas

sapply(numeros, mean)

#Há diferença está na forma de apresentação dos resultados

#----------------------
#Criando gráficos
?mtcars
#The data was extracted from the 1974 Motor Trend US magazine, 
#and comprises fuel consumption and 10 aspects 
#of automobile design and performance for 32 automobiles 
#(1973–74 models).
carros <- mtcars[, c(1,2,9)]

#[, 1]	mpg	Miles/(US) gallon
#[, 2]	cyl	Number of cylinders
#[, 9]	am	Transmission (0 = automatic, 1 = manual)

?head
#Returns the first or last parts of a vector, matrix, table, 
#data frame or function. Since head() and tail() 
#are generic functions, 
#they may also have been extended to other classes

head(mtcars)

?hist
#Construindo um histograma
hist(carros$mpg)

#Construindo um gráfico de dispersão
plot(carros$mpg, carros$cyl)
#mpg e cyl são os dois parametros para o gráfico de dispersão


library(ggplot2)

ggplot(carros, aes(am)) + 
  geom_bar()






