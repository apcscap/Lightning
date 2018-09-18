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
  mainStartX = (float)(Math.random()*500);
  mainStartY = 0.0;
  if(mainStartX < 5 || mainStartX > 495) {
    mainStartY = (int)Math.random()*100;
  }
  mainEndX = mainStartX;
  mainEndY = mainStartY;
}

void drawLightningBolt(float startX, float startY, float endX, float endY, boolean main, int lifeTime) {
  strokeWeight((int)(Math.random()*4)+3);
  int mainDirection = 1;
  if(mainStartX > 250) {
    mainDirection = -1;
  }
  int direction = 1;
  if(main == false) {
    strokeWeight((int)(Math.random()*2)+1);
    int rand = (int)(Math.random()*10);
    if(rand > 5) {
      direction = 2;
    } else {
      direction = -1;
    }
  }
  while(endX < 500 && endY < 500 && lifeTime > 0) {
    //println(currentX.size(), currentY.size(), previousX.size(), previousY.size());
    // get points
    endX = startX + mainDirection * (float(direction) * (float)(Math.random()*((int)(Math.random()*9))));
    endY = startY + (float)(Math.random()*9);
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
  mainStartX = (float)Math.random()*500;
  mainStartY = 0.0;
  if(mainStartX < 5 || mainStartX > 495) {
    mainStartY = (float)Math.random()*100;
  }
  mainEndX = mainStartX;
  mainEndY = mainStartY;
  drawLightningBolt(mainStartX, mainStartY, mainEndX, mainEndY, true, 1); 
  for(int i=0;i<(int)(Math.random()*5)+5;i++) {
    int index = (int)(Math.random()*int(previousX.size()-1)-int(previousX.size() * 0.2)) + int(previousX.size() * 0.2);
    drawLightningBolt(previousX.get(index), previousY.get(index), previousX.get(index), previousY.get(index), false, (int)(Math.random()*10) + 15 - (i + 1));
  }
  previousX.clear();
  previousY.clear();
}
void draw() {
  fill(0,0,0,5);
  rect(0,0,500,500);
  drawLightning();
}