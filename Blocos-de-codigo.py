# Para blocos de código, usamos if (se) / elif (senão se) / else. 
# Quando encontrar booleanos (true / false), o Python executa o bloco de código correspondente.
# else e elif dependem de if anterior, mas o if não depende de else e elif.

# EXEMPLO 1


idade = int(input("Digite sua idade: "))
if idade < 18:
    print("Menor de idade")
elif idade == 18:
    print("Tem 18 anos")
else:
    print("Maior de idade")
    