// Nabeel Warsalee
// ICS4U
// Recursive Assignment
// April 23 2018
// Towers of Hanoi Visual component

Pegs[] peg = new Pegs[3]; // Array for the pegs
Disc[] disc = new Disc[13]; // Array for the discs on the tower

ArrayList<String> moves = new ArrayList<String>(); // Array list to store the moves of the discs as a string

int discNum, counter; // Int for the number of discs to be used

boolean titleScreen; // Boolean for whether or not to play the titlescreen

void setup() {
  size(1800, 500); // Creating the size of the canvas
  titleScreen = true;
  counter = 0;
  discNum = 1;
  // Setting the position of the pegs
  peg[0] = new Pegs(400);
  peg[1] = new Pegs(width/2);
  peg[2] = new Pegs(1400);
}


void draw() {
  background(200);
  // Doing things for the title screen
  if (titleScreen) {
    textAlign(CENTER);
    rectMode(CENTER);
    textSize(150);
    fill(255);
    text("Towers of Hanoi", 600, height/2);
    textSize(75);
    text("By Nabeel Warsalee", 600, height/2 + 70);
    fill(255);
    text("Discs : " + discNum, 1500, 250);
    fill(0,0,255);
    rect(800, 400, 200, 100); // Rectangle for start the game
    textSize(50);
    fill(255);
    text("START", 800, 420);
    fill(0,255,0);
    rect(1500, 100, 100, 100); // Rectangle for the increase discs
    fill(255);
    textSize(100);
    text("+", 1500, 125);
    fill(255,0,0);
    rect(1500, 400, 100, 100); // Rectangle for decreasing discs
    fill(255);
    text("-", 1500, 425);
  } else {
    // Displaying the pegs
    for (int i=0; i<peg.length; i++) {
      peg[i].showPeg();
    }
    // Displaying the discs
    for (int i=0; i<discNum; i++) {
      disc[i].showDisc();
    }
    // If the counter is less than the number of moves needed to complete the towers, than proceeds with the move
    if (counter < moves.size()) {
      // Reading the information from the movelist array
      int discN = Integer.parseInt(moves.get(counter).split(" ")[0]) - 1; // For the n disc, splits the move string into three different strings, and parses them into integers
      int startPeg = Integer.parseInt(moves.get(counter).split(" ")[1]) - 1; // For the start peg, splits the move string into three different strings, and parses them into integers
      int endPeg = Integer.parseInt(moves.get(counter).split(" ")[2]) - 1;  // For the end peg, splits the move string into three different strings, and parses them into integers
      println("move " + moves.get(counter));
      println("Start peg : " + startPeg + "   End peg : " + endPeg);

      if (disc[discN].discStopped(peg[startPeg], peg[endPeg])) { // Checking if the disc has stopped, will add on to the counter to move to the next move
        counter++;
      } else { // If it hasn't stopped, continues its movement
        disc[discN].moveDisc(peg[startPeg], peg[endPeg]);
      }
    } else {
      // Displaying the text for when the moves are completed
      textSize(300);
      fill(255, 0, 0);
      text("FINISHED", width/2, height/2+100);
      textAlign(CENTER);
      textSize(100);
      fill(255, 255, 0);
      text("Made by Nabeel Warsalee", width/2, height/2+200);
      textSize(30);
      text("Press any key to continue...", width/2, height/2+230);
      // Will reset the demo
      if (keyPressed) {
        reset();
      }
    }
  }
}


// Function to give the exact steps on how to solve the Towers of Hanoi problem
// Parameters for the number of disks, the peg it's moving from, the peg it's going to and the auxiliary
void towerOfHanoi(int n, int start_peg, int end_peg, int aux_peg) {
  // Terminating statement, if 1 disk is being moved from the first peg, moves it to the last peg
  if (n==1) {
    moves.add(n + " " + start_peg + " " + end_peg); // Adding the move to the array list
  } else if (n<1) {
    throw new RuntimeException("Only positive numbers allowed...");
  }
  // If it's not moving the last disc, moves the disc above it 
  else {
    towerOfHanoi(n-1, start_peg, aux_peg, end_peg); // Moves that disc to the intermediate peg
    moves.add(n + " " + start_peg + " " + end_peg);   // Adding the move tot he array list
    towerOfHanoi(n-1, aux_peg, end_peg, start_peg); // Takes it from the auxiliary peg and moves it to the last peg
  }
}


// Method for the start program button
boolean startButton() {
  if (mouseX >= 700 && mouseX <= 900 && mouseY >= 350 && mouseY <= 450) {
    return true;
  } else {
    return false;
  }
}

// Button for increasing the number of discs
boolean incButton() {
  if (mouseX >= 1450 && mouseX <= 1550 && mouseY >= 50 && mouseY <= 150) {
    return true;
  } else {
    return false;
  }
}

// Button for decreasing the number of discs
boolean decButton() {
  if (mouseX >= 1450 && mouseX <= 1550 && mouseY >= 350 && mouseY <= 450) {
    return true;
  } else {
    return false;
  }
}

// Method for what to do when mouse is pressed in a certain area
void mousePressed() {
  if (startButton()) {
    titleScreen=false;
    // Calling on the towers of Hanoi method to store the move list in the array list
    towerOfHanoi(discNum, 1, 3, 2);
    // Creating discs
    for (int i = discNum-1; i>=0; i--) {
      disc[i] = new Disc(i+1, peg[0].xPos, height-((discNum-i)*30)+15);
    }
  } else if (incButton()) {
    if (discNum + 1 <= disc.length) {
      discNum++;
    }
  } else if (decButton()) {
    if (discNum - 1 > 0) {
      discNum--;
    }
  }
}

// Method to reset the program upon a key press after it has done the moves
void reset() {
  setup();
}