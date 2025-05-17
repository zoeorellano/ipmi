//IPMI comisión 2
int pantalla = 0; // 0 = pantalla 1, 1 = pantalla 2, 2 = pantalla 3
int tiempoInicioPantalla = 0;
int duracionPantalla = 360; // 1 segundo = 60 fps, 6 segundos = 360 fps
float textoY = -100;
float textoX = 0;

PImage logo;
PImage fighting_force;
PImage fighting_force2;

PFont PressStart2P;
PFont VerminVibes;
PFont Foot;
PFont Impact;

color rojoOscuro = color(139, 0, 0);
color rojoOpacidad = color(139, 0, 0, 120);


void setup() {
  size(640, 480); 

  logo = loadImage("logo.png");
  fighting_force = loadImage("fighting_force.png");
  fighting_force2 = loadImage("fighting_force2.png");

  Impact = loadFont("Impact-100.vlw");
  Foot = loadFont("FootlightMTLight-100.vlw");
  PressStart2P = createFont("PressStart2P.ttf", 10);
  VerminVibes = createFont("VerminVibes.ttf", 20);

  textAlign(CENTER, CENTER); 
}

void draw() {
  background(0); 

  //pantalla 1
  if (pantalla == 0) {
    image(logo, 120, 40, 400, 400);

    textFont(Impact);
    //contorno de titulo 
    fill(255); 
    text("FIGHTING", 319, 200);
    text("FIGHTING", 321, 200);
    text("FIGHTING", 320, 199);
    text("FIGHTING", 320, 201);
    //titulo
    fill(rojoOscuro); 
    text("FIGHTING", 320, 200);
    //titulo 2
    textFont(Foot);
    fill(255);
    text("F O R C E", 320, 300);
    //texto inferior
    textFont(PressStart2P);
    text("© & TH Core Design Limited 1997. \n © Published by Eidos Interactive Limited 1997. \n All Rights Reserved.", 320, 436);
    //texto central con animación
    // % crea un ciclo repetitivo, es verdadero cuando el valor es de 0 a 29 (se muestra el texto) y falso cuando el valor es de 30 a 59 (se esconde el texto)
    if (frameCount % 60 < 30) {
      textFont(VerminVibes);
      text("Press Start Button", 320, 400);
    }
  }

  // pantalla 2
  if (pantalla == 1) {
    image(fighting_force, 120, 40, 400, 400);
  //animación de texto
    if (textoY < 380) {
      textoY += 1; //velocidad
    }

    textFont(PressStart2P);
    fill(255);
    text("En un mundo sumido en el caos, un grupo clandestino \n de combatientes se une para enfrentar una red criminal \n que controla la ciudad con puño de hierro.\n Enfrentá enemigos en calles oscuras, fábricas \n abandonadas y laboratorios secretos usando fuerza bruta, \n combos y armas urbanas.", 320, textoY);
    //duración de pantalla antes del cambio
    if (frameCount - tiempoInicioPantalla > duracionPantalla+ 180) {
      pantalla = 2; 
      tiempoInicioPantalla = frameCount;
      textoX = width + 100;
    }
  }

  //pantalla 3
  if (pantalla == 2) {
    image(fighting_force2, 0, 50);
  //animación texto
    if (textoX > -100) {
    textoX -= 2; // velocidad 
  }

    textFont(Impact);
    fill(rojoOpacidad);
    text("F I N ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?", textoX+300, 100);

    //duración de pantalla antes del cambio
    if (frameCount - tiempoInicioPantalla > duracionPantalla + 60 ) {
      pantalla = 0;
      textoY = -100;
    }
  }
}

void mousePressed() {
  //botón de reinicio
  if (pantalla == 0) {
    float boton = dist(mouseX, mouseY, 320, 400);
    if (boton < 100) {
      pantalla = 1;
      tiempoInicioPantalla = frameCount;
      textoY = -100; 
    }
  }
}
