// Create an array of Flowers and Petals.
Flower [] theFlowers = new Flower[25];
Petal [] thePetals = new Petal[25]; 
Stem [] theStems = new Stem[25]; 

// How many Flowers and Petals that have been created.
int numFlowers = 0;
int numPetals = 0; 
int numStems = 0; 

// The current index position in our Bubble array.
int currentFlower = 0;
int currentPetal = 0;
int currentStem = 0;

// Size, lighting, and background color. 
void setup() {
  size(800, 500, P3D);
}

void draw() {
  // Clear the background.
  background(0, 0, 0);
	
  if (mousePressed) { 
		
		// Add flower, stem, and petals to arrays. 
    theFlowers[currentFlower] = new Flower(this, mouseX, mouseY);
		theStems[currentStem] = new Stem(this, mouseX, mouseY); 
		thePetals[currentPetal] = new Petal(this, mouseX, mouseY); 
		
    // Increase the indexes. 
    currentFlower++;
		currentStem++; 
		currentPetal++

    // Check flower array capacity. 
    if (numFlowers < theFlowers.length) {
      numFlowers++;
    } else {
      currentFlower = 0;
    }
		
		// Check stem array capacity. 
		if (numStems < theStems.length) {
			numStems++;
		} else {
			currentStem = 0;
		}
		
		// Check petals array capacity. 
		if (numPetals < thePetals.length) {
			numPetals++;
		} else {
			currentPetal = 0;
		}
	} 
	
	if (keyCode != UP) {
		// Draw Flowers and Stems
		for (int i = 0; i < numFlowers; i++) {
			theFlowers[i].display();
			theStems[i].display(); 
			thePetals[i].display();
		}
	} else {	
		// Draw Flowers and Stems and let them move
		for (int i = 0; i < numFlowers; i++) {
			theFlowers[i].move();  
			theStems[i].move(); 
			thePetals[i].move();
			theFlowers[i].display();
			theStems[i].display(); 
			thePetals[i].display();
		}
	}
}

// Flowers 
class Flower {
  // The position of this Flower.
  private float x;
  private float y;

  // The size of this Flower.
  private float size;

  // Flower color.
  private float myRed;
  private float myGreen;
  private float myBlue;

  // Flower drop speed.
  private float speedY;

  // Store a reference to the canvas.
  private PApplet canvas;

  Flower(PApplet canvas, float x, float y) {
    // Store a reference to the canvas.
    this.canvas = canvas;

    // Store x and y.
    this.x = x;
    this.y = y;

    // Randomize size.
    size = this.canvas.random(5,25);

    // Randomize center of flower to variations of orange and red color.
    myRed = this.canvas.random(190,255);
    myGreen = this.canvas.random(0, 237);
    myBlue = 0;

    // Randomize speed.
    speedY = this.canvas.random(-15, 2);
  }
	
	void display() {
		// Flower outline
		this.canvas.stroke();

		// Flower center color
		this.canvas.fill(myRed, myGreen, myBlue);

		// Draws flower with petals 
		this.canvas.ellipse(x, y, size, size);
		this.canvas.ellipse(x - 5, y, size, size);
		this.canvas.ellipse(x + 5, y, size, size);
		this.canvas.ellipse(x, y - 5, size, size);
		this.canvas.ellipse(x, y + 5, size, size);
	}
	
	void move() {
		// Updates position based on speed.
		y += speedY;
	}
	
	void stop() {
		y = y; 
	}
}

// Stems 
class Stem {
  // The position of this Stem.
  private float x;
  private float y;

  // The size of this Stem.
  private float length;
	private float width; 

  // Stem color.
  private float myRed;
  private float myGreen;
  private float myBlue;

  // Stem drop speed.
  private float speedY;

  // Store a reference to the canvas.
  private PApplet canvas;

	Stem(PApplet canvas, float x, float y) {
    // Store a reference to the canvas.
    this.canvas = canvas;

    // Store x and y.
    this.x = x;
    this.y = y;

    // Randomize length and width of stem.
    length = this.canvas.random(6,25);
		width = this.canvas.random(1,5); 
		
    // A deep green color. 
    myRed = 14;
    myGreen = 115; 
    myBlue = 61;

    // Randomize speed.
    speedY = this.canvas.random(-15, 2);
  }
	
	void display() {
		this.canvas.noStroke();
		this.canvas.fill(myRed, myGreen, myBlue);

		// Draws stem.  
		this.canvas.rect(x, y, width, length);
	}
	
	void move() {
		// Updates position based on speed.
		y += speedY;
	}
}

// Petals 
class Petal {
  // The position of this Petal.
  private float x;
  private float y;

  // The dimensions of this Petal.
  private float length;
	private float width;

  // Petal color.
  private float myRed;
  private float myGreen;
  private float myBlue;

  // Petal drop speed.
  private float speedY;
	private float speedX; 

  // Store a reference to the canvas.
  private PApplet canvas;

  Petal(PApplet canvas, float x, float y) {
    // Store a reference to the canvas.
    this.canvas = canvas;

    // Store x and y.
    this.x = x;
    this.y = y;

    // Randomize size.
    size = this.canvas.random(8,25); 
		
    // Randomize center of flower to variations of orange and red color.
    myRed = this.canvas.random(0,255);
    myGreen = this.canvas.random(0,255);
    myBlue = this.canvas.random(0,255);

    // Randomize speed.
    speedY = this.canvas.random(-1, 10);
		speedX = this.canvas.random(5, -5); 
  }
	
	void display() {
		// Petal outline color is the same as the stem color. 
		this.canvas.stroke(14, 115, 61);
		this.canvas.fill(myRed, myGreen, myBlue);

		// Draws Petal. 
		this.canvas.arc(x, y, size, size, 0, PI+QUARTER_PI, PIE);
	}
	
	void move() {
		// Updates position based on speed.
		y += speedY;
		x += speedX; 
	}
}
