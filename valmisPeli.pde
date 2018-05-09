float xPaikka,yPaikka,xNopeus,yNopeus,pallonHalkaisija,palkinKeskiKohta,palkinPituus,palkinLeveys,pelaajan2PalkinKeskiKohta;
int pelaajan1Pisteet,pelaajan2Pisteet,maksimiPisteet;
String TILA;

//PImage img;

void setup(){
  size(600,600);
  xPaikka = width / 2;
  yPaikka = height / 2;
  pallonHalkaisija = 10;
  xNopeus = 3;
  yNopeus = 5;
  palkinKeskiKohta = height/2;
  pelaajan2PalkinKeskiKohta = height/2;
  palkinPituus = 80;
  palkinLeveys = 5;
  pelaajan1Pisteet = 0;
  pelaajan2Pisteet = 0;
  maksimiPisteet = 2;
  TILA = "ALKU";
//  img = loadImage("pp.jpg");

}

void draw(){
  // alkunäyttöosa
  if( TILA == "ALKU" ){
//  image(img, 0, 0,width,height);

    fill(255,23,100);
//    rect(0,0,width,height);
    textSize(30);
    fill(255, 102, 3);
    text("Tervetuloa pelaamaan PINGPONGia",20,50);  
    textSize(10);
    text("Paina hiirtä aloittaaksesi",50,70);  

 }
  else if( TILA == "PELI" ){
    peliKaynnissa();
  }

} // draw-funktio loppuu

void mousePressed(){
  if(TILA == "ALKU" ) {
  //  if( 200 < mouseX && mouseX < 300 && 200 < mouseY && mouseY < 300)
  //   {
        TILA = "PELI";
  //    }
  }
  if(TILA == "LOPPU" ) {
     pelaajan1Pisteet = 0;
     pelaajan2Pisteet = 0;
     resetoiPallo();
     TILA = "PELI";
     loop();
    //  if( 200 < mouseX && mouseX < 300 && 200 < mouseY && mouseY < 300)
  //   {
//        TILA = "PELI";
  //    }
  }
}

void peliKaynnissa(){
paivitaRuutu();
paivitaNopeus();
hoidaPallonTormays();
kunPalloOsuuPalkkiin();
tietokoneLiikuttaa();  
}


void tietokoneLiikuttaa(){
  // Äly oikean puoleiselle pelaajalle
if( pelaajan2PalkinKeskiKohta - 10  < yPaikka ) {
   pelaajan2PalkinKeskiKohta += 5; 
}

if( pelaajan2PalkinKeskiKohta + 10 > yPaikka ) {
   pelaajan2PalkinKeskiKohta -= 5; 
}
}

void kunPalloOsuuPalkkiin(){
  
// vasemman pelaajan palikasta kimpoaminen
if( palkinKeskiKohta - palkinPituus /2 < yPaikka &&
    yPaikka < palkinKeskiKohta + palkinPituus / 2  &&
    xPaikka < palkinLeveys ){  // pallo osuu palikkaan
    xPaikka -= xNopeus;
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
}


void hoidaPallonTormays(){
  if( xPaikka < 0 ){
  // asetetaan pallo Keskelle
    pelaajan2Pisteet += 1;
    resetoiPallo();
  }

  if( width < xPaikka){
    // asetetaan pallo Keskelle
  pelaajan1Pisteet += 1;
  resetoiPallo();
  }
  if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}

}

void paivitaNopeus(){
 xPaikka += xNopeus; // Päivitetään nopeudet
yPaikka += yNopeus;
}


void paivitaRuutu(){
  background(255,255,125);

textSize(20);
fill(0, 102, 153);
text("Pelaaja 1:"+pelaajan1Pisteet, 20, 30);
text("Pelaaja 2:"+pelaajan2Pisteet, width - 150, 30);

rect(0,palkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);
rect(width - palkinLeveys,pelaajan2PalkinKeskiKohta - palkinPituus / 2,palkinLeveys,palkinPituus);

ellipse(xPaikka,yPaikka,pallonHalkaisija,pallonHalkaisija); // Piirretään peliväline
}


void resetoiPallo(){
  if( pelaajan1Pisteet >= maksimiPisteet ){
     // aseta voitto teksti 
    text("Pelaaja 1 voitti!", width /2 - 100, height /2);
    text("Klikkaa hiirtä aloittaaksesi uusi peli", width /2 - 100, height /2 +50);

    noLoop();
    TILA = "LOPPU";
 
  }
  else if(pelaajan2Pisteet >= maksimiPisteet ){
     // aseta voittoteksti 
    text("Pelaaja 2 voitti!", width /2 - 100, height /2);
    text("Klikkaa hiirtä aloittaaksesi uusi peli", width /2 - 100, height /2 +50);

    noLoop();
    TILA = "LOPPU";
}
  else {
    xNopeus = random(2,5);
    yNopeus = random(2,5);
    xPaikka = width / 2;
    yPaikka = height /2;
  }
}

void mouseMoved(){
 palkinKeskiKohta = mouseY;
 //pelaajan2PalkinKeskiKohta = mouseY;
}
