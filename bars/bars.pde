int gridx = 1400;
int gridy = 2000;

int frames = 2;

float[] tescox;
float[] tescoy;

House[] houses;
Day day;

int tesco_len;
PFont fff;

void setup ()
{
  size(floor(gridx),floor(gridy));
  smooth();
  
  background(#333333);
  noStroke();
  colorMode(HSB, 100);
  frameRate(frames);
    
  fff = loadFont("Helvetica-12.vlw");

  
  String tescos[] = loadStrings("l.txt");
  tesco_len += tescos.length;
  
  tescox = new float[tesco_len];
  tescoy = new float[tesco_len];  
  houses = new House[tesco_len];
  day = new Day();
    
  for ( int i = 0; i < tesco_len; i++ )
  {
    String ln[] = split(tescos[i], ',');
    houses[i] = new House(ln[0], ln[1]);
  }

  for ( int i = 0; i < tesco_len; i++ )
  {
    pushMatrix();
    translate(0, 20*(i+1)+40);
    houses[i].draw();
    popMatrix();
  }

  day.draw(); 
  saveFrame("bars.jpg");
  
}
