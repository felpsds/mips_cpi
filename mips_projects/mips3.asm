#Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 01 – Programação em Linguagem de Montagem
#Exercício 03
#Aluno: Nathalia Suzin e Felipe dos Santos
#include <iostream>
#using namespace std;
#int main() {
# int i, vet[8];
# for(i=0;i<8;i++){
# cout << "Entre com A[" << i << "]: ";
	# cin >> vet[i];
# }
# for(i=0;i<8;i++)
# cout << "\nA[" << i << "] = [" << vet[i] << "]";
# return 0;
#}
		.data
	contStr: .asciiz "\nEntre com A["
	contVet: .asciiz "\nA["
	contEnd: .asciiz "]: "
	vet: .word 0,0,0,0,0,0,0,0
		.text
main:
	la $s1, vet		# guarda no $s1 o endereco do vet
	addi $s0, $zero, 0	# guarda no $s0 o valor 0 // para que o i nao receba qualquer valor que ja esteja guardado na memoria
	
loop1:
	li $v0, 4		# carrega o servico 4 (Ponteiro para string)
	la $a0, contStr		# carrega ptr p/ string (Mostra mensagem na tela)
	#syscall			# Chama o servico 4
	
	li $v0, 1		# carrega o servico 1 (inteiro)
	la $a0, ($s0)		# carrega no $a0 o valor inteiro do $s0 (valor do loop / Entre com A[ "i" ])
	#syscall			# Chama o servico 1
		
	li $v0, 4		# carrega o servico 4 (Ponteiro para string)
	la $a0, contEnd		# carrega ptr p/ string (Mostra a mensagem na tela)
	#syscall			# Chama o servico 4
	
	li $v0, 5		# carrega o servico 5
	#syscall			# Chama o servico 5
	add $t2, $v0, $zero	# o que o usuario digitar sera adicionado ao $s1
	
	add $t1, $s0, $s0	# $t1 = 2.i
 	add $t1, $t1, $t1	# $t1 = 4.i
 	add $t1, $t1, $s1	# $t1 = endereco base + 4.i (deslocamento) = endereco absoluto do vetor A 
	sw $t2, 0($t1)		# Guarda na posição da memória $t1 o valor digitado ($t2)
	addi $s0, $s0, 1	# i++

	blt $s0,8, loop1	# Desvia se menor que 8, equanto $s0 (loop), for menor que 8, vai redirecionar para o loop1
	addi $s0, $zero, 0	# Quando o loop acabar o i = 0 para ser usado novamente
loop2:
	li $v0, 4		# carrega o servico 4 (Ponteiro para string)
	la $a0, contVet		# carrega ptr p/ string (Mostra a mensagem na tela)
	#syscall			# Chama o servico 4
	
	li $v0, 1		# carrega o servico 1 (inteiro)
	la $a0, ($s0)		# carrega no $a0 o valor inteiro do $s0 (loop)
	#syscall			# Chama o servico 1

	li $v0, 4		# carrega o servico 4 (Ponteiro para string)
	la $a0, contEnd		# carrega ptr p/ string (Mostra a mensagem na tela)
	#syscall			# Chama o servico 4
	
	add $t1, $s0, $s0	# $t1 = 2.i
 	add $t1, $t1, $t1	# $t1 = 4.i
 	add $t1, $t1, $s1	# $t1 = endereco base + 4.i (deslocamento) = endereco absoluto do vetor A
 	lw $t2, 0($t1)		# Recupera da posição da memória $t1 o valor guardado
	
	li $v0, 1		# carrega o servico 1 (inteiro)
	la $a0, ($t2)		# carrega ptr p/ string (Mostra a mensagem na tela)
	#syscall			# Chama o servico 1
	addi $s0, $s0, 1	# i++
	
	blt $s0,8, loop2	# Desvia se menor que 8, equanto $s0 (loop), for menor que 8, vai redirecionar para o loop
	j Exit			# Quando o loop chegar em 8, J = Jump, vai pular para o Exit.
Exit:
	nop			# Null operation, ele ira terminar o codigo e nao fara mais nada!
