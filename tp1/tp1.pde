// IMPI comisión 2
PImage miobjetofavorito;

void setup(){
  size(800, 400);
  background(0);
 miobjetofavorito = loadImage ("miobjetofavorito.jpeg");
}

void draw(){
 background(0);
 image (miobjetofavorito,0,0,400,400);
  //cabeza del martillo
 fill (150);
 strokeWeight(5);
 fill(150);
 rect(597,45,40,40);
 rect(599,83,36,10);
 rect(637,57,38,15);
 stroke(150);
 strokeWeight(17);
 line(670,58,670,71);
 strokeWeight(5);
 bezier(598,45,571,47,565,64,543,90);
 bezier(543,90,565,76,553,78,593,60);
 triangle(568,68,593,63,593,50);
 //mango del martillo
 strokeWeight (26);
 line (617,60,617,341);
 line (616,265,612,341);
 line (616,265,620,341);

}
