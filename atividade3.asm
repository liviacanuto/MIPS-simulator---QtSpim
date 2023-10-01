#Calcular potencia de 2 de um numero inteiro
#que eh fornecido pelo usuario
 
.data
 
msgem1: .asciiz "Defina o inteiro a ser testado: "
msgem2: .asciiz "Inteiro impar"
msgem3: .asciiz "Inteiro par"
 
.text
.globl main
 
main:
	li $v0, 4 #instrucao de escrever string
	la $a0, msgem1 #exibit msgem 1
	syscall
	
	li $v0, 5 #instrucao de ler int
	syscall
	
	move $t0, $v0 #coloca o valor recebido em $t0
	li $t1, 2 #registrador t1 recebe valor 2
	div $t0, $t1 #divide valor recebido por 2
	
	mfhi $t0
	li $t1, 0
	
	beq $t0, $t1, impar
	li $v0, 4 #instrucao de escrever string
	la $a0, msgem2 #escreve msgem2
	syscall
    	j exit

impar: 
	li $v0, 4 #instrucao de escrever string
	la $a0, msgem3 #escreve msgem3
	syscall
    	
exit: 	
	li $v0, 10
	syscall
