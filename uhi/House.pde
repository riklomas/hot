class House
{
  float x, y;
  String postcode;
  String id;

  float[] temps;
  int i = 0;
  
  float rad = 5, radto = 5;
  float col, colto;
  
  String t;
  
  float ddr = 0.9;
  
  
  House (float _x, float _y, String _postcode, String _id)
  {
    
    x = _x;
    y = _y;
    postcode = _postcode;
    id = _id;
    
    String tescos[] = loadStrings(id + ".txt");
    int tesco_len = tescos.length;
    
    temps = new float[tesco_len];
    
    for ( int j = 0; j < tesco_len; j++ )
    {
      String ln[] = split(tescos[j], ',');

      float no = float(ln[1]);
      temps[j] = no;
    }
    
    t = "";
    
  }
  
  void go (int i)
  {

    if (temps[i] != 0)
    {
      radto = temps[i];
      colto = map(constrain(temps[i], 14, 28), 14, 28, 32, 0);

      t = "" + ((int) temps[i]);
    }
    else
    {
      radto = 0.0;
      colto = -1;
      t = "";
    }
  }
  
  void draw ()
  {
    rad = radto - ((radto - rad) * ddr);
    
    color c;
    
    
    
      if (colto > -1)
      {
        col = colto - ((colto - col) * ddr);
        c = color(col, 100, 100);
      }
      else
      {
        c = color(10, 10, 10);
      }
     
     /*   
    if (postcode.equals("TW5 0PW") || postcode.equals("CR0 2RT"))
    {
      c = color(60, 100, 100); 
    }
    */
    
    
    pushMatrix();
    translate(x, y);
    fill(c);
    ellipse(0, 0, rad, rad);
    popMatrix();
    
  }
  
  void drawFont ()
  {
    if (t != "")
    {
      pushMatrix();
      translate(x, y);
      fill(color(col, 50, 30));
      textAlign(CENTER, CENTER);
      textFont(fff, 11);
      text(t, 0, 0);
      popMatrix();
    }
  }
  
}
