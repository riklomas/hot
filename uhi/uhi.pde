import processing.video.*;
MovieMaker mm;  // Declare MovieMaker object

Boolean domovie = true;

int gridx = 600;
int gridy = 500;

int frames = 50;

float[] tescox;
float[] tescoy;

float maxnum = 0;
int tesco_len;
int j = 0;

House[] houses;
Day day;

PImage bg, bgmarker;

PFont fff;

void setup ()
{
  size(floor(gridx),floor(gridy));
  smooth();
  
  
  if (domovie)
  {
    mm = new MovieMaker(this, width, height, "london.mov", frames, MovieMaker.ANIMATION, MovieMaker.HIGH);
  }
  
  background(#333333);
  noStroke();
  colorMode(HSB, 100);
  frameRate(frames);
  
  bg = loadImage("map2.png");
  bgmarker = loadImage("map_with_markers.png");
  
  fff = loadFont("Helvetica-12.vlw");
  textAlign(CENTER, CENTER);
  
  String tescos[] = loadStrings("l.txt");
  tesco_len += tescos.length;
  
  tescox = new float[tesco_len];
  tescoy = new float[tesco_len];  
  houses = new House[tesco_len];
  day = new Day();
  
  float centrex = -0.063;
  float spreadx = 0.46;
  
  float centrey = 51.5;
  float spready = 0.23;
  
  for ( int i = 0; i < tesco_len; i++ )
  {
    String ln[] = split(tescos[i], ',');
    houses[i] = new House(map(float(ln[2]), centrex - spreadx, centrex + spreadx, -250, 250), map(float(ln[3]), centrey + spready, centrey - spready, -250, 250), ln[0], ln[1]);    
  }
  
}

void draw()
{
  background(#333333);
  
 
 pushMatrix();

 translate(width/2 + 40, height/2);
 
 
  imageMode(CENTER);
  image(bg, -34, 12);
  //image(bgmarker, 0, 0);
  
  for ( int i = 0; i < tesco_len; i++ )
  {
    if (frameCount % 3 == 0)
    {
      houses[i].go(frameCount);
    }
    
    houses[i].draw();
  }
  
  for ( int i = 0; i < tesco_len; i++ )
  {
    houses[i].drawFont();
  }
  
  /*
 fill(80, 100, 100);
 ellipse(0, 0, 10, 10);
  */
  
  popMatrix();
  
  if (frameCount % 3 == 0)
  {
    day.go(frameCount);
  }
  day.draw();
  

  
  if (domovie)
  {
    if (frameCount >= 4391)
    {
      mm.finish();
    }
    else
    {
      
      mm.addFrame(); 
    }
  }
  
}
  

