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

// speaking
NetAddress  iNet_DestinationAddress;  // someone to talk to
String      iNet_DestinationIP = "127.0.0.1";
int         iNet_DestinationPort = 12001;   


void setup() {
  
  size(510,510);
  noStroke();
  frameRate(25);
  
  /* instantiate oscP5 object, listen for incoming messages at port 12000 */
  oscP5 = new OscP5(this, iNet_myListeningPort); 
  
  /* iNetDestinationAddress is a netAddress
   * NetAddress takes 2 parameters :: ip and port  
   * NetAddresses are used to define where your messages go
   * iNetDestinationAddress is used in oscP5.send() ( below ) 
   */
  
  iNet_DestinationAddress = new NetAddress(iNet_DestinationIP, iNet_DestinationPort);  
    
  oscP5.plug ( this, "setReceivedColor", "/ballColor");
  oscP5.plug ( this, "setReceivedPosition", "/ballPosition");
    
}


void draw() {
  
  drawDisplay(); // other tab
  
}


void mouseReleased() {

  //create a message with a unique address pattern
  OscMessage myOutGoingMessage = new OscMessage("/ballColor");  // starts with an ADDRESS PATTERN --> = / + any string you like
  
  // send myBallColor
  myOutGoingMessage.add( red  ( ballColor )  );   // 0
  myOutGoingMessage.add( green( ballColor )  );   // 1                              // add an int to the osc message
  myOutGoingMessage.add( blue ( ballColor )  );   // 2

  oscP5.send( myOutGoingMessage, iNet_DestinationAddress );  // actually do the sending
   
  //store the sent color for display
  sentColor = ballColor ;
  
}


/* incoming osc messages are forwarded to the oscEvent method. */
void oscEvent( OscMessage theOscMessage ) {
  
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("    addrpattern: " + theOscMessage.addrPattern());
  println("    typetag:     " + theOscMessage.typetag());
  println();

  
}
