// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(LOOP)
  // Initialize i to start at the first address of the screen
  @SCREEN
  D=A
  @i
  M=D

  // Set the entire screen to whatever is stored at @color (default 0)
  (SCREENLOOP)
    // Constant that reprsents the end of the screen (and last address)
    @24576
    D=A
    @i
    D=D-M
    @ENDSCREENLOOP
    D;JEQ
    // End the loop if we've reached the end of the screen
    @color
    D=M
    @i
    // Manually set the A register (i stores the address of the next screen
    // pixel to set)
    A=M
    M=D
    @i
    M=M+1
    @SCREENLOOP
    0;JMP
  (ENDSCREENLOOP)

  // Check for a value at the KBD address
    // If 0, jump to WHITE (no key pressed)
    // else jump to BLACK (key pressed)
  @KBD
  D=M
  @WHITE
  D;JEQ
  @BLACK
  0;JMP
(BLACK)
  // Set @color to (-1)_10 = (1111111111111111)_2
  @color
  M=-1
  // Jump to start
  @LOOP
  0;JMP
(WHITE)
  // Set @color to (0)_10 = (0000000000000000)_2
  @color
  M=0
  // Jump to start
  @LOOP
  0;JMP
