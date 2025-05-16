//IPMI comisión 2
int pantalla = 0; // 0 = inicio, 1 = historia, 2 = final
int tiempoInicioPantalla2 = 0;
int duracionPantalla2 = 240; // 4 segundos a 60 fps
float textoY = -100; // posición inicial del texto
PImage fighting_force;
PImage logo;
PImage fighting_force2;
PFont PressStart2P;
PFont VerminVibes;
PFont Force;
PFont Fighting;

void setup() {
  size(640, 480);
  logo = loadImage("logo.png");

  fighting_force = loadImage("fighting_force.png");
  fighting_force2 = loadImage("fighting_force2.png");

  // Asegurate de que estos archivos estén en la carpeta /data
  Fighting = createFont("Impact-100.ttf", 80);
  Force = createFont("FootlightMTLight-100.ttf", 60);
  PressStart2P = loadFont ("PressStart2P.vlw");
  VerminVibes = loadFont ("VerminVibes.vlw");

  textAlign(CENTER, CENTER);

}

void draw() {
  background(0);

  if (pantalla == 0) {
    image(logo, 120, 40, 400, 400);

    textFont(Fighting);
    fill(255);
    text("FIGHTING", 319, 200); text("FIGHTING", 321, 200);
    text("FIGHTING", 320, 199); text("FIGHTING", 320, 201);
    fill(255, 0, 0);
    text("FIGHTING", 320, 200);

    textFont(Force);
    fill(255);
    text("F O R C E", 320, 300);

    textFont(PressStart2P);
    fill(255);
    text("© & TH Core Design Limited 1997. \n © Published by Eidos Interactive Limited 1997. \n All Rights Reserved.", 320, 436);  

    if (frameCount % 60 < 30) {
      textFont(VerminVibes);
      fill(255);
      text("Press Start Button", 320, 400);
    }

  } else if (pantalla == 1) {
    image(fighting_force, 120, 40, 400, 400);

    if (textoY < 320) {
      textoY += 2;
    }

    textFont(PressStart2P);
    fill(255);
    text("En un mundo sumido en el caos, un grupo clandestino \n de combatientes se une para enfrentar una red criminal \n que controla la ciudad con puño de hierro.\n Enfrentá enemigos en calles oscuras, fábricas \n abandonadas y laboratorios secretos usando fuerza bruta, \n combos y armas urbanas.", 320, textoY);

    if (frameCount - tiempoInicioPantalla2 > duracionPantalla2) {
      pantalla = 2;
    }

  } else if (pantalla == 2) {
    image(fighting_force2, 120, 40, 400, 400);

    textFont(VerminVibes);
    fill(255);
    text("¡Bienvenid@ al juego!", 320, 440);
  }
}

void mousePressed() {
  if (pantalla == 0) {
    float boton = dist(mouseX, mouseY, 320, 400);
    if (boton < 100) {
      pantalla = 1;
      tiempoInicioPantalla2 = frameCount;
      textoY = -100; // reiniciamos el movimiento del texto
    }
  }
}
