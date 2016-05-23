//Useful function to generate random -1 or +1
int randomSign() //returns 1 or -1
{
  return random(0, 100) < 50 ? -1 : 1;
}

//Class representing bubbles
public class Bubble
{
  private Vector center;
  private float radius;
  private Vector speed;
  private float R, G, B;
  
  //Creates a bubble with random values
  //except for the position
  Bubble(float x, float y, boolean small)
  {
    center = new Vector(x, y);
    radius = small ? random(10, 40) : random(20, 100);
    speed = new Vector(randomSign() * random(2, 20), randomSign() * random(2, 20));
    R = random(150, 230);
    G = random(150, 230);
    B = random(150, 230);
  }
  
  //Update bubble position
  void update()
  {
    center = center.add(speed);
  }
  
  //Display bubble
  void draw()
  {
    fill(R, G, B, 155);
    ellipse(center._x, center._y, 2*radius, 2*radius);
  }
  
  //Return the distance between this bubble and an other one
  float distance(Bubble other)
  {
    return center.distance(other.center);
  }
  
  //Returns true if there is a collision with the other bubble
  boolean collision(Bubble other)
  {
    return this.distance(other) <= this.radius + other.radius;
  }
  
  //Returns true if there is a collision with an edge of the screen
  boolean collisionEdge(boolean vertical)
  {
    if (vertical) //Left and right edges
    {
      return center._x <= radius || abs(width-1 - center._x) <= radius;
    }
    else //Top and bottom edges
    {
      return center._y <= radius || abs(height-1 - center._y) <= radius;
    }
  }
  
  //Reflect vector speed against edge
  void reflectSpeedVector(boolean verticalEdge)
  {
    if (verticalEdge)
    {
      speed._x *= -1;
    }
    else
    {
      speed._y *= -1;
    }
  }
  
  //Reflect vector speed with specified normal
  void reflectSpeedVector(Vector normal)
  {
    speed = speed.reflection(normal);
  }
  
  //Increase radius
  void enlarge()
  {
    radius++;
  }
  
  //Returns true if the radius is too big
  boolean isTooLarge()
  {
    return radius >= 200;
  }
  
  //Get position
  Vector position()
  {
    return center;
  }
}