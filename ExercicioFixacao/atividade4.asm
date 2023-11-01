.data

msgem1: .asciiz "Define um inteiro: "
msgem2: .asciiz "A soma de seus digitos eh: "
 
.text
.globl main
 
main:
    li $v0, 4 #instrucao de escrever string
    la $a0, msgem1 
    syscall
    
    li $v0, 5 #instrucao de ler int
    syscall
    
    move $t0, $v0 #move o valor lido em  $v0 para $t0
    
    li $t1, 10 #iniciliza $t1 com 0
    li $t2, 0 #inicializa com 0 (vai ser sempre 0)
    li $t3, 0 #inicializa com 0
    li $t4, 0 #inicializa com 0
        
while:
    beq $t0, $t2, exit #se $t0 == 0, pula pra exit
    div $t0, $t1
    mflo $t0
    mfhi $t3
    add $t4, $t4, $t3
    j while #volta para a linha while
 
exit:    
    li $v0, 4 #instrucao de escrever string
    la $a0, msgem2 
    syscall
    
    li $v0, 1 #instrucao de escrever int
    move $a0, $t4
    syscall
    
    li $v0, 10
    syscall
