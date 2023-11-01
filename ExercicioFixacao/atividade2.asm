#Calcular potencia de 2 de um numero inteiro
#que eh fornecido pelo usuario

.data
 
msg1: .asciiz "Defina um inteiro de entrada: "
msg2: .asciiz "O resultado de sua potencia de 2 eh: "
 
.text
.globl main
 
main:
	li $v0, 4 #instrucao de escrever string
	la $a0, msg1 
	syscall
	li $v0, 5 #instrucao de ler
	syscall
	move $t0, $v0 #coloca o valor recebido em $t0
	mul $t1, $t0, $t0 #multiplica $t0 com $t0
	
	li $v0, 4 #instrucao de escrever string
	la $a0, msg2 
	syscall

	li $v0, 1 #instrucao de escrever int
	move $a0, $t1
	syscall

	li $v0, 10
	syscall
	

