import codeanticode.tablet.*;
import codeanticode.syphon.*;

Tablet tablet;
PApplet parent;
PaintBoard[] paintboards;
PaintPanel paintpanel;
SyphonServer[] servers;
PaintOver paintover;

int selectedboard;

void setup() {
  //size(800,600, P3D);
  fullScreen(P3D);
  
  paintboards = new PaintBoard[7];
  paintpanel = new PaintPanel(this);
  paintover = new PaintOver(this, 800, 800, "Over");
  tablet = new Tablet(this);
  selectedboard = 0;
  
  paintboards[0] = new PaintBoard(this, 800, 800, "Fondo 1");
  paintboards[1] = new PaintBoard(this, 800, 600, "Fondo 2");
  paintboards[2] = new PaintBoard(this, 800, 600, "Suelo");
  paintboards[3] = new PaintBoard(this, 800, 600, "Pared 1");
  paintboards[4] = new PaintBoard(this, 800, 800, "Pared 2");
  paintboards[5] = new PaintBoard(this, 800, 600, "Techo 1");
  paintboards[6] = new PaintBoard(this, 800, 600, "Techo 2");
  
  paintboards[0].setSeleted(true);
  
  // Create syhpon servers to send frames out.
  servers = new SyphonServer[8];
  for (int i = 0; i < 7; i++) { 
    servers[i] = new SyphonServer(this, paintboards[i].getBoardName());
  }
  servers[7] = new SyphonServer(this, "Paint Panel");
}

void draw() {
  background(#ffffff);
  
  for (int i = 0; i < 7; i++) {
    paintboards[i].draw();
    servers[i].sendImage(paintboards[i].getBoard());  
  }
  paintpanel.draw();
  servers[7].sendImage(paintpanel.getPanel()); 
  
  paintover.draw();
  
  image(paintpanel.getPanel(), 10, 40);
  image(paintboards[selectedboard].getBoard(), 0, 0);
  image(paintover.getOver(), 0, 0);
  fill(50);
  text("Selected Board: " + selectedboard, 10, 10);
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
