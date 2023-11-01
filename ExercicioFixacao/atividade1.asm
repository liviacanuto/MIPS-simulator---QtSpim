.data
#Somar N números inteiros, sendo N uma variável definida pelo usuário, 
#n + n-1 + n-2 + ... + 2 + 1
#com as mensagens:
#msgem1: .asciiz “Defina a qtde de inteiros a serem somados: “
#msgem2: .asciiz “O resultado eh: “
#Teste com os valores 5, 10, 15


msg1: .asciiz "Defina a qtde de inteiros a serem somados: "
msg2: .asciiz "O resultado eh: "
 
.text
.globl main
 
main:
    li $v0, 4 #instrucao de escrever string
    la $a0, msg1 
    syscall
    li $v0, 5 #instrucao de ler int
    syscall
    move $t0, $v0 #move o valor lido em  $v0 para $t0
    li $t1, 0 #iniciliza $t1 com 0
    li $t3, 0 #inicializa com 0 (sera sempre 0)
    li $t4, 1 #iniciliza com 1 (sera sempre 1)
    
while:
    beq $t0, $t3, exit #se $t0 == 0, pula pra exit
    add $t1, $t1, $t0
    sub $t0, $t0, $t4
    j while #volta para a linha while
 
exit:    
    li $v0, 4 #instrucao de escrever string
    la $a0, msg2 
    syscall
    
    li $v0, 1 #instrucao de escrever int
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall