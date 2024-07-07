 .data
	display: .space 1024
	lightBlue: .word 0x87ceeb
	lightGreen: .word 0x00aa00
	white: .word 0xffffff
	black: .word 0x000000
	red: .word 0xff0000
	darkGreen: .word 0x027706
	brown: .word 0x6B2904
	yellow: .word 0xFBF003
	darkBlue: .word 0x0000A0
	charF: .byte 'F'
	charK: .byte 'K'
	userInput: .space 2
	newLine: .asciiz "\n"
	introduction: .asciiz "Challenge time!\nThe goal of the game is to mash the buttons as much as possible to push Fady the dummy to the opposite side.\nPlayer 1 has to mash the button F, Player 2 has to mash the button K.\nActivate caps-lock to play.\nGood luck, have fun!!\n\n"
	FtoWin: .asciiz "F Wins!"
	KtoWin: .asciiz "K Wins!"
	FRound: .asciiz "F wins this round!"
	KRound: .asciiz "K wins this round!"
	
.text
	lw $s0, display
	lb $s1, charF
	lb $s2, charK
	lw $s6, newLine
	lw $t0, lightBlue
	lw $t1, lightGreen
	lw $t2, white
	lw $t3, black
	lw $t4, red
	lw $t5, darkGreen
	lw $t6, brown
	lw $t7, yellow
	li $t9, 0
	li $t8, 540
	li $s7, 0
	li $s4, 0
	li $s5, 0
	lw $s3, darkBlue
	
sky_colour:
	# loop to fill the colour of the sky
	sw $t0, display($t9)
	addi $t9, $t9, 4
	bne $t9, 896, sky_colour
	
grass_colour:
	# loop to fill the colour of the grass
	sw $t1, display($t9)
	addi $t9, $t9, 4
	bne $t9, 1024, grass_colour
	li $t9, 68
	
sun:
	# a series of instructions to colour the sun
	sw $t7, display($t9)
	addi $t9, $t9, 4
	sw $t7, display($t9)
	addi $t9, $t9, 60
	sw $t7, display($t9)
	addi $t9, $t9, 4
	sw $t7, display($t9)
	li $t9, 80
	
clouds:
	# a series of instructions- to colour the clouds
	sw $t2, display($t9)
	addi $t9, $t9, 4
	bne $t9, 92, clouds
	addi $t9, $t9, 56
	sw $t2, display($t9)
	addi $t9, $t9, 4
	sw $t2, display($t9)
	addi $t9, $t9, 4
	sw $t2, display($t9)
	addi $t9, $t9, 4
	sw $t2, display($t9)
	addi $t9, $t9, 76
	sw $t2, display($t9)
	addi $t9, $t9, 4
	sw $t2, display($t9)
	li $t9, 524
	
tree:
	# a series of instructions to colour the trees
	sw $t5, display($t9)
	addi $t9, $t9, 60
	sw $t5, display($t9)
	addi $t9, $t9, 4
	sw $t5, display($t9)
	addi $t9, $t9, 4
	sw $t5, display($t9)
	addi $t9, $t9, 60
	sw $t5, display($t9)
	addi $t9, $t9, 60
	sw $t5, display($t9)
	addi $t9, $t9, 4
	sw $t5, display($t9)
	addi $t9, $t9, 4
	sw $t5, display($t9)
	addi $t9, $t9, 56
	sw $t5, display($t9)
	addi $t9, $t9, 4
	sw $t6, display($t9)
	addi $t9, $t9, 4
	sw $t5, display($t9)
	addi $t9, $t9, 60
	sw $t6, display($t9)
		
char:
	# a series of instructions to draw the dummy
	sw $t2, display($t8)
	addi $t8, $t8, 4
	sw $t4, display($t8)
	addi $t8, $t8, 60
	sw $t4, display($t8)
	addi $t8, $t8, 4
	sw $t2, display($t8)
	addi $t8, $t8, 60
	sw $t2, display($t8)
	addi $t8, $t8, 4
	sw $t4, display($t8)
	addi $t8, $t8, 60
	sw $t4, display($t8)
	addi $t8, $t8, 4
	sw $t2, display($t8)
	addi $t8, $t8, 60
	sw $t2, display($t8)
	addi $t8, $t8, 4
	sw $t4, display($t8)
	addi $t8, $t8, 60
	sw $t4, display($t8)
	addi $t8, $t8, 4
	sw $t2, display($t8)
	addi $t8, $t8, -324
	
scoreF:
	# if s4 (the score of the player on F) is equal to 1, branch to scoreFOne
	beq $s4, 1, scoreFOne
	
	# a series of instructions to draw a red zero on the top left corner of the display
	li $t9, 0
	sw $t4, display($t9)
	addi $t9, $t9, 4
	sw $t4, display($t9)
	addi $t9, $t9, 4
	sw $t4, display($t9)
	addi $t9, $t9, 56
	sw $t4, display($t9)
	addi $t9, $t9, 8
	sw $t4, display($t9)
	addi $t9, $t9, 56
	sw $t4, display($t9)
	addi $t9, $t9, 4
	sw $t4, display($t9)
	addi $t9, $t9, 4
	sw $t4, display($t9)
	
	# skip the scoreFOne and jump to scoreK
	j scoreK
	
scoreFOne:
	# a series of instructions to draw a red one on the top left corner of the display
	li $t9, 4
	sw $t4, display($t9)
	addi $t9, $t9, 64
	sw $t4, display($t9)
	addi $t9, $t9, 64
	sw $t4, display($t9)
	
scoreK:
	# if s5 (the score of the player on F=K) is equal to 1, branch to scoreKOne
	beq $s5, 1, scoreKOne
	
	# a series of instructions to draw a blue zero on the top right corner of the display
	li $t9, 52
	sw $s3, display($t9)
	addi $t9, $t9, 4
	sw $s3, display($t9)
	addi $t9, $t9, 4
	sw $s3, display($t9)
	addi $t9, $t9, 56
	sw $s3, display($t9)
	addi $t9, $t9, 8
	sw $s3, display($t9)
	addi $t9, $t9, 56
	sw $s3, display($t9)
	addi $t9, $t9, 4
	sw $s3, display($t9)
	addi $t9, $t9, 4
	sw $s3, display($t9)
	
	j introTextRender
	
scoreKOne:
	# a series of instructions to draw a blue one on the top right corner of the display
	li $t9, 56
	sw $s3, display($t9)
	addi $t9, $t9, 64
	sw $s3, display($t9)
	addi $t9, $t9, 64
	sw $s3, display($t9)
	
introTextRender:
	# if s7 (0 if this is the first rendering of the display, 1 if not) is equal to 0,
	# branch to introText, else continue to input
	beq $s7, $zero, introText
	
input:
	# prompt the user for a one character input
	li $v0, 8
	la $a0, userInput
	la $a1, 2
  	syscall
	
	# load the character input inside a0
	lb $a0, userInput
	
	# reset t9 to 0
	li $t9, 0
	
	# if a0 (user input) is equal to s1 (character F), branch to InputIsF
	# else if a0 is equal to s2 (character K), branch to InputIsK
	# else jump to input
	beq $a0, $s1, InputIsF
	beq $a0, $s2, InputIsK
	j input
	
InputIsF:
	# add 4 to the value of t8, which is the value of the position of the dummy
	addi $t8, $t8, 4
	
	# print the value of t8 in the output box
	li $v0, 1
	add $a0, $zero, $t8
	syscall
	
	# enter a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# if t8 (position of the dummy) is equal to 572 (touching the right edge of the display)
	# branch to end, else jump to sky_colour
	beq $t8, 572, end
	j sky_colour

InputIsK:
	# subtract 4 to the value of t8, which is the value of the position of the dummy
	addi $t8, $t8, -4
	
	# print the value of t8 in the output box
	li $v0, 1
	add $a0, $zero, $t8
	syscall
	
	# enter a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# if t8 (position of the dummy) is equal to 508 (touching the left edge of the display)
	# branch to end, else jump to sky_colour
	beq $t8, 508, end
	j sky_colour
	
introText:
	# output the text for the introduction
	li $v0, 4
	la $a0, introduction
	syscall
	
	# increment s7 so that introTextRender doesn't branch here anymore
	addi $s7, $s7, 1
	
	# series of instructions to draw an F and a K on the display
	li $t9, 324
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 28
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 40
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 32
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 20
	sw $t3, display($t9)
	addi $t9, $t9, 40
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 40
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)

main:
	# jump to input and link back to main
	jal input
	
end:
	# series of instructions to write 'game over' on the display
	addi $t9, $zero, 64
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 132
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 16
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 12
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 4
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	addi $t9, $t9, 8
	sw $t3, display($t9)
	
	# if the dummy's position is 572, branch to Fwin
	# else if it's at 508, branch to Kwin
	beq $t8, 572, Fwin
	beq $t8, 508, Kwin
	
Fwin:
	# increment the score of F by 1
	addi $s4, $s4, 1
	
	# print in the output box that F has won this round
	li $v0, 4
	la $a0, FRound
	syscall
	
	# skip Kwin and jump to after
	j after
	
Kwin:
	# increment the score of K by 1
	addi $s5, $s5, 1
	
	# print in the output box that K has won this round
	li $v0, 4
	la $a0, KRound
	syscall
	
after:
	# if the score of F is 2, branch to FwinMsg
	# else if the score of K is 2, branch to KwinMsg
	beq $s4, 2, FwinMsg
	beq $s5, 2, KwinMsg
	
	# reset the dummy's position
	li $t8, 540
	
	# jump back to main
	j main
	
FwinMsg:
	# print the message that F wins the game
	li $v0, 4
	la $a0, FtoWin
	syscall
	
	j final
	
KwinMsg:
	# print the message that K wins the game
	li $v0, 4
	la $a0, KtoWin
	syscall
	
final:
	# a series of instructions that play a little melody
	# when the game is over (inspired by Undertale OST - Game Over
	li $v0, 31
	li $a0, 79
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 500
	syscall
	
	li $v0, 31
	li $a0, 78
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 400
	syscall
	
	li $v0, 31
	li $a0, 76
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 400
	syscall
	
	li $v0, 31
	li $a0, 74
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall

	li $v0, 32
	li $a0, 400
	syscall

	li $v0, 31
	li $a0, 76
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 300
	syscall
	
	li $v0, 31
	li $a0, 72
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 500
	syscall
	
	li $v0, 31
	li $a0, 74
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 700
	syscall
	
	li $v0, 31
	li $a0, 70
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 700
	syscall
	
	li $v0, 31
	li $a0, 78
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 500
	syscall
	
	li $v0, 31
	li $a0, 79
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 500
	syscall
	
	li $v0, 31
	li $a0, 80
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 600
	syscall
	
	li $v0, 31
	li $a0, 81
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 700
	syscall
	
	li $v0, 31
	li $a0, 86
	li $a1, 500
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 700
	syscall
	
	li $v0, 31
	li $a0, 83
	li $a1, 1000
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 10
	syscall
