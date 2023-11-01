.data
 
msgem1: .asciiz "Defina o primeiro elemento de uma progressao aritmetica: \n"
msgem2: .asciiz "Defina a razao da progressao a ser calculada: \n"
espaco: .asciiz " "
.text
.globl main
 
main:
    li $v0, 4 #instrucao de escrever string
    la $a0, msgem1 #exibit msgem 1
    syscall
    
    li $v0, 5 #instrucao de ler int
    syscall
    move $t0, $v0 #coloca o valor recebido em $t0
 
    li $v0, 4 #instrucao de escrever string
    la $a0, msgem2 #exibit msgem 1
    syscall
 
    li $v0, 5 #instrucao de ler int
    syscall
    move $t1, $v0 #coloca o valor recebido em $t1
    
    li $t2, 0 #inicializa com 0
    li $t3, 9 #inicializa com 0
 
 
while:
    beq $t2, $t3, exit #se $t0 == 0, pula pra exit
 
       li $v0, 1 #instrucao de escrever int
    move $a0, $t0
    syscall
 
    li $v0, 4 #instrucao de escrever string
    la $a0, espaco #exibir espaco
    syscall
 
    add $t0, $t0, $t1
    addi $t2, $t2, 1
 
    j while #volta para a linha while
 
exit:    
    li $v0, 1 #instrucao de escrever int
    move $a0, $t0
    syscall
    
    li $v0, 10
    syscall
×