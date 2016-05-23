//Simple class for 2D vectors
public class Vector
{
  float _x, _y;
  
  Vector(float x, float y)
  {
    _x = x;
    _y = y;
  }
  
  Vector()
  {
    _x = 0;
    _y = 0;
  }
  
  //Returns this + other
  Vector add(Vector other)
  {
    return new Vector(_x + other._x, _y + other._y);
  }
  
  //Returns this * scalar
  Vector multiply(float scalar)
  {
    return new Vector(scalar * _x, scalar * _y);
  }
  
  //Returns this - other
  Vector substract(Vector other)
  {
    return this.add(other.multiply(-1.0));
  }
  
  //Returns this.other
  float dot(Vector other)
  {
    return _x * other._x + _y * other._y;
  }
  
  //Returns the euclidian distance between two vectors
  float distance(Vector other)
  {
    return sqrt( pow(_x - other._x, 2) + pow(_y - other._y, 2) );
  }
  
  //Returns the length of the vector
  float length()
  {
    return distance(new Vector(0,0));
  }
  
  //Normalize the vector
  void normalize()
  {
    float l = length();
    _x /= l;
    _y /= l;
  }
  
  //Returns the reflection to a normal
  //NB: the normal must be normalized
  Vector reflection(Vector normal)
  {
    //Formula is: u = v - 2 * v.n * n
    return this.substract(normal.multiply(2*this.dot(normal)));
  }
}