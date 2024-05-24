//comision 5
//zoe orellano
//legajo 119104/0
PImage fondo, img1, img2, img3;
PFont fuente;
String[] textos = {
  "Nana: es un manga \nsobre dos amigas que se conocen camino a mudarse \na Tokio.",
  "Las dos se llaman de la misma manera \ny una de ellas sueña con hacer música \nen una banda de amigxs,\n mientras la otra es su gran fan.",
  "Juntxs, van a cumplir su sueño más grande \nlleno de historias lindas y complejas."
};
int pantalla = 0;
int tiempoUltimoCambio;
int tiempoPorPantalla = 17000; // 17 segundos
int botonAncho = 100;
int botonAlto = 50;
int cuadroMargen = 50; // Margen alrededor del texto
float textoPosX; // Posición X del texto
float textoPosY; // Posición Y del texto
float botonX, botonY; // Posición del botón "Reiniciar"
float velocidad = -3; // Velocidad de movimiento

void setup() {
  size(640, 480);
  fondo = loadImage("nana 8.jpg");
  fuente = createFont("AgencyFB-Bold", 20);
  tiempoUltimoCambio = millis();
  img1 = loadImage("nana 8.jpg");
  img2 = loadImage("nana 6.jpg");
  img3 = loadImage("nana 4.jpg");
  
  // Establecer posición inicial del texto al centro de la pantalla
  textoPosY = height / 2;
  
  // Posición inicial del botón "Reiniciar" centrada en la parte inferior
  botonX = width / 2;
  botonY = height - 50;
  reiniciarTextoPosX();
}

void draw() {
  background(0);
  switch (pantalla) {
    case 0:
      image(img1, 0, 0, width, height);
      break;
    case 1:
      image(img2, 0, 0, width, height);
      break;
    case 2:
      image(img3, 0, 0, width, height);
      break;
  }
  
  // Texto
  textFont(fuente);
  textAlign(CENTER, CENTER); 
  fill(150, 0, 0); 
  textSize(25);
  // Movimiento de derecha a izquierda
  textoPosX += velocidad;
  if (textoPosX < -textWidth(textos[pantalla]) / 2) {
    reiniciarTextoPosX();
  }
  text(textos[pantalla], textoPosX, height / 2); // Posición en el centro
  
  // Efecto de cuadro alrededor del texto
  noFill();
  stroke(150, 0, 0); // Color del cuadro
  strokeWeight(2);
  float cuadroAncho = textWidth(textos[pantalla]) + cuadroMargen * 2;
  float cuadroAlto = textAscent() + textDescent() + cuadroMargen * 2;
  rectMode(CENTER);
  rect(textoPosX, height / 2, cuadroAncho, cuadroAlto); // Dibujar cuadro alrededor del texto
  
  // Botón (solo en la última pantalla)
  if (pantalla == 2) {
    fill(100);
    rect(botonX, botonY, botonAncho, botonAlto);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Reiniciar", botonX, botonY); // Centrar el texto con respecto al botón
  }
  
  // Verificar cambio de pantalla por tiempo
  if (pantalla < 2 && millis() - tiempoUltimoCambio > tiempoPorPantalla) {
    siguientePantalla();
    tiempoUltimoCambio = millis();
    reiniciarTextoPosX();
  }
}

void mouseClicked() {
  // Verificar si se hizo clic en el botón "Reiniciar"
  if (pantalla == 2 && mouseX > botonX - botonAncho / 2 && mouseX < botonX + botonAncho / 2 && mouseY > botonY - botonAlto / 2 && mouseY < botonY + botonAlto / 2) {
    reiniciar();
  }
}

void siguientePantalla() {
  pantalla = (pantalla + 1) % 3; // 3 pantallas en total
}

void reiniciar() {
  pantalla = 0;
  tiempoUltimoCambio = millis(); // Restablecer el tiempo al cambiar a la primera pantalla
  reiniciarTextoPosX();
}

void reiniciarTextoPosX() {
  textoPosX = width + textWidth(textos[pantalla]) / 2; // Iniciar desde la derecha
}
