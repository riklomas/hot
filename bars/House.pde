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
  int step = 3;
  float fstep = 3.0;
  float w = 0.3;
  
  House (String _postcode, String _id)
  {
    postcode = _postcode;
    id = _id;
    
    String tescos[] = loadStrings(id + ".txt");
    int tesco_len = tescos.length;
    
    temps = new float[tesco_len];
    
    for ( int j = 0; j < tesco_len; j++ )
    {
      String ln[] = split(tescos[j], ',');
      temps[j] = float(ln[1]);
    }    
  }
  
  void draw ()
  {
    textFont(fff, 12); 
    textAlign(RIGHT);
    fill(#ffffff);
    text(postcode, 100, 5);
    
    
    for (int i = 0; i < temps.length - step; i += step)
    {
      fill(map(constrain(temps[i], 16, 28), 16, 28, 32, 0), 80, 80);
      quad( i/fstep, -w*temps[i], i/fstep, w * temps[i], (i+step)/fstep, w * temps[i+step], (i+step)/fstep, -w * temps[i+step]);
    }
    
  }
}
