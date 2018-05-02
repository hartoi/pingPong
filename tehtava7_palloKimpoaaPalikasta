float xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija,palkinKeskiKohta,palkinPituus,palkinLeveys;
void setup(){
  size(800,300);
  xPaikka = width / 2;
  yPaikka = height / 2;
  pallonHalkaisija = 10;
  xNopeus = 3;
  yNopeus = 5;
  palkinKeskiKohta = height/2;
  palkinPituus = 80;
  palkinLeveys = 8;
}

void draw(){
background(255,255,125);
rect(0,palkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);
ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija); // Piirretään peliväline
xPaikka += xNopeus; // Päivitetään nopeudet
yPaikka += yNopeus;

if( xPaikka < 0 ){
  // asetetaan pallo Keskelle
  xPaikka = width / 2;
  yPaikka = height / 2;
  xNopeus = random(8);
  yNopeus = random(8); // processing random
}

if( width < xPaikka){
  xNopeus *= -1;
}

if( palkinKeskiKohta - palkinPituus /2 < yPaikka &&
    yPaikka < palkinKeskiKohta + palkinPituus / 2  &&
    xPaikka < palkinLeveys ){  // pallo osuu palikkaan
    xNopeus *= -1;
}


if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}
}

void mouseMoved(){
 palkinKeskiKohta = mouseY;
}
