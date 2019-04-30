import codeanticode.tablet.*;
import java.awt.MouseInfo;

class PaintOver {
  String boardname;
  PGraphics graphics;
  PApplet parent;
  int w, h;
  int nq = 10;
  
  PaintOver(PApplet parent, int w, int h, String boardname) {
    this.boardname = boardname;
    this.parent = parent;
    this.w = w;
    this.h = h;
    graphics = createGraphics(w, h, P3D);
  }
  
  int pointTransposeX(int x) {
    //MouseInfo.getPointerInfo().getLocation().x
    return (x * w) / displayWidth;
  }
  
  int pointTransposeY(int y) {
    //MouseInfo.getPointerInfo().getLocation().y
    return (y * h) / displayHeight;
  }
  
  void draw() {
    graphics.beginDraw();
    graphics.clear();
    if (keyPressed) {
      if (key == 'g' || key == 'G') {
        drawMesh();
      }
    } 
    drawCursor();
    
    graphics.endDraw();
  }
    
  void drawMesh() {
    graphics.noFill();
    graphics.strokeWeight(1);
    graphics.stroke(0);
    
    for(int x=0; x < nq ; x++) {
      for(int y=0; y < nq; y++) {
        graphics.rect(x * (w/nq), y * (h/nq), w/nq, h/nq);
      }
    }
  }
  
  void drawCursor() {
    graphics.strokeWeight(1);
    graphics.stroke(0);
    graphics.line(pointTransposeX(mouseX), 0, pointTransposeX(mouseX), w);
    graphics.line(0 ,pointTransposeY(mouseY), h, pointTransposeY(mouseY));
  }
  
  PGraphics getOver() {
    return graphics;
  }
  
  String getOverName() {
    return boardname;
  }
}
