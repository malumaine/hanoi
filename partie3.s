.data
msg1:.asciiz "\nDeplacer le disque de la tour "
msg1_2:.asciiz "  a la tour  "
msg2:.asciiz "Il faut "
msg2_2:.asciiz " deplacement pour deplacer les "
msg2_3:.asciiz " disques de la tour A vers la tour c en utilisant la tour B. \n"
A:.asciiz "A"
B:.asciiz "B"
C:.asciiz "C"
msg12:.asciiz "Entrer le nombre de disque a deplacer: \n"
p:.word,2
i:.word,1
saut:.asciiz "\n"
.text
.globl main
main:
li $v0,4
la $a0,msg12
syscall
li $v0,5
syscall
move $t5,$v0
li $t0,0
lw $t1,p
lw $t3,i
loop:
beq $t0,$t5,end_loop
mul $t3,$t3,$t1
addi $t0,$t0,1
j loop
end_loop:
addi $t3,$t3,-1
li $v0,4
la $a0,msg2
syscall
li $v0,1
move $a0,$t3
syscall
li $v0,4
la $a0,msg2_2
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,4
la $a0,msg2_3
syscall
move $a0,$t5
la $a1,A
la $a3,B
la $a2,C
move $t2,$a0
jal hanoi
li $v0,4
la $a0,saut
syscall
li $v0, 10     
syscall
hanoi:
lw $t0,i
beq $a0,$t0,end
addi $a0,$a0,-1
move $t1,$a3
move $a3,$a2
move $a2,$t1
jal hanoi
lw $a0,i
move $t1,$a3
move $a3,$a2
move $a2,$t1
jal hanoi
move $a0,$t2
addi $t2,$t2,-1
addi $t2,$t2,-1
addi $t2,$t2,1
move $t1,$a1
move $a1,$a2
move $a2,$t1
jal hanoi
jr $ra
end:
li $v0,4
la $a0,msg1
syscall
li $v0,4
move $a0,$a1
syscall
li $v0,4
la $a0,msg1_2
syscall
li $v0,4
move $a0,$a3
syscall 
jr $ra