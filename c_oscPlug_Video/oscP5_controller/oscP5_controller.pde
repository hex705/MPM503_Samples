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
int iNet_myListeningPort  = 12001;  // port I am listening on 

// speaking  -- we can send messages back if we want

NetAddress  iNet_DestinationAddress;  // someone to talk to
String      iNet_DestinationIP = "127.0.0.1";
int         iNet_DestinationPort = 12000;   


void setup() {
  
  // set up sketch
  size(320,240); // size of the movie
  noStroke();
  frameRate(25);
  
  setupButtons();  // displayStuff Tab
  
  /* instantiate oscP5 object, listen for incoming messages at port 12000 */
  oscP5 = new OscP5(this, iNet_myListeningPort); 
  
  /* iNetDestinationAddress is a netAddress
   * NetAddress takes 2 parameters :: ip and port  
   * NetAddresses are used to define where your messages go
   * iNetDestinationAddress is used in oscP5.send() ( below ) 
   */
  
  iNet_DestinationAddress = new NetAddress(iNet_DestinationIP, iNet_DestinationPort);  
   
}


void draw() {

  drawDisplay();
  

}

//check to see if any buttons are pressed 
void mousePressed() {
  
    stopButton.update();
    playButton.update();
    pauseButton.update();   

 
}

void mouseReleased() {
  
  String controllerMessage="/noChange"; // place holder
  
  //check for a selected button -- set message accordingly
  if ( stopButton.isPressed()  ) {controllerMessage = "/stop"; }
  if ( playButton.isPressed()  ) {controllerMessage = "/play"; }
  if ( pauseButton.isPressed() ) {controllerMessage = "/pause";}
  
  println("control message = " + controllerMessage) ;
    

  //create a message with a unique address pattern
  OscMessage myOutGoingMessage = new OscMessage(controllerMessage);  // starts with an ADDRESS PATTERN --> = / + any string you like
  
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
