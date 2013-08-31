
//display variables

color ballColor     = color ( 255, 0, 0 ); // start red
color receivedColor = color ( 0,   0, 0 ); // start black
color sentColor     = color ( 0,   0, 0 );


void drawDisplay() {
  
  background ( 0 ) ;
  
  // upper Left corner is sent color
  fill( sentColor );
  rect( 0, 0, 50 , 50 );
  
  // lower right corner is received color 
  fill ( receivedColor );
  rect( width-50, height-50, width, height );
  
  // nothing here 
  ballColor = color(mouseX, mouseY, mouseX-mouseY);
  
  
  fill ( ballColor );
  ellipse ( mouseX,mouseY,50,50);
  
}
 
