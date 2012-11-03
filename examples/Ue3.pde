/* Gregor Altstädt
* 30.10.12*/

// Aufgabe 4. a
class RectBorder
{
  v2 pos, dim;
  int g = color(0, 200, 0);
  int r = color(200, 0, 0);
  int tmpColor = r;
  v2 pos2;
  
  v2 dim2;

  RectBorder(v2 pos, v2 dim, v2 pos2, v2 dim2)
  {
    this.pos = pos;
    this.dim = dim;
    this.pos2 = pos2;
    this.dim2 = dim2;
  }

  boolean contains(v2 c)
  {
    if (c.x >= pos.x - dim.x / 2 && c.x <= pos.x + dim.x / 2 && c.y >= pos.y - dim.y / 2 && c.y <= pos.y + dim.y / 2)
    {
      return isOutside(c);
    }
    return false;
  }

  private boolean isOutside(v2 c)
  {
    if (c.x <= pos2.x - dim2.x / 2 || c.x >= pos2.x + dim2.x / 2 || c.y <= pos2.y - dim2.y / 2 || c.y >= pos2.y + dim2.y / 2)
    {
      return true;
    }
    return false;
  }

  void draw()
  {
    fill(tmpColor);
    vrect(pos, dim);
    fill(0, 0, 0);
    vrect(pos2, dim2);
  }

  public void MouseCheck(v2 mouse)
  {
    tmpColor = r;
    if (contains(mouse))
      tmpColor = g;
  }
}

class Circle
{
  v2 pos;
  float r, d;
  int g = color(0, 200, 0);
  int red = color(200, 0, 0);
  int tmpColor = red;

  Circle(v2 pos, float d)
  {
    this.pos = pos;
    this.d = d;
    this.r = d / 2;
  }

  boolean contains(v2 c)
  {
    if (pos.absmabs(c) <= r * r)
    {
      return true;
    }
    return false;
  }

  void draw()
  {
    fill(tmpColor);
    vellipse(pos, new v2(d, d));
  }

  public void MouseCheck(v2 mouse)
  {
    tmpColor = red;
    if (contains(mouse))
      tmpColor = g;
  }
}

// Aufgabe 1. aufläsung setzen
final v2 theSize = new v2(800, 400);
final v2 sizeh = theSize.m(0.5);

// Aufgabe 2. diese koordinate wird der neue nullpunkt
final v2 mp = new v2(200, 200);
v2 mouse = new v2();
// Aufgabe 3.
RectBorder area = new RectBorder(new v2(0, 0), new v2(100, 100), new v2(0, 0), new v2(80, 80));
Circle circle = new Circle(new v2(150, 0), 100);
float dt = 0;
float t;

public void setup()
{
  rectMode(CENTER);
  ellipseMode(CENTER);
  println("press backspace to restart");
  frameRate(60);
  // Aufgabe 1. set size
  size((int) theSize.x, (int) theSize.y);
  t = millis() * 0.001f;
  smooth();
}

public void draw()
{
  mouse = new v2(mouseX, mouseY).t(mp.m(-1));
  dt = millis() * 0.001f - t;
  pushMatrix();

  // Aufgabe 2. "transalte" verschiebt nullpunkt und "scale" dreht die
  // y-achse um
  translate(mp.x, mp.y);
  scale(1.0f, -1.0f);
  background(128);


  // Aufgabe 1. draw cross
  line(-sizeh.x,    0,  sizeh.x, 0);
  line(0, -sizeh.y, 0, sizeh.y);

  area.MouseCheck(mouse);
  area.draw();
  circle.MouseCheck(mouse);
  circle.draw();

  popMatrix();
  t = millis() * 0.001f;
}

public void keyReleased()
{
  if (key == BACKSPACE)
  {
    println("reset");
  }
}

void vline(v2 p, v2 p2)
{
  // p = p.t(mp);
  // p2 = p2.t(mp);
  line(p.x, p.y, p2.x, p2.y);
}

void vellipse(v2 p, v2 dim)
{
  // p = p.t(mp);
  ellipse(p.x, p.y, dim.x, dim.y);
}

void vrect(v2 p, v2 dim)
{
  // p = p.t(mp);
  rect(p.x, p.y, dim.x, dim.y);
}


public class v2
{
  float x, y;

  v2(double d, double e)
  {
    this.x = (float) d;
    this.y = (float) e;
  }

  v2()
  {
    this.x = 0;
    this.y = 0;
  }

  void set(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void set(v2 v)
  {
    this.x = v.x;
    this.y = v.y;
  }

  v2 t(v2 v)
  {
    return new v2(this.x + v.x, this.y + v.y);
  }

  v2 m(v2 v)
  {
    return new v2(this.x * v.x, this.y * v.y);
  }

  v2 m(double d)
  {
    float f = (float) d;
    return new v2(this.x * f, this.y * f);
  }

  float l(v2 v)
  {
    return (float) Math.sqrt((this.x - v.x) * (this.x - v.x) + (this.y - v.y) * (this.y - v.y));
  }

  v2 n()
  {
    float l = this.l(this);
    return new v2(this.x / l, this.y / l);
  }

  float getX()
  {
    return this.x;
  }

  float getY()
  {
    return this.y;
  }

  public void setZero()
  {
    this.x = 0;
    this.y = 0;
  }

  public String toString()
  {
    return "(" + this.x + "," + this.y + ")";

  }

  public float absmabs(v2 v)
  {
    return (this.x - v.x) * (this.x - v.x) + (this.y - v.y) * (this.y - v.y);
  }
}
/* Gregor Altstädt
* s0530079
* 30.10.12*/

// Aufgabe 4. a
class RectBorder
{
  v2 pos, dim;
  int g = color(0, 200, 0);
  int r = color(200, 0, 0);
  int tmpColor = r;
  v2 pos2;
  v2 dim2;

