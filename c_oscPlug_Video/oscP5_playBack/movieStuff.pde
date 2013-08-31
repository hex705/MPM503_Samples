  
// basic movie support 
import processing.video.*;

Movie localMovie;

void setupMovie(){
  
    // setup movie
  localMovie = new Movie(this, "crashtest.mov");
  localMovie.loop();
  localMovie.stop();
  
}

void displayMovie(){
  
   image(localMovie, 0,0);
  
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

