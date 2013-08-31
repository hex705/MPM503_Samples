
// define three controller buttons -- look in z_Button_class for details
Button stopButton;
Button pauseButton;
Button playButton;



//instantiate the buttons -- called once in setup
void setupButtons() {
  
  playButton  = new Button ( 0,        0,        width,     height/2, 5, color( 0,255,0   ) );
  stopButton  = new Button ( width/2,  height/2, width/2,   height/2, 5, color( 255,0,0   ) ); 
  pauseButton = new Button ( 0,        height/2, width/2+1, height/2, 5, color( 255,255,0 ) );
  
} // end setupButtons 



void drawDisplay(){
  
  background(120);
  
  stopButton.display();
  playButton.display();
  pauseButton.display();

  
  
}


