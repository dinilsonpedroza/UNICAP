################################################################################
#################### DATA FRAME ################################################
################################################################################

rm(list = ls()) # Apagar o que estiver na memória (Enviroment).
getwd() # Identificar o diretório de trabalho no R.
setwd("/home/dinilson/Downloads") # Definir outro espaço de trabalho.

# Vamos criar um data-frame do zero. Varíavel (coluna) por variável. Depois uní-las em u data frame.

# Atenção para o elemento de concatenação no agrupamento de elementos, "c":

Nome_Estudante <- c("Ana", "Cris", "Alex", "Daisy", "João", "Chico", 
                  "Maria", "Helena")

Idade <- c(27, 55, 34, 42, 20, 27, 34, 42)


Genero <- c("F", "F", "M", "F", "M", "M", "F", "F")


Notas <- c(4.5, 7.75, 8.25, 10, 6.5, 5.5, 4.5, 9)

# Vamos ver a classe ou tipo de variáveis criadas:

class(Nome_Estudante) # Character, ou palavras.
class(Idade) # Numeric, ou números.

# Juntando as variáveis em um data frame.
GQ <- data.frame(Nome_Estudante, Idade, Genero, Notas) # Gerando o data-frame

GQ # Visualizando o data frame no console do R.

class (GQ) # Classe é data frame.

# Em um data-frame podemos juntar variáveis categóricas e numéricas.


# Listando os nomes das variáveis de nosso data-frame:

names(GQ)

# Selecionando as entradas de cada variável de nosso data-frame:

GQ["Nome_Estudante"]    

GQ["Idade"]

GQ['Genero']

GQ[Notas] # É preciso usar as aspas, simples ou duplas, para que o nome seja lido.

GQ['Notas']


# A mesma seleção poderia ter sido feita usando a posição ou número da coluna:

GQ[2]

# Podemos, ainda, selecionar partes do data-frame:

GQ[2:3] # Selecionando as colunas por intervalo.


# A mesma seleção poderia ser feita pelos nomes das colunas, usando a função de concatenação:

GQ[c("Idade", "Genero")]

# Podemos fazer seleções de linhas por suas posições:

# Gerando todos os valores relaticos à segunda linha:

GQ[2, ]

# Atenção: se quiséssemos criam um objeto com essa linha, atribuiríamos um nome:

Dados_Segunda_Linha <- GQ[2, ]

# Vamos gerar agora os valores das 1a. e 2a. linhas da coluna "Notas".

GQ[1:2, "Notas"]

# Podemos criar uma partição do data-frame original:

GQ[2:3, c("Genero", "Notas")]

# Criando outro data-frame a partir do original:

GQ2 <- data.frame(GQ[2:3, c("Genero", "Notas")])

# Selecionando linhas não consecutivas:

GQ[c(2, 4), c("Genero", "Notas")]

# Extraindo entradas usando o operador "$":

GQ$Nomes_Estudante # Erro no nome da variável.

GQ$Nome_Estudante # notem que após digitar o "$", o Rstudio já oferece as opções.

GQ$Idade

# Vamos estudar a classe dos dois últimos objetos:

class(GQ$Nome_Estudante)

class(GQ$Idade)


# Vamos usar a função table() para extrair informações de frequência de nosso data-frame:

table(GQ$Genero) # No data frame existem 5 pessoas do sexo feminio e 3 do masculino.


################################################################################
################################## tidyverse - tibbles #########################
################################################################################

# https://www.youtube.com/watch?v=eO9QtQeZQvY

library(tidyverse) # Ver Gemini.

data(starwars) # Vamos carregar essa base de dados nativa (base) do R.

starwars # Não é mais um data-frame, mas um tibble (ver Gemini).

# Vamos usar o operador pipe, %>%. Esse operador executa um comando a partir da base original (esquerda).

# Selecionando colunas:
starwars %>%
  select(name, height, sex)

# Selecionando colunas em sequência:
starwars %>%
  select(name:eye_color)

# Selecionando colunas que "começam com", "terminam com" ou "contém" determinado termo ou letra:
starwars %>%
  select(starts_with("s"))

starwars %>%
  select(ends_with("r"))

starwars %>%
  select(contains("color"))


# Exercício: 1. Crie um data frame de ordem 3 x3; 2. Qual é o personagem de starwars mais alto?

# Podemos usar a função arrange() para resolver a segunda questão:

# Solução 1:
mais_alto_df <- starwars %>%
  select(name, height)

# Em seguida, vamos ordenar usando a função arrange:

mais_alto_df %>%
  arrange(-height) # Atentem para o sinal negativo no argumento da função arrange.
# Solução Yarael Poof, com 2,64 metros.

# Ctrl + clique, no endereço abaixo.
Yarael_Poff <- ("https://starwars.fandom.com/wiki/Yarael_Poof?file=YaraelPoof-SWCT.png")

# Solução 2:
mais_alto_df2 <- starwars %>%
  select(name, height) %>%
  arrange(desc(height))
mais_alto_df2  

