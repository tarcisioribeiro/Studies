Nome: Tarcísio José Martins Ribeiro Código: 20382

#Exercício 1

a) 
p_a = c(52, 52, 54, 56, 57, 60, 61, 65, 70, 120)

b) 
p_a

c)
p_a[1]

d)
p_a[10]

e)
length(p_a)

f)
"m" = function(v_p_a)
{
    media = 0
    for (i in 1:length(v_p_a))
    {
        media = media + v_p_a[i]
    }
    media = media/length(v_p_a)
    media
}
m(p_a)

g)
median(p_a)


#Exercício 2

"md" = function(v_p_a) {
    print(names(sort(-table(as.vector(v_p_a))))[1])
}
md(p_a)

#Exercício 3

a) 
turma_1 = c(75.02786847, 56.51450656, 55.57517955, 62.00893933, 
            82.82022277, 91.78076684, 71.53028442, 82.22315417, 
            71.14621041, 76.27644453)

turma_2 = c(63.96213546, 51.00946728, 54.48449137, 53.62955058, 
            61.62138863, 59.99119596, 57.61297576, 62.52220793, 
            64.54041384, 63.95477107)

b)
m_1 = paste("Média da turma 1: ", mean(turma_1))
m_1
m_2 = paste("Média da turma 2: ", mean(turma_2))
m_2

c)
diff(range(turma_1))
diff(range(turma_2))

#Exercício 4

cardapio = c('File a Parmegiana', 'Feijoada', 'Batatas Fritas', 'Lasanha a Bolonhesa', 'Salada Caprese')
precos = c(32.50, 44.00, 12.00, 35.50, 27.00)
cardapio.preco = data.frame(cardapio, precos)
cardapio.preco

#Exercício 5

a) 
matriz = matrix(1:6,2, 3 )
matriz
   
b) 
matriz[2,3]

c) 
dim(matriz)

d) 
sum(matriz)

e) 
sum(matriz[1,])

f) 
m = c(mean(matriz[,1]),mean(matriz[,2]),mean(matriz[,3]))
m
    
#Exercício 6

a) 
A = matrix(2, 2, 3)
A
B = matrix(1:6, 2, 3)
B 

b) 
A + B

c) 
dim(B) = c(3, 2)
B

d) 
A%*%B

#Exercício 7
a) 
lis = list(n = "João", idade = 30)
lis

b) 
lis$nome
lis[[1]]
lis$idade
lis[[2]]
