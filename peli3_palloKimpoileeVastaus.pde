int xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija;
void setup(){
  size(800,350);
  xPaikka = width / 2;
  yPaikka = height / 2;
  pallonHalkaisija = 10;
  xNopeus = 3;
  yNopeus = 5;
}

void draw(){
background(255,255,125);
ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija); // Piirretään peliväline
xPaikka += xNopeus; // Päivitetään nopeudet
yPaikka += yNopeus;

if( xPaikka < 0 || width < xPaikka){
  xNopeus *= -1;
}

if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}

}
