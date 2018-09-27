# Skiathlon
Programmed in Verilog on a Basys3 board
This program introduces using the VGA screen to output a display from our basys3 board. The VGA port is controlled by the Hsync, Vsync and the RGB signals. The Hsync and Vsync oversees outputting the actual display and the RGB signals will color the screen when given a range of Hsync and Vsync signals. The screen we are outputting is 800x525 pixel grid. The actual display is 640x480 which is labeled as the active region. The product of this program is a ski game where we have a randomly generated gate that the player as to go through without crashing.

The game waits for a user input to start the skiathlon and flashes the skier 3 times as a countdown to start. There are randomized red gates that approach the skier at a set speed and the user must maneuver the skier with the left and right buttons to not hit the red bars. As the game progresses the skier will get close to the bottom of the screen and near there the skier will start flashing which indicates a point awarded to the user. The user can lose a point if at any time they hit the red gates and the game finishes with flashing blue borders and this happens when the points match the bit value of the user's switches 4-6. The game will reset the points to 0 and resets the skier to the top in every round and waits for user input to start again.


