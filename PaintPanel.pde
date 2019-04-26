class PaintPanel {
  color[] colors;
  int selectedcolor;
  int selectedStroke;
  int selectedTool;
  PGraphics graphics;
  PApplet parent;
  
  int size = 80;
  int gap = 10;
  
  PImage pencil, eraser, brush;
  
  PaintPanel(PApplet parent) {
    this.parent = parent;
    graphics = createGraphics(660, 370, P3D);
    colors = new color[16];
    selectedcolor = 1;
    selectedStroke = selectedTool = 0;
    colors[0] = #00FFFF;
    colors[1] = #000000;
    colors[2] = #0000FF;
    colors[3] = #FF00FF;
    colors[4] = #808080;
    colors[5] = #008000;
    colors[6] = #00FF00;
    colors[7] = #800000;
    colors[8] = #000080;
    colors[9] = #808000;
    colors[10] = #800080;
    colors[11] = #FF0000;
    colors[12] = #C0C0C0;
    colors[13] = #008080;
    colors[14] = #FFFFFF;
    colors[15] = #FFFF00;
    
    pencil = loadImage("pencil-cl.png");
    brush = loadImage("brush-cl.png");
    eraser = loadImage("eraser-cl.png");
  }
  
  void drawColors() {
    int actualcolor = 0;
    for(int x= 0; x < 4; x ++ ) {
      for(int y= 0; y < 4; y ++ ) {
        actualcolor = (y * 4 + x);
        if(selectedcolor == actualcolor) {
          graphics.strokeWeight(4);
          graphics.stroke(0);
        } else {
          graphics.noStroke();
        }
        graphics.fill(colors[actualcolor]);
        graphics.ellipse((x * size) + (gap * x) + (size / 2) + gap, (y * size) + (gap * y) + (size / 2) + gap, size, size);
        
      }
    }
  }
  
  void drawStroke() {
    int actualStrokeSize = 0;
    
    ellipseMode(CENTER);
    graphics.fill(0);
    graphics.strokeWeight(4);
    
    for(int x= 1; x < 8; x ++ ) {
      actualStrokeSize = x * 10; 
      if(selectedStroke == x-1) {
        graphics.stroke(#0000FF);
      } else {
        graphics.noStroke();
      }
      graphics.ellipse((size / 2) + gap, x * (actualStrokeSize / 2) + gap * x, actualStrokeSize, actualStrokeSize);
    }
    
  }
  
  void drawTool() {
    graphics.fill(#ffffff);
    graphics.noStroke();
    if(selectedTool == 0) {
      graphics.ellipse(50, gap + 100 , 100, 100);
    } else {
      graphics.ellipse(50, gap + 250 , 100, 100);
    }
    graphics.image(pencil, 0, gap + 50 , 100, 100);
    graphics.image(brush, 0, gap + 200, 100, 100);
  }
  
  void draw() {
    graphics.beginDraw();
    graphics.background(#f2f2f2);
    
    graphics.noFill();
    graphics.strokeWeight(1);
    graphics.stroke(204, 102, 0);
    graphics.rect(0, 0, 660, 370);
    
    drawColors();
    graphics.translate(400, 0);
    drawStroke();
    graphics.translate(150, 0);
    
    drawTool();
    graphics.endDraw();
    
    parent.image(graphics, 0, 0);
  }
  
  void selectedColorUp() {
    this.selectedcolor = (selectedcolor + 1) % 16;
  }
  
  void selectedColorDown() {
    this.selectedcolor = (selectedcolor - 1 < 0)? 15: selectedcolor - 1;
  }
  
  void selectedStrokeUp() {
    this.selectedStroke = (selectedStroke - 1 < 0)? 6: selectedStroke - 1;
  }
  
  void selectedStrokeDown() {
    this.selectedStroke = (selectedStroke + 1) % 7;
  }
  
  void selectedToolUp() {
    this.selectedTool = (selectedTool == 1)? 0 : 1;
  }
  
  void selectedToolDown() {
    this.selectedTool = (selectedTool == 1)? 0 : 1;
  }
  
  color getBrushColor() {
    return colors[selectedcolor];
  }
  
  int getBrushStrokeWeight() {
    return (selectedStroke + 1) * 10;
  }
  
  int getTool() {
    return selectedTool;
  }
  
  PGraphics getPanel() {
    return graphics;
  }
  
}
