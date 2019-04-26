import codeanticode.tablet.*;

Tablet tablet;
PApplet parent;
PaintBoard paintboard1;
PaintBoard paintboard2;
PaintPanel paintpanel;

void setup() {
  size(1600, 400, P3D);
  paintboard1 = new PaintBoard(this, 400, 400);
  paintboard2 = new PaintBoard(this, 400, 400);
  paintpanel = new PaintPanel(this);
  tablet = new Tablet(this);
}

void draw() {
  background(#ffffff);
  paintboard1.draw();
  translate(400, 0);
  paintboard2.draw();
  translate(400, 0);
  paintpanel.draw();
  
  
  //image(paintboard.getBoard(), 0, 0); 
}

void keyPressed() {
  if (keyCode == 'Q') {
      paintpanel.selectedColorUp();
      paintboard1.setBrushColor(paintpanel.getBrushColor());
      paintboard2.setBrushColor(paintpanel.getBrushColor());
  } else if (keyCode == 'A') {
      paintpanel.selectedColorDown();
      paintboard1.setBrushColor(paintpanel.getBrushColor());
      paintboard2.setBrushColor(paintpanel.getBrushColor());
  } else if (keyCode == 'W') {
      paintpanel.selectedStrokeUp();
      paintboard1.setBrushStrokeWeight(paintpanel.getBrushStrokeWeight());
  } else if (keyCode == 'S') {
      paintpanel.selectedStrokeDown();
      paintboard1.setBrushStrokeWeight(paintpanel.getBrushStrokeWeight());
  } else if (keyCode == 'E') {
      paintpanel.selectedToolUp();
      paintboard1.setTool(paintpanel.getTool());
  } else if (keyCode == 'D') {
      paintpanel.selectedToolDown();
      paintboard1.setTool(paintpanel.getTool());
  } else if (keyCode == '1') {
      paintboard1.setSeleted(true);
      paintboard2.setSeleted(false);
  } else if (keyCode == '2') {
      paintboard2.setSeleted(true);
      paintboard1.setSeleted(false);
  }
}
