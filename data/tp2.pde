//IPMI comisión 2

PImage fightingforce;
String titulo = "Fighting Force";
int posXnombre = 0;
PFont fuente;
color rojooOscuro = color(150,0,0);


void setup () {
  size(640, 480);
  background(0);
  fightingforce = loadImage("fighting force.png");
  textAlign(CENTER, CENTER);
  
  fuente= createFont("Georgia-Bold",64);
  textFont(fuente);
  textAlign(CENTER, CENTER);
}

void draw () {
  background(0);
  image(fightingforce,200,50);
  println(posXnombre);
  
  textSize(36);
  fill(128);
  text("Fighting Force", 200, 50);
  fill(255);
  text (titulo, posXnombre, height/2);
  
}

void keyPressed(){
  textSize(random(30,90));
  fill(0);
  text(titulo, mouseX, mouseY);
}
