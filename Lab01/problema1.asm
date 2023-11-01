.data
 
list: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
msgem1: .asciiz "Defina o numero a ser convertido (ate 1024): \n"
 
.text
.globl main
 
main:
    li $v0, 4                           #instrucao de escrever string
    la $a0, msgem1                      #exibit msgem1
    syscall
 
    li $v0, 5                           #instrucao de ler int
    syscall
    move $t3, $v0                       #coloca o valor recebido em $t3
 
    la $t1, list                        # pega o comeco do vetor
    li $t2, 2                           # inicializa $t2 com 2
    li $t4, 4                           # inicializa $t4 com 4
    li $t5, 0                           # inicia $t5 no zero
    li $t7, 0                           # inicia contador 
    li $t8, 1                           # inicia contador aux
 
 
loop:
    beq $t3, $zero, print_loop          # checa se a array chegou no final
 
    div $t3, $t2                        # divide o num recebido por 2
 
    mfhi $t6                            # coloca resto numa aux
    sw $t6, list($t5)                   # coloca o valor da aux no vetor
 
    mflo $t3                            # coloca o resultado da divisao no num
 
    addi $t5, $t5, 4                    # avanca no contador do vetor
    addi $t1, $t1, 4                    # avanca no vetor
    addi $t8, $t8, 1                    # adiciona 1 no contador
 
    j loop                              # repete loop
 
print_loop:
    beq $t7, $t8, end                   # se chegou no limite vai pro end
 
    lw $a0, ($t1)                       # print o valor do vetor
    li $v0, 1
    syscall
    
    sub $t5, $t5, $t4                   # avanca no contador do vetor
    sub $t1, $t1, $t4                   # avanca no vetor 
    addi $t7, $t7, 1                    # adiciona 1 no contador
    j print_loop                        # repete o loop
 
end:
    li $v0, 10
    syscall