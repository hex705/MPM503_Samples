/**
 * sendreceive based on examples by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
// import the library -- install it if you don't have it
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;  // osc object

// listening
int iNet_myListeningPort  = 12000;  // port I am listening on 

// speaking  -- we can send messages back if we want

NetAddress  iNet_DestinationAddress;  // someone to talk to
String      iNet_DestinationIP = "127.0.0.1";
int         iNet_DestinationPort = 12001;   


void setup() {
  
  // set up sketch
  size(320,240); // size of the movie
  noStroke();
  frameRate(25);
  
  setupMovie();  // movieStuff tab

  
  /* instantiate oscP5 object, listen for incoming messages at port 12000 */
  oscP5 = new OscP5(this, iNet_myListeningPort); 
  
  /* iNetDestinationAddress is a netAddress
   * NetAddress takes 2 parameters :: ip and port  
   * NetAddresses are used to define where your messages go
   * iNetDestinationAddress is used in oscP5.send() ( below ) 
   */
  
  iNet_DestinationAddress = new NetAddress(iNet_DestinationIP, iNet_DestinationPort);  
  
  // if a message with address pattern '/play' arrives call function startMovie
   
  oscP5.plug(this,"playMovie","/play"); 
  oscP5.plug(this,"stopMovie","/stop"); 
  oscP5.plug(this,"pauseMovie","/pause"); 
  
}


void playMovie(){
  localMovie.play();
}


void stopMovie(){
  localMovie.stop();
}


void pauseMovie(){
  localMovie.pause();
}

void draw() {
  
  displayMovie();

}


void mouseReleased() {

  //create a message with a unique address pattern
  OscMessage myOutGoingMessage = new OscMessage("/movieSays");  // starts with an ADDRESS PATTERN --> = / + any string you like

  oscP5.send( myOutGoingMessage, iNet_DestinationAddress );  // actually do the sending
   
  
}


/* incoming osc messages are forwarded to the oscEvent method. */
void oscEvent( OscMessage theOscMessage ) {
  
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("    addrpattern: " + theOscMessage.addrPattern());
  println("    typetag:     " + theOscMessage.typetag());
  println();
  
  
}
