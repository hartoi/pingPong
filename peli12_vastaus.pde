float xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija,palkinKeskiKohta,palkinPituus,palkinLeveys,pelaajan2PalkinKeskiKohta;
int pelaajan1Pisteet,pelaajan2Pisteet;
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
  pelaajan1Pisteet = 0;
  pelaajan2Pisteet = 0;
}

void draw(){
background(255,255,125);

textSize(20);
fill(0, 102, 153);
text("Pelaaja 1:"+pelaajan1Pisteet, 20, 30);

rect(0,palkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);
rect(width - palkinLeveys,pelaajan2PalkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);

ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija); // Piirretään peliväline
xPaikka += xNopeus; // Päivitetään nopeudet
yPaikka += yNopeus;

if( xPaikka < 0 ){
  // asetetaan pallo Keskelle
  resetoiPallo();
}

if( width < xPaikka){
    // asetetaan pallo Keskelle
  pelaajan1Pisteet += 1;
  resetoiPallo();
}
// vasemman pelaajan palikasta kimpoaminen
if( palkinKeskiKohta - palkinPituus /2 < yPaikka &&
    yPaikka < palkinKeskiKohta + palkinPituus / 2  &&
    xPaikka < palkinLeveys ){  // pallo osuu palikkaan
    float osumanSuhde = abs(palkinKeskiKohta - yPaikka) / ( palkinPituus / 2 );
    println(osumanSuhde);
    xNopeus *= -1;
    yNopeus *= (osumanSuhde + 0.8);
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
   yNopeus *= (osumanSuhde + 0.8);
//   xNopeus *= (osumanSuhde + 0.5);
  println("Nopeus on :"+xNopeus);
}


if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}
// Äly oikean puoleiselle pelaajalle
if( pelaajan2PalkinKeskiKohta - 10  < yPaikka ) {
   pelaajan2PalkinKeskiKohta += 5; 
}

if( pelaajan2PalkinKeskiKohta + 10 > yPaikka ) {
   pelaajan2PalkinKeskiKohta -= 5; 
}


}

void resetoiPallo(){
  xNopeus = random(2,5);
  yNopeus = random(2,5);
  xPaikka = width / 2;
  yPaikka = height /2;
}

void mouseMoved(){
 palkinKeskiKohta = mouseY;
 //pelaajan2PalkinKeskiKohta = mouseY;
}
