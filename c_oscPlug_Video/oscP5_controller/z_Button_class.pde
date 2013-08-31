class Button {
  
  color fc;  // fillColor
  int x,y,w,h,r;
  
  boolean selected = false;
  
  Button (int _x, int _y, int _w, int _h, int _r, color _c){
    x= _x;
    y= _y;
    w= _w;
    h=_h;
    r = _r;
    
    fc = _c;
  }
  
  //returns the state of the button
  boolean isPressed() {
    return selected;
  }
  
  //checks to see if this button is being pressed
  void update () {
    selected = false;
    if (( mouseX > x && mouseX < (x+w) ) &&
        ( mouseY > y && mouseY < (y+h) ))
       {
      selected = true;
    }
  }
    
  // draw the button
  void display(){

    fill(fc);
    stroke(fc);
    if ( selected ) {  stroke(fc ^ 0x00FFFFFF);  } // invert color of stroke
    strokeWeight(5);
    rect (x+10,y+10,w-20,h-20,r,r,r,r);
       
  } // end display
    
} // end class

