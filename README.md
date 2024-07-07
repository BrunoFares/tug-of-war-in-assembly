# tug-of-war-in-assembly

MARS Simulator Tug-of-War Game in MIPS Assembly

By Bruno Fares and Peter Khaled 

My friend Peter and I worked on this project for our Computer Architecture course.

1. The Game

This report details a tug-of-war game developed using MIPS assembly language on the MARS 
simulator. The game is designed for two players and utilizes the F and K keys for gameplay. 
• Game Start: The program prompts users to press either the F or K key to initiate the 
game. 
• Gameplay: 
• Pressing F moves Fady the dummy one display unit to the right. 
• Pressing K moves Fady the dummy one display unit to the left. 
• Winning Condition: The game continues until Fady the dummy reaches either the left or 
rightmost edge of the screen. The side that reaches the edge first scores a point. The game 
is played in a best-of-three format. 

2. Design

The game utilizes a pixel-by-pixel approach for all on-screen elements. This is achieved through: 
• Arrays: The game screen, intro text, and the dummy are all represented using arrays. 
Each element in the array corresponds to a single display unit on the screen, which is a 
square of 32x32 pixels. 
• RGB Colors: Individual display unit colors are defined using HEX values for Red, Green, 
and Blue components (RGB). This allows for precise control over the visual appearance 
of each element. 
• Intro Text: The introductory text prompt instructing players to press F or K is displayed 
conditionally. A specific register, $s7, is used as a flag. When $s7 is equal to zero, the 
intro text is displayed on the screen. Once the game starts (upon pressing F or K), $s7 is 
incremented once, causing the intro text to disappear. 
• Dummy Movement: The dummy is also implemented using an array. When the F or K 
key is pressed, the following occurs: The first element in the dummy array (representing 
the top-leftmost display unit) is shifted in the corresponding direction (right for F, left for 
K). The remaining elements in the dummy array are adjusted accordingly to maintain its 
visual continuity. 
• Game Over State: When either of the players reaches a score of 2, the game is completely 
over, and we have (1) “GAME OVER” written on the display, (2) either “K wins!” or “F 
wins!” in the output box, depending on the winning player, and (3) a little piece of music, 
inspired by the “Game Over Music” from the popular video game “Undertale”, indicating 
the end of the game.
 
3. Task Distribution

During the first three weeks of the project, we were able to meet twice a week at the NDU library 
to work on our ideas for the project, and start writing its code. We managed to work our way 
through approximately half of the project, including the entire background and the system for the 
movement of the dummy. After that, we had to work separately on it. Bruno was responsible for 
the Game Over functionality and its music, whilst Peter worked on the points system and output 
messages, as well as adding the tree to the background, which wasn’t previously available. 

4. Conclusion 

This report demonstrates the development of a two-player tug-of-war game on the MARS 
simulator using MIPS assembly language. The game leverages pixel-by-pixel design with arrays 
and RGB colors for visual elements. The conditional display of the intro text and the shifting 
mechanism for the rope illustrate the utilization of registers and array manipulation techniques.