  RectBorder(v2 pos, v2 dim, v2 pos2, v2 dim2)
  {
    this.pos = pos;
    this.dim = dim;
    this.pos2 = pos2;
    this.dim2 = dim2;
  }

  boolean contains(v2 c)
  {
    if (c.x >= pos.x - dim.x / 2 && c.x <= pos.x + dim.x / 2 && c.y >= pos.y - dim.y / 2 && c.y <= pos.y + dim.y / 2)
    {
      return isOutside(c);
    }
    return false;
  }

  private boolean isOutside(v2 c)
  {
    if (c.x <= pos2.x - dim2.x / 2 || c.x >= pos2.x + dim2.x / 2 || c.y <= pos2.y - dim2.y / 2 || c.y >= pos2.y + dim2.y / 2)
    {
      return true;
    }
    return false;
  }

  void draw()
  {
    fill(tmpColor);
    vrect(pos, dim);
    fill(0, 0, 0);
    vrect(pos2, dim2);
  }

  public void MouseCheck(v2 mouse)
  {
    tmpColor = r;
    if (contains(mouse))
      tmpColor = g;
  }
}

class Circle
{
  v2 pos;
  float r, d;
  int g = color(0, 200, 0);
  int red = color(200, 0, 0);
  int tmpColor = red;

  Circle(v2 pos, float d)
  {
    this.pos = pos;
    this.d = d;
    this.r = d / 2;
  }

  boolean contains(v2 c)
  {
    if (pos.absmabs(c) <= r * r)
    {
      return true;
    }
    return false;
  }

  void draw()
  {
    fill(tmpColor);
    vellipse(pos, new v2(d, d));
  }

  public void MouseCheck(v2 mouse)
  {
    tmpColor = red;
    if (contains(mouse))
      tmpColor = g;
  }
}

// Aufgabe 1. aufläsung setzen
final v2 theSize = new v2(800, 400);
final v2 sizeh = theSize.m(0.5);

// Aufgabe 2. diese koordinate wird der neue nullpunkt
final v2 mp = new v2(200, 200);
v2 mouse = new v2();
// Aufgabe 3.
RectBorder area = new RectBorder(new v2(0, 0), new v2(100, 100), new v2(0, 0), new v2(80, 80));
Circle circle = new Circle(new v2(150, 0), 100);
float dt = 0;
float t;

public void setup()
{
  rectMode(CENTER);
  ellipseMode(CENTER);
  println("press backspace to restart");
  frameRate(60);
  // Aufgabe 1. set size
  size((int) theSize.x, (int) theSize.y);
  t = millis() * 0.001f;
  smooth();
}

public void draw()
{
  mouse = new v2(mouseX, mouseY).t(mp.m(-1));
  dt = millis() * 0.001f - t;
  pushMatrix();

  // Aufgabe 2. "transalte" verschiebt nullpunkt und "scale" dreht die
  // y-achse um
  translate(mp.x, mp.y);
  scale(1.0f, -1.0f);
  background(128);


  // Aufgabe 1. draw cross
  line(-sizeh.x,    0,  sizeh.x, 0);
  line(0, -sizeh.y, 0, sizeh.y);

  area.MouseCheck(mouse);
  area.draw();
  circle.MouseCheck(mouse);
  circle.draw();

  popMatrix();
  t = millis() * 0.001f;
}

public void keyReleased()
{
  if (key == BACKSPACE)
  {
    println("reset");
  }
}

void vline(v2 p, v2 p2)
{
  // p = p.t(mp);
  // p2 = p2.t(mp);
  line(p.x, p.y, p2.x, p2.y);
}

void vellipse(v2 p, v2 dim)
{
  // p = p.t(mp);
  ellipse(p.x, p.y, dim.x, dim.y);
}

void vrect(v2 p, v2 dim)
{
  // p = p.t(mp);
  rect(p.x, p.y, dim.x, dim.y);
}


public class v2
{
	float x, y;

	v2(double d, double e)
	{
		this.x = (float) d;
		this.y = (float) e;
	}

	v2()
	{
		this.x = 0;
		this.y = 0;
	}

	void set(float x, float y)
	{
		this.x = x;
		this.y = y;
	}

	void set(v2 v)
	{
		this.x = v.x;
		this.y = v.y;
	}

	v2 t(v2 v)
	{
		return new v2(this.x + v.x, this.y + v.y);
	}

	v2 m(v2 v)
	{
		return new v2(this.x * v.x, this.y * v.y);
	}

	v2 m(double d)
	{
		float f = (float) d;
		return new v2(this.x * f, this.y * f);
	}

	float l(v2 v)
	{
		return (float) Math.sqrt((this.x - v.x) * (this.x - v.x) + (this.y - v.y) * (this.y - v.y));
	}

	v2 n()
	{
		float l = this.l(this);
		return new v2(this.x / l, this.y / l);
	}

	float getX()
	{
		return this.x;
	}

	float getY()
	{
		return this.y;
	}

	public void setZero()
	{
		this.x = 0;
		this.y = 0;
	}

	public String toString()
	{
		return "(" + this.x + "," + this.y + ")";

	}

	public float absmabs(v2 v)
	{
		return (this.x - v.x) * (this.x - v.x) + (this.y - v.y) * (this.y - v.y);
	}
}
