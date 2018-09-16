float mainStartX;
float mainStartY;
float mainEndX;
float mainEndY;
ArrayList<Float> previousX = new ArrayList<Float>();
ArrayList<Float> previousY = new ArrayList<Float>();

void setup() {
  size(500,500);
  background(0);
  frameRate(2.0);
  mainStartX = random(0, 500);
  mainStartY = 0.0;
  if(mainStartX < 5 || mainStartX > 495) {
    mainStartY = random(0,100);
  }
  mainEndX = mainStartX;
  mainEndY = mainStartY;
}

void drawLightningBolt(float startX, float startY, float endX, float endY, boolean main, int lifeTime) {
  strokeWeight(random(3,7));
  int mainDirection = 1;
  if(mainStartX > 250) {
    mainDirection = -1;
  }
  int direction = 1;
  if(main == false) {
    strokeWeight(random(1, 3));
    int rand = int(random(0,10));
    if(rand > 5) {
      direction = 2;
    } else {
      direction = -1;
    }
  }
  while(endX < 500 && endY < 500 && lifeTime > 0) {
    //println(currentX.size(), currentY.size(), previousX.size(), previousY.size());
    // get points
    endX = startX + mainDirection * (float(direction) * random(0,int(random(0,9))));
    endY = startY + random(0,9);
    //draw line
    stroke(125,184,255);
    line(startX, startY, endX, endY);
    // add positions to previous list
    previousX.add(startX);
    previousY.add(startY);
    // reset
    startX = endX;
    startY = endY;
    if(main == false) {
      lifeTime--;
    }
  }
}

void drawLightning() {
  // reset position
  mainStartX = random(0, 500);
  mainStartY = 0.0;
  if(mainStartX < 5 || mainStartX > 495) {
    mainStartY = random(0,100);
  }
  mainEndX = mainStartX;
  mainEndY = mainStartY;
  drawLightningBolt(mainStartX, mainStartY, mainEndX, mainEndY, true, 1); 
  for(int i=0;i<int(random(5,10));i++) {
    int index = int(random(0 + int(previousX.size() * 0.2),previousX.size()-1));
    drawLightningBolt(previousX.get(index), previousY.get(index), previousX.get(index), previousY.get(index), false, int(random(15,25)) - (i + 1));
  }
  previousX.clear();
  previousY.clear();
}
void draw() {
  fill(0,0,0,5)
  rect(0,0,500,500);
  drawLightning();
}