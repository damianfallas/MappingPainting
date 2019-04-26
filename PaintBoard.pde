import codeanticode.tablet.*;

class PaintBoard {
  PGraphics graphics;
  PApplet parent;
  boolean selected;
  int w, h;
  color brushColor;
  int brushStrokeWeight;
  int tool;

  PaintBoard(PApplet parent, int w, int h) {
    this.parent = parent;
    this.w = w;
    this.h = h;
    graphics = createGraphics(w, h, P3D);
    selected = false;
    brushColor = #000000;
    brushStrokeWeight = 10;
    tool = 0;
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
      
      parent.image(graphics, 0, 0); 
  }
  
  void drawBrush() {
    graphics.strokeWeight(brushStrokeWeight);
    graphics.stroke(brushColor);
    graphics.strokeWeight(brushStrokeWeight);
    graphics.line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  void drawPencil() {
    graphics.strokeWeight(brushStrokeWeight);
    graphics.stroke(brushColor);
    graphics.strokeWeight(brushStrokeWeight);
    graphics.ellipseMode(CENTER);
    graphics.ellipse(mouseX, mouseY, brushStrokeWeight / 2, brushStrokeWeight / 2);
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
