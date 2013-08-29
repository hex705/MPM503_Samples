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

// speaking
NetAddress  iNet_DestinationAddress;  // someone to talk to
String      iNet_DestinationIP = "127.0.0.1";
int         iNet_DestinationPort = 12000;   


void setup() {
  
  size(255,255);

  frameRate(25);
  
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
  
  // nothing here
  
}


// send a message when we release the mouse
void mouseReleased() {

  //create a message with a unique address pattern
  OscMessage myOutGoingMessage = new OscMessage("/reflect");  // starts with an ADDRESS PATTERN --> = / + any string you like
  
  // send myBallColor
  myOutGoingMessage.add( 11  );   // 0
  myOutGoingMessage.add( 22.5 );   // 1                              // add an int to the osc message
  myOutGoingMessage.add( " reflect string ");   // 2

  oscP5.send( myOutGoingMessage, iNet_DestinationAddress );  // actually do the sending
   
  
}


/* incoming osc messages are forwarded to the oscEvent method. */
void oscEvent( OscMessage theOscMessage ) {
  
  /* print the address pattern and the typetag of the received OscMessage */
  println("### reflect received an osc message.");
  println("    addrpattern: " + theOscMessage.addrPattern());
  println("    typetag:     " + theOscMessage.typetag());
  println();
  
  int     i  = theOscMessage.get(0).intValue();
  float   f  = theOscMessage.get(1).floatValue();
  String  s  = theOscMessage.get(2).stringValue();
       
  println( "int    :: " + i );
  println( "float  :: " + f );
  println( "string :: " + s );
  println();
}
