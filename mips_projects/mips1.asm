.data # segmento de dados

str1: .asciiz "\nEntre com o valor de x: " #asciiz = manda mensagem na tela
str2: .asciiz "\nEntre com o valor de y: "
str3: .asciiz "\nA soma de x e y é igual a: "

.text # segmento de código


main:
	li $v0, 4 # $v0 indica o código de chamada // 4 = print_string
	la $a0, str1
	#syscall # mostra a mensagem em str1 // $a0 = argumento

	li $v0, 5 # $v0 indica o código de chamada // 5 = read_int
	#syscall # litura do valor
	add $s1, $v0, $zero #salva o valor de $v0 em $s1 (é somado com zero para não dar divergência no valor)

	li $v0, 4
	la $a0, str2
	#syscall # mostra a mensagem em str2

li $v0, 5
#syscall
add $s2, $v0, $zero

add $s0, $s1, $s2 # executa a soma dos valores de $s1 e $s2 e salva o resultado em $s0

li $v0, 4
la $a0, str3
#syscall # mostra mensagem em str3

li $v0, 1 # $v0 chama o código // 1 = print_int
add $a0, $s0, $zero # adiciona no argumento $a0 o resultado salvo em $s0 somado com $zero para não dar divergência no valor
#syscall # mostra resultado da soma dosvalores de $s1 e $s2