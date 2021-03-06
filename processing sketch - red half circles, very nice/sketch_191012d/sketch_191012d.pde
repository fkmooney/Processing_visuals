//more at https://github.com/pkd2512/inktober2017/tree/master/shy

float x1,y1,dim,n=1;
void setup()
{
  size(1024,1024);
  gradient(0,0,width,height,#41295a,#2F0743);
  smooth();
  x1=width/2;
  y1=height/2;
  dim=width;
  smile(x1,y1,dim);
  upper(x1,y1,dim);
  
  save("shy.png");
}


void upper(float x, float y, float d)
{
  ellipseMode(CENTER);
  smooth();
  stroke(#ec008c);
  //noFill();
  strokeWeight(0.314);
  noStroke();
  fill(lerpColor(#FC466B,#FC466B,map(n,0,height,0,1)),69);
  arc(x,y,d,d, PI*(n), PI*(n+1));
  print(x1," ");
  d = d/2;
  float xa=x,xb=x;
  if (d>5)
  {
    xa-=d/2;
    xb+=d/2;
    upper(xa,y,d);
    upper(xb,y,d);
  }  
  n+=2;
}

void lower(float x, float y, float d)
{
  ellipseMode(CENTER);
  //stroke(255);
  //noFill();
  //strokeWeight(2);
  noStroke();
  fill(lerpColor(#E5008D,#FF070B,map(n,width/2,0,0,1)),120);
  arc(x,y,d,d, PI*(n-1), PI*(n));
  print(x1," ");
  d = d/2;
  float xa=x,xb=x;
  if (d>5)
  {
    xa-=d/2;
    xb+=d/2;
    lower(xa,y,d);
    lower(xb,y,d);
  }  
  n+=2;
}

void smile(float x, float y, float d)
{
  ellipseMode(CENTER);
  smooth();
  stroke(#ec008c);
  //noFill();
  strokeWeight(n/PI);
  noStroke();
  if (d==width) noFill();
  else  fill(lerpColor(#FC466B,#E5008D,map(n,height/2,height,0,1)),69);
  arc(x,y,d,d, 0, PI);
  if (d>5)
  {
    d-=d/2;
    smile(x,y,d);
  }
}
void gradient(int x, int y, float w, float h, color c1, color c2)
{
  for (int i=y; i<=y+h; i++)
  {
    float inter=map(i,y,y+h,0,1);
    stroke (lerpColor(c1,c2,inter));
    line(x,i,x+w,i);
    
  }
}
