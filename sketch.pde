ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

void setup()
{
}

void detectCollisions()
{
  for (int i=0 ; i<bubbles.size() ; i++)
  {
    Bubble b = bubbles.get(i);
    
    //Collision with walls
    if (b.collisionEdge(true))
    {
      b.reflectSpeedVector(true);
    }
    
    if (b.collisionEdge(false))
    {
      b.reflectSpeedVector(false);
    }
    
    if (i == bubbles.size()-1)
      break;
    
    //Collision with an other bubble
    for (int j=i+1 ; j<bubbles.size() ; j++)
    {
      if (b.collision(bubbles.get(j)))
      {
        Vector n1 = b.position().substract(bubbles.get(j).position());
        n1.normalize();
        Vector n2 = n1.multiply(-1);
        
        b.reflectSpeedVector(n1);
        //b.enlarge();
        bubbles.get(j).reflectSpeedVector(n2);
        //bubbles.get(j).enlarge();
      }
    }
  }
}

void explodeBigBubbles()
{
  IntList indices = new IntList();
  int size = bubbles.size();
  for (int i=0 ; i<size ; i++)
  {
    if (bubbles.get(i).isTooLarge())
    {
      indices.append(i);
      bubbles.add(new Bubble(bubbles.get(i).position()._x, bubbles.get(i).position()._y, true));
    }
  }
  for (int i=indices.size()-1 ; i>=0 ; i--)
  {
    bubbles.remove(indices.get(i));
  }
}

void draw()
{
  background(255);
  noStroke();
  
  detectCollisions();
  
  //explodeBigBubbles();
  
  for (int i=0 ; i<bubbles.size() ; i++)
  {
    bubbles.get(i).update();
    bubbles.get(i).draw();
  }
}

void mousePressed()
{
  bubbles.add(new Bubble(mouseX, mouseY, false));
}