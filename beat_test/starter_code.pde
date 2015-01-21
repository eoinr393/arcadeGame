ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  float gap = (platforms[0].pWidth / 4) + (platforms[0].pWidth/4 - 50);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    float x = ((platforms[0].pos.x - (platforms[0].pWidth / 2)) + (2 * platforms[0].pWidth/4) + (platforms[0].pWidth/4)/2) + (i * gap);
    p.pos.x = x;
    p.pos.y = height - 85;
    p.row = int(((p.pos.x - (platforms[0].pos.x - platforms[0].pWidth/2)) / (platforms[0].pWidth / 4)));
   players.add(p);         
  }
}

