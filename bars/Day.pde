class Day
{
  
  String[] hours;
  String now;
  String currentmonth = "06";
  
  Day()
  {
    
    String tescos[] = loadStrings("1068620.txt");
    int tesco_len = tescos.length;
    
    hours = new String[tesco_len];
    
    for ( int j = 0; j < tesco_len; j++ )
    {
      String ln[] = split(tescos[j], ',');

      String parts[] = split(ln[0], ' ');
      String pa[] = split(parts[0], '-');

      String y = pa[0];
      String m = pa[1];
      String d = pa[2];
      String h = parts[1];


      hours[j] = m;
    }
    
    now = "";
    
  }

  void draw()
  {
	for (int i = 0; i < hours.length; i += 3)
	{
	  if (!hours[i].equals(currentmonth))
	  {
            stroke(#ffffff, 50);
	    //fill(#ffffff);
	    line(float(i)/3.0, 20, float(i)/3.0, height-20);
          
           String m = hours[i];
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
    
    textFont(fff, 12); 
    textAlign(LEFT);
    fill(#ffffff);
    text(mt, i/3+5, 30);

	  }
      currentmonth = hours[i];

	}

  }


}
