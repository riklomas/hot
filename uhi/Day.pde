class Day
{
  
  String[] hours;
  String now;
  
  Day()
  {
    
    String tescos[] = loadStrings("1068620.txt");
    int tesco_len = tescos.length;
    
    hours = new String[tesco_len];
    
    for ( int j = 0; j < tesco_len; j++ )
    {
      String ln[] = split(tescos[j], ',');
      hours[j] = ln[0];
    }
    
    now = "";
    
  }
  
  void go (int i)
  {
    String parts[] = split(hours[i], ' ');
    String pa[] = split(parts[0], '-');

    String y = pa[0];
    String m = pa[1];
    String d = pa[2];
    String h = parts[1];


    String mt;
    if (m.equals("01")) { mt = "January"; }
    else if (m.equals("02")) { mt = "February"; }
    else if (m.equals("03")) { mt = "March"; }
    else if (m.equals("04")) { mt = "April"; }
    else if (m.equals("05")) { mt = "May"; }
    else if (m.equals("06")) { mt = "June"; }
    else if (m.equals("07")) { mt = "July"; }
    else if (m.equals("08")) { mt = "August"; }
    else if (m.equals("09")) { mt = "September"; }
    else if (m.equals("10")) { mt = "October"; }
    else if (m.equals("11")) { mt = "November"; }
    else if (m.equals("12")) { mt = "December"; }
    else { mt = m; } 
    
    now = d + " " + mt + " " + y + " " + h + ":00";
  }
  
  void draw () 
  {
    pushMatrix();
    
    textFont(fff, 12); 
    textAlign(TOP, LEFT);
    
    translate(25, 25);
    fill(#cc0000);
    float ww = textWidth(now)+8;
    float wh = 16;
    
    rectMode(CORNER);
    rect(-4, -wh+4, ww, wh);
    

    fill(#ffffff);

    text(now,0,0);
    popMatrix();
    
    
    
    pushMatrix();
    
    String n = "R Lomas & A Mavrogianni";
    
    textFont(fff, 12); 
    textAlign(TOP, LEFT);
    
    translate(430, 25);
    fill(#666666);
    ww = textWidth(n)+8;
    
    rectMode(CORNER);
    rect(-4, -wh+4, ww, wh);
    

    fill(#cccccc);

    text(n, 0, 0);
    popMatrix();
    
  } 
}
