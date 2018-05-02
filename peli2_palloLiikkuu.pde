int xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija;
void setup(){
  size(800,350);
  xPaikka = width / 2;
  yPaikka = height / 2;
  pallonHalkaisija = 10;
  xNopeus = 1;
  yNopeus = 1;
}

void draw(){
background(255,255,125);
ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija);
xPaikka += xNopeus;
yPaikka += yNopeus;
}
