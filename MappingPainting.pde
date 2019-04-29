import codeanticode.tablet.*;

Tablet tablet;
PApplet parent;
PaintBoard[] paintboards;
PaintPanel paintpanel;

int selectedboard;

void setup() {
  size(1600,400, P3D);

  //fullScreen(P3D);
  paintboards = new PaintBoard[7];
  paintpanel = new PaintPanel(this);
  tablet = new Tablet(this);
  selectedboard = 0;
  
  paintboards[0] = new PaintBoard(this, 800, 800, "Fondo 1");
  paintboards[1] = new PaintBoard(this, 800, 6180, "F 2");
  paintboards[2] = new PaintBoard(this, 800, 6180, "Suelo");
  paintboards[3] = new PaintBoard(this, 800, 6180, "Pared 1");
  paintboards[4] = new PaintBoard(this, 800, 800, "Pared 2");
  paintboards[5] = new PaintBoard(this, 800, 6180, "Techo 1");
  paintboards[6] = new PaintBoard(this, 800, 6180, "Techo 2");
  
  paintboards[0].setSeleted(true);
}

void draw() {
  background(#ffffff);
  paintboards[0].draw();
  translate(400, 0);
  translate(-400, 400);
  paintpanel.draw();
  
  //image(paintboard.getBoard(), 0, 0); 
}

void keyPressed() {
  if (keyCode == 'Q') {
      paintpanel.selectedColorUp();
      paintboards[0].setBrushColor(paintpanel.getBrushColor());
  } else if (keyCode == 'A') {
      paintpanel.selectedColorDown();
      paintboards[0].setBrushColor(paintpanel.getBrushColor());
  } else if (keyCode == 'W') {
      paintpanel.selectedStrokeUp();
      paintboards[0].setBrushStrokeWeight(paintpanel.getBrushStrokeWeight());
  } else if (keyCode == 'S') {
      paintpanel.selectedStrokeDown();
      paintboards[0].setBrushStrokeWeight(paintpanel.getBrushStrokeWeight());
  } else if (keyCode == 'E') {
      paintpanel.selectedToolUp();
      paintboards[0].setTool(paintpanel.getTool());
  } else if (keyCode == 'D') {
      paintpanel.selectedToolDown();
      paintboards[0].setTool(paintpanel.getTool());
  } else if (keyCode == '1') {
      selectedboard = (selectedboard + 1) % 7;
      for(int x = 0; x > 7; x++) {
        paintboards[x].setSeleted(false);
      }
      paintboards[selectedboard].setSeleted(true);
  } else if (keyCode == '2') {
      selectedboard = (selectedboard - 1 < 0)? 6 : selectedboard - 1;
      for(int x = 0; x > 7; x++) {
        paintboards[x].setSeleted(false);
      }
      paintboards[selectedboard].setSeleted(true);
  }
}

Tablet getTablet() {
  return tablet;
}
