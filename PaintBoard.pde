import codeanticode.tablet.*;
import java.awt.MouseInfo;

class PaintBoard {
  String boardname;
  PGraphics graphics;
  PApplet parent;
  boolean selected;
  int w, h;
  color brushColor;
  int brushStrokeWeight;
  int tool;
  
  PaintBoard(PApplet parent, int w, int h, String boardname) {
    this.boardname = boardname;
    this.parent = parent;
    this.w = w;
    this.h = h;
    graphics = createGraphics(w, h, P3D);
    selected = false;
    brushColor = #000000;
    brushStrokeWeight = 10;
    tool = 0;
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
      if(selected) {  
        parent.noFill();
        parent.strokeWeight(4);
        parent.stroke(204, 102, 0);
        parent.rect(1, 1, w-2, h-2);
      }
      
      if(selected) {
        if(tool == 0){
          drawPencil();
        } else if(tool == 1){
          drawBrush();
        }
      }
      graphics.endDraw();
  }
  
  void drawBrush() {
    graphics.strokeWeight(brushStrokeWeight);
    graphics.stroke(brushColor);
    graphics.strokeWeight(brushStrokeWeight);
    graphics.line(pointTransposeX(pmouseX), pointTransposeY(pmouseY), pointTransposeX(mouseX), pointTransposeY(mouseY));
  }
  
  void drawPencil() {
    graphics.strokeWeight(brushStrokeWeight);
    graphics.stroke(brushColor);
    graphics.strokeWeight(brushStrokeWeight);
    graphics.ellipseMode(CENTER);
    graphics.ellipse(pointTransposeX(mouseX), pointTransposeY(mouseY), brushStrokeWeight / 2, brushStrokeWeight / 2);
  }
  
  PGraphics getBoard() {
    return graphics;
  }
  
  void setTool(int tool) {
    this.tool = tool;
  }
  
  void setBrushColor(color brushColor) {
    this.brushColor = brushColor;
  }
  
  void setBrushStrokeWeight(int brushStrokeWeight) {
    this.brushStrokeWeight = brushStrokeWeight;
  }
  
  void setSeleted(boolean selected) {
    this.selected = selected;
  }
}
