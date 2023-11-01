.data

buffer: .space 100  
msgem: .asciiz "Defina a frase de entrada (ate 100 caracteres minusculos): \n"

.text
.globl main

main:
    li $v0, 4                   # instrucao de printar string
    la $a0, msgem               # mensagem a ser printada
    syscall

    li $v0, 8                   # instrucao de ler string
    la $a0, buffer              # endereco da string
    syscall

    li $t2, 0

    li $t3, 51                  # carrega int ascii = 3
    li $t4, 52                  # carrega int ascii = 4
    li $t5, 48                  # carrega int ascii = 0
    li $t6, 49                  # carrega int ascii = 1

loop:
    lb $a1, 0($a0)

    beq $a1, $zero, exit

    beq $a1, 79, change_0       # letra O
    beq $a1, 111, change_0      # letra o
    beq $a1, 73, change_1       # letra I
    beq $a1, 105, change_1      # letra i
    beq $a1, 69, change_3       # letra E
    beq $a1, 101, change_3      # letra e
    beq $a1, 65, change_4       # letra A
    beq $a1, 97, change_4       # letra a

    addi $a0, $a0, 1
    addi $t2, $t2, 1

    j loop

exit:
    li $v0, 4                   # instrucao de printar string
    la $a0, buffer              # a msg q sera printada sera a que esta em buffer
    syscall
    
    li $v0, 10
    syscall

change_0:
    sb $t5, buffer($t2)
    j loop

change_1:
    sb $t6, buffer($t2)
    j loop

change_3:
    sb $t3, buffer($t2)
    j loop

change_4:
    sb $t4, buffer($t2)
    j loop