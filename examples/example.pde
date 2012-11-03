// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.

int num = 104;

float mx[] = new float[num];
float my[] = new float[num];

int vx = 0;
int vy = 0;
int maxv = 40;

void setup()
{
	size(800, 600);
	smooth();
	noStroke(0);
	fill(0);
	for(int i=1; i<num; i++) {
		mx[i]	= width/2;
		my[i]	= height/2;
	}
}

void draw()
{
	background(225,65,5); 
	for(int i=1; i<num; i++) {
		mx[i-1] = mx[i];
		my[i-1] = my[i];
	}

	//mx[num-1] = mouseX;
	//my[num-1] = mouseY;
	vx += random(-0.5, 0.5);
	vy += random(-0.5, 0.5);

	mx[num-1] = mx[num-1] + vx ;
	my[num-1] = my[num-1] + vy;

	if(vx > maxv)
		vx = maxv
	if(vx < -maxv)
		vx = -maxv
	if(vy > maxv)
		vy = maxv
	if(vy < -maxv)
		vy = -maxv

	if(mx[num-1] < 0)
		mx[num-1] = width;
	if(mx[num-1] > width)
		mx[num-1] = 0;

	if(my[num-1] < 0)
		my[num-1] = height;

	if(my[num-1] > height)
		my[num-1] = 0;

	for(int i=0; i<num; i++) {
		ellipse(mx[i], my[i], i/4, i/4);
	}
}