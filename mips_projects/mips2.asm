#Atividade: Avalia��o 01 � Programa��o em Linguagem deMontagem
#Exerc�cio 02
#Aluno: Nathalia Suzin e Felipe dos Santos
#Em C++:
#include <iostream>
#using namespace std;
#int main() {
# for(int i=0;i<10;i++)
# cout << "[" << i << "]";
# return 0;
#}
		.data 		# segmento de dados
	cont: .asciiz "Contador de 1 a 10: "
		.text 		# segmento de c�digo
main:
	addi $s0, $zero, 0 # i=0
	li $v0, 4
	la $a0, cont
	#syscall
Loop:
	slti $t0, $s0, 10	# se i < 10 ent�o $t0 = 1 sen�o $t0 = 0
	beq $t0, $zero, Exit	# se $t0 = 0 ent�o Exit
	li $v0, 1
	add $a0, $s0, $zero
	#syscall
	addi $s0, $s0, 1 # $s0 + 1
	j Loop
Exit: nop