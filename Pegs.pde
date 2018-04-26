class Pegs{
    float levels, xPos, l = 400;
    boolean[] occupied = new boolean[5]; // Boolean array for occupied spaces, NEVER USED
    
    // Default constructor
    public Pegs() {
      levels = 10; // Giving the number of total discs allowed on a peg
      for (boolean occup : occupied) { // Auto initializing the occupancy of the levels
        occup = false;
      }
      xPos = 0;
    }
    
    // Constructor
    public Pegs(float x) {
      levels = 10; // Giving the number of total discs allowed on a peg
      for (boolean occup : occupied) { // Auto initializing the occupancy of the levels
        occup = false;
      }
      xPos = x;
    }
    
    // Method to update the level occupancy of the peg
    void updatePeg() {
      
    }
    
    // Method to draw the peg
    void showPeg() {
      fill(84, 43, 0); // Brown colour for the peg
      rectMode(CENTER);
      rect(xPos, height - (l/2), 25, l);
    }









}