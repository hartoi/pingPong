float xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija,palkinKeskiKohta,palkinPituus,palkinLeveys,pelaajan2PalkinKeskiKohta;
void setup(){
  size(800,300);
  xPaikka = width / 2;
  yPaikka = height / 2;
  pallonHalkaisija = 10;
  xNopeus = 3;
  yNopeus = 5;
  palkinKeskiKohta = height/2;
  pelaajan2PalkinKeskiKohta = height/2;
  palkinPituus = 80;
  palkinLeveys = 25;
}

void draw(){
background(255,255,125);
rect(0,palkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);
rect(width - palkinLeveys,pelaajan2PalkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);

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
    // asetetaan pallo Keskelle
  xPaikka = width / 2;
  yPaikka = height / 2;
  xNopeus = random(1,4);
  yNopeus = random(-4,4); // processing random
}
// vasemman pelaajan palikasta kimpoaminen
if( palkinKeskiKohta - palkinPituus /2 < yPaikka &&
    yPaikka < palkinKeskiKohta + palkinPituus / 2  &&
    xPaikka < palkinLeveys ){  // pallo osuu palikkaan
    float osumanSuhde = abs(palkinKeskiKohta - yPaikka) / ( palkinPituus / 2 );
    println(osumanSuhde);
    xNopeus *= -1;
//    yNopeus *= (osumanSuhde + 0.5);
//    xNopeus *= (osumanSuhde + 0.5);
  println("Nopeus on :"+xNopeus);

}
// oikean pelaajan palikasta kimpoaminen
if( pelaajan2PalkinKeskiKohta - palkinPituus / 2 < yPaikka &&
    yPaikka < pelaajan2PalkinKeskiKohta + palkinPituus / 2 &&
    width - palkinLeveys < xPaikka  
  ){  // pallo osuu palikkaan
  float osumanSuhde = abs(pelaajan2PalkinKeskiKohta - yPaikka) / ( palkinPituus / 2 );
  println(osumanSuhde);
   xNopeus *= -1;
//   yNopeus *= (osumanSuhde + 0.5);
//   xNopeus *= (osumanSuhde + 0.5);
  println("Nopeus on :"+xNopeus);
}


if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}
}

void mouseMoved(){
 palkinKeskiKohta = mouseY;
 pelaajan2PalkinKeskiKohta = mouseY;
}
