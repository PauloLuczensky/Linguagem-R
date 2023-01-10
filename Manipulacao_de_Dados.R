#Manipulação de dados em R

#Join
#Criando as tabelas
df1 <- data.frame(Produto = c(1,2,3,4), Preco = c(15,10,25,20))
#Para imprimir a tabela usamos a função head
head(df1)

df2 <- data.frame(Produto = c(1,2,3,4), Nome = c("A","B","C","D"))
head(df2)

install.packages("dplyr")
library(dplyr)
?dplyr
#A grammar of Data Manipulation

df3 <- left_join(df1,df2,"Produto")
head(df3)

df4 <- right_join(df1,df2,"Produto")
head(df4)

df5 <- inner_join(df1,df2,"Produto")
head(df5)
#-----------------------------
#Selecionando dados

?iris
#This famous (Fisher's or Anderson's) iris data set gives the measurements 
#in centimeters of the variables sepal length and width and 
#petal length and width, respectively, for 50 flowers from 
#each of 3 species of iris. 
#The species are Iris setosa, versicolor, and virginica.

head(iris)
glimpse(iris)

#Filter, filtrando os dados
#Parametros, iris(dataset) e a especie desejada
versicolor <- filter(iris, Species == "versicolor")
print(versicolor)
#dimensão da tabela(linha x coluna)
dim(iris)

#slice - selecionando algumas linhas especificas
slice(iris, 5:10)

#select - selecionando algumas colunas especificas
select(iris, 2:4)

#Removendo colunas de uma seleção
# todas as colunas, exceto Sepal Width
select(iris, -Sepal.Width)

#criando uma nova coluna com base em colunas existentes
#na nova coluna ficará a soma dos valores da soma do Sepal.Length + Sepal.Width
iris2 <- mutate(iris, nova.coluna = Sepal.Length + Sepal.Width)

#selecionando as colunas desejadas
iris2[,c("Sepal.Length", "Sepal.Width","nova coluna")]
head(iris2)

#----------------------------------
#Arrange - Ordenar

select(iris, Sepal.Length) %>%
arrange(Sepal.Length)

#---------------------------------
#Group by

iris %>% group_by(Species) %>%
  summarise(mean(Sepal.Length))

#OBS: para para realizar mais de uma operação tem que se utilizar %>%

#----------------------------------------------------------------------
#Tranformação de dados
install.packages("tidyr")
library(tidyr)

dfDate <- data.frame(Produto = c('A','B','C'),
                     A.2015 = c(10,12,20),
                     A.2016 = c(20,25,35),
                     A.2017 = c(15,20,30)
                     )

head(dfDate)

#Gather
#Tranforma as colunas em linhas
??gather

#Insere-se o nome de duas colunas colunas:
#uma para receber os dados que estão nas colunas e outra para receber os dados
#que estão nas linhas
dfDate2 <- gather(dfDate, "Ano", "Quantidade", 2:4)
head(dfDate2)

#Separate
#Digita-se o data frame e a coluna que se deseja separar e, em seguida,
#o nome das novas colunas que irão receber o resultado da separação
dfDate3 <- separate(dfDate2, Ano, c("A","Ano"))
#coluna A deletada
dfDate3 <- dfDate3[-2]
print(dfDate3)

#Acrecentando uma coluna Mes
dfDate3$Mes <- c('01', '02', '03')

print(dfDate3)

#Unite
#Junta os dados de diferentes colunas
dfDate4 <- dfDate3 %>%
  unite(Data,Mes,Ano,sep='/')
head(dfDate4)
