int xPaikka,yPaikka,pallonHalkaisija;
void setup(){
  xPaikka = 50;
  yPaikka = 50;
  pallonHalkaisija = 10;
}

void draw(){
background(255,255,125);
ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija);
}
