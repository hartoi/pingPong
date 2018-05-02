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

if( xPaikka < 0 || width < xPaikka){
  xNopeus *= -1;
}

if( yPaikka < 0 || height < yPaikka ){
  yNopeus *= -1;
}
}

void keyPressed(){
  if( key == 'w' ){
     println("Palkki ylös"); 
     if( palkinKeskiKohta > 0 ) {
       palkinKeskiKohta -= 5;
     }
  }
  if( key == 's' ){
     println("Palkki alas"); 
     if( palkinKeskiKohta < height ) {
       palkinKeskiKohta += 5;
     }
  }
  
//  palkinKeskiKohta = mouseY;
}
