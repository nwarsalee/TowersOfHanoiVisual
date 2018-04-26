// Class file for the discs of the tower
// Nabeel Warsalee A23 2018

class Disc {
  float r, x, y, dx = 10, dy = 10; // Float for the width of the disc
  float[] colours = new float[3]; // Array for the colour of the discs
  // Default constructor
  public Disc() {
    this.r = 0; // Default width is 0
    for (float colour : colours) {
      colour = random(1); // Choosing a random colour
    }
  }

  // Constructor for the disc object
  public Disc(float radius, float xPos, float yPos) {
    this.r = radius; // Sets the radius to the entry of the parameter
    this.x = xPos; // Sets the value of the x position
    this.y = yPos; // Sets the value of the y position
    // Setting the colour from disc 1 to 5
    switch((int)radius) {
      case 1 :   
        colours[0] = 255;
        colours[1] = 0;
        colours[2] = 0;
        break;
      case 2 :   
        colours[0] = 0;
        colours[1] = 255;
        colours[2] = 0;
        break;
      case 3 :   
        colours[0] = 0;
        colours[1] = 0;
        colours[2] = 255;
        break;
      case 4 :   
        colours[0] = 255;
        colours[1] = 0;
        colours[2] = 255;
        break;
      case 5 :   
        colours[0] = 0;
        colours[1] = 255;
        colours[2] = 255;
        break;
      case 6 :   
        colours[0] = 255;
        colours[1] = 255;
        colours[2] = 0;
        break;
      case 7 :   
        colours[0] = 255;
        colours[1] = 136;
        colours[2] = 0;
        break;
      case 8 :   
        colours[0] = 106;
        colours[1] = 0;
        colours[2] = 255;
        break;
      case 9 :   
        colours[0] = 0;
        colours[1] = 72;
        colours[2] = 255;
        break;
      case 10 :   
        colours[0] = 255;
        colours[1] = 0;
        colours[2] = 229;
        break;
      default :   
        colours[0] = 100;
        colours[1] = 100;
        colours[2] = 100;
        break;
    }
  }

  // Instance method to display the disc
  void showDisc() {
    rectMode(CENTER);
    fill(this.colours[0], this.colours[1], this.colours[2]);
    rect(x, y, 50*r, 30);
  }

  // Instance method to move the discs in the x direction from one peg to another
  void moveDisc(Pegs startPeg, Pegs endPeg) {
     if (startPeg.xPos < endPeg.xPos && x < endPeg.xPos) { // If the starting peg is to the left, will move to the right
       x += dx;
     }
     else if (startPeg.xPos > endPeg.xPos && x > endPeg.xPos) {
         x -= dx;
     }
  }
  
  // Method to check if the disc has stopped
  boolean discStopped(Pegs startPeg, Pegs endPeg) {
    if (x == endPeg.xPos) {
      return true;
    }
    else {
      return false;
    }
  }

  // Moving the disc up and down (y direction)
  void moveDiscY(float direction) {
    if (direction > 0) {
      do {
        y -= dy;
      } while (y<200);
    } else {
      do {
        y += dy;
      } while (y>(height));
    }
  }
}