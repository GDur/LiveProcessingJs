/* Gregor Altstädt
 * 30.10.12*/

  // Aufgabe 1. aufläsung setzen
  v2 theSize = new v2(800, 600);
  v2 sizeh = theSize.md(0.5);

  // Aufgabe 2. diese koordinate wird der neue nullpunkt
  v2 mp = new v2(400, 300);

  // Aufgabe 3.
  class Circle
  {
    v2 pos, d, v;
    float timeToRun = 100;
    float r;
    int c = color(255,128,50);

    Circle(v2 pos, float r, v2 v)
    {
      this.pos = pos;
      this.d = new v2(r, r);
      this.v = v;
    }

    Circle(float d, v2 v)
    {
      this.pos = new v2();
      this.d = new v2(d, d);
      this.r = d / 2;
      this.v = v;
    }

    void move(float dt)
    {
      this.timeToRun -= dt;

      // Aufgabe 3. a)
      this.pos = pos.t(v.md(dt));
      if (pos.x + r > sizeh.x || pos.x < -sizeh.x + r)
        this.v = this.v.m(new v2(-1, 1));

      if (pos.y + r > sizeh.y || pos.y < -sizeh.y + r)
        this.v = this.v.m(new v2(1, -1));

      // Aufgabe 3. b)
      if (this.timeToRun <= 0)
        this.v.setZero();
    }

    void draw()
    {
      fill(c);
      vellipse(pos, d);
    }
  }

  // Aufgabe 4. a
  class Area
  {
    v2 pos, dim;
    int c = color(2,128,50);

    Area(v2 pos, v2 dim)
    {
      this.pos = pos;
      this.dim = dim;
    }

    // Aufgabe 4. a
    void contain(Circle c)
    {
      this.c = color(255,128,50);

      if (c.pos.x - c.r <= pos.x || c.pos.x >= pos.x + dim.x - c.r)
        c.v = c.v.m(new v2(-1, 1));

      if (c.pos.y - c.r <= pos.y || c.pos.y >= pos.y + dim.y - c.r)
        c.v = c.v.m(new v2(1, -1));
    }

    void draw()
    {
      fill(c);
      vrect(pos, dim);
      c = color(2,128,50);
    }
  }  

  // Aufgabe 3.
  Circle ball = new Circle(20, new v2(50, 101));
  Area area = new Area(new v2(-40, -40), new v2(200, 150));
  float dt = 0;
  float t;

  public void setup()
  {
    println("press backspace to restart");
    frameRate(60);
    // Aufgabe 1. set size
    size( theSize.x,  theSize.y);
    t = millis() * 0.001f;
    smooth();
  }

  public void draw()
  {
    dt = millis() * 0.001f - t;
    pushMatrix();

    // Aufgabe 2. "transalte" verschiebt nullpunkt und "scale" dreht die
    // y-achse um
    translate(mp.x, mp.y);
    scale(1.0f, -1.0f);
    background(18);


    // Aufgabe 1. draw cross
    vline(new v2(-sizeh.x, 0), new v2(sizeh.x, 0));
    vline(new v2(0, -sizeh.y), new v2(0, sizeh.y));

    ball.v = ball.v.md(1.001);
    ball.move(dt);
    //area.contain(ball);
    area.draw();
    ball.draw();

    // Line(new v2(0, 0), new v2(40, 40));
    popMatrix();
    t = millis() * 0.001f;
  }


  void keyReleased()
  {
    if (key == BACKSPACE)
    {
      println("reset");
      ball = new Circle(20, new v2(50, 101));
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



class v2
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

  v2 md(double d)
  {
    float f = (float) d;
    return new v2(this.x * f, this.y * f);
  }

  float l(v2 v)
  {
    return (float) Math.sqrt((this.x + v.x) * (this.x + v.x) + (this.y + v.y) * (this.y + v.y));
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
}
