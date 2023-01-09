#Fundamentos da linguagem R

mensagem <- "Hello World!"
print(mensagem)

#Analisando o tipo da variável
class(mensagem)

#Documentação da função
?print


#-------------------------------------------------

x <- 22
y <- 22

#Sem função
z <- (x + y)

print(z)

#Com função
sum(x,y)

?sub

#-------------------------------------------------

#Instalando pacotes
install.packages("ggplot2")

#Carregando um grafico
library(ggplot2)

#ggplot2 é um pacote de visualização de dados - utilizado para acriação de gráficos

#-------------------------------------------------

#-------------Estrutura de dados------------------

#Vetor: Armazena um conjunto de valores ordenados chamados de elementos.
#Todos os elementos de um vetor devem ser do mesmo tipo

# Combine values into a vector or a list
?c

cidade <- c("Brasilia", "Sao Paulo", "Rio de janeiro")
print(cidade)

temperatura <- c(32, 22, 35, 17)
print(temperatura)

regiao <- c(1,2,2,3)
print(regiao)

#Operações com vetores

#Acessando o primeiro elemento
cidade[1]

#Acessando o intervalo de valores
temperatura[1:3]

#Copiando um vetor
cidade2 <- cidade
print(cidade2)

#Excluindo o elemento de um vetor
cidade2[-2]

#Alterando um vetor
cidade2[3] <- "Belo Horizonte"

#Adicionando um elemento ao vetor
cidade2[4] <- "Santa Rita do Sapucai"
print(cidade2)

#Deletando um vetor
cidade2 <- NULL

#-------------------

# Fator
#Armazena valores categóricos(nominal ou ordinal)

?factor

UF <- factor(c("SP","RJ","MG","ES"),
             levels = c("MG","SP","RJ","ES"),
             ordered = TRUE)
#Os levels ordenam assim os elementos do fator
print(UF)

#-------------------

#Lista
#Tipo especial de vetor, porém é possível armazenar elementos de diferentes tipos

?list

pessoa <- list(sexo = "M", cidade = "Sao Paulo", idade = 20)
print(pessoa)

#Acessando o primeiro elemento da lista
pessoa[1] 

#Acessando o valor da lista
pessoa[[3]]

#Editando a lista
pessoa[["sexo"]] <- "F"

#Deletando elemento da lista
pessoa[["idade"]] <- NULL

print(pessoa)

#Filtrando elementos da lista

pessoa[c("cidade", "sexo")]

#Lista de listas

cidades <- list(cidade = cidade, temperatura = temperatura, regiao = regiao)
print(cidades)

#----------------------
#Data frame
#É utilizado para organizar elementos em linhas e colunas, semelhante a uma planilha ou base de dados
#Além disso, pode ser formado por listas ou vetores

#Criando um data frame com vetores
#OBS: o numero de elemetos de cada coluna devem ser iguais

cidade[4] <- "Porto Alegre"
print(cidade)


df <- data.frame(cidade, temperatura)

print(df)

#Operações com data frame

#Filtrando valores do data frame
#linha x coluna

df[1,2]

df[, 1]

df[1, ]

#Selecionando as 3 primeiras linhas da primeira e ultima coluna
df[c(1:3), c(1,2)]


#Verificando o nome das colunas
names(df)

#Verificando a dimensão da tabela (linha x coluna)
dim(df)

#Verificando os tipos de dados
str(df)

#Acessar uma coluna do dataframe
df$cidade
df["cidade"]

#----------------------
#Matriz
#Armazena dados semelhante ao dataframe, porém aceita um tipo de dado

?matrix()

#A matriz terá valores de 1 a 9, distribuídos em 3 linhas
m <- matrix(seq(1:9), nrow = 3)

print(m)

m2 <- matrix(seq(1:25),
             ncol = 5,
             byrow = TRUE,
             dimnames = list(c(seq(1:5)),
                        c('A','B','C','D','E')
                        )
            )

print(m2)

#byrow, especifica que a matriz deve ser preenchida com linhas

#Filtrando  matriz (linha x coluna)

m2[c(1:2),c('B','C')]