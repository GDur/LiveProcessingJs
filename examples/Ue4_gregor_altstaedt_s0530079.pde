/* Gregor Altstädt
* s0530079
* 14.11.12
*/


float G = 9.81;
// Aufgabe 1. aufläsung setzen
final v2 theSize = new v2(400, 600);
final v2 sizeh = theSize.m(0.5);


float M = theSize.y / 12;
float Gm = G * M;
class Circle
{
	int green	= color(0, 200, 0);
	int red		= color(200, 0, 0);

	v2 startPos, vel;
	v2 pos ;
	float r, d;

	int tmpColor = red;
	float currentTime = 0.0;
	Circle(v2 startPos, float d)
	{
		this.vel		= new v2(3,5).m(M);
		this.startPos	= startPos.m(M);
		this.d			= d * M;
		this.r			= d / 2;
		this.pos = new v2(0,0); 
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
	void move(dt)
	{
		currentTime += dt;
		pos.y = startPos.y - Gm * currentTime * currentTime / 2 + vel.y * currentTime; 
		pos.x = startPos.x + vel.x *currentTime;

		//pos = pos.t(vel.m(-currentTime));
		log(pos);
	}

	void MouseCheck(v2 mouse)
	{
		tmpColor = red;
		if (contains(mouse))
			tmpColor = g;
	}
}

// Aufgabe 2. diese koordinate wird der neue nullpunkt
final v2 mp = new v2(10, 590);
v2 mouse = new v2();

// Aufgabe 3.
Circle circle = new Circle(new v2(0, 10), 0.25);
float dt = 0;
float t;



/*
 newX = this.startPos.x() + velocity.x() * currentTime
    newY = this.startPos.y() -G * currentTime * currentTime/2 + velocity.y() * currentTime
    this.pos = new Vec2(newX, newY)
*/

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
	line( -mp.x, 0								, theSize.x - mp.x, 0		);
	line( 0		 , mp.y - theSize.y , 0								, mp.y);

	circle.move(dt);
	circle.draw();

	popMatrix();
	t = millis() * 0.001f;
}

public void keyReleased()
{
	if (key == BACKSPACE)
	{
		//println("reset");
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