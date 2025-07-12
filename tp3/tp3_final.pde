//IMPI COMISION 2
//https://youtu.be/4ipe-TnzNIQ

PImage imagen;

int filas = 20;
int columnas = 60;
float ejeX = 600;
float velocidad = 4;
boolean mover = false;

boolean cambiarColor = false;
int colorActual = 0;

color violeta = color (75, 0, 130);
color fucsia = color (170, 0, 129, 255);
color lila = color (100, 30, 100, 255);
color negro = color (0,0,0);

color colorInicio;
color colorFin;

float t = 0;


void setup () {
  size (800, 400);
  imagen = loadImage ("M_4.jpg");
  setColores ();
}

void draw () {
  image (imagen, 0, 0, 400, 400);
  dibujarTablero (filas, columnas, ejeX, cambiarColor);

  if (mover) {
    ejeX += velocidad;
    if (ejeX > 800 || ejeX < 400) {
      velocidad = velocidad * -1;
    }
  }
  //cambiarColor es true con keyPressed
  // si cambiarColor  Y t 0
  if (cambiarColor && t < 1) {
    t = t + 0.01;
  } else if (!cambiarColor) { 
    t= 0;
  }
}
void dibujarTablero (int filas, int columnas, float ejeX, boolean cambiarColor) {
  float y = 0;
  float alto = height / 20.0;

  for (int fila = 0; fila < filas; fila ++) {
    float x = 400;

    for (int columna = 0; columna < columnas; columna ++) {
      float distancia;

      if (x >= ejeX) {
        distancia = x - ejeX;
      } else {
        distancia = ejeX - x;
      }

      float ancho = map(distancia, 0, 200, 1, 40);

      color colorBase; 

      if ((fila + columna) % 2 == 0) {
        colorBase = color (0);
      } else {
        if (cambiarColor) {
          float gradiente = map (fila, 0, filas -1, 0, 1);  
          color c1 = lerpColor (colorInicio, colorFin, t);
          color c2 = lerpColor (colorFin, colorInicio, t);
          colorBase = generarColorInteractivo ( gradiente, c1, c2);
        } else {
          colorBase = color (255);
        }
      }
      fill (colorBase);
      noStroke ();
      rect (x, y, ancho, alto);
      x += ancho;
    }
    y += alto;
  }
}

color generarColorInteractivo (float gradiente, color c1, color c2) {  
  float variacion = random (-0.15, 0.15); 
  float g = gradiente + variacion;

  if (g < 0) { 
    g = 0;
  }
  if (g >1) {
    g = 1;
  }
  return lerpColor (c1, c2, g);
}

void setColores () {

  if (colorActual == 0) {
    colorInicio = violeta;
    colorFin = negro;
  } else if (colorActual == 1 ) {
    colorInicio = fucsia;
    colorFin = negro;
  } else {
    colorInicio = lila;
    colorFin = negro;
  }
}
void keyPressed () {
  if ( key ==  'r' || key =='R') {
    reiniciarObra ();
  }
  if (key == ' ') {
    cambiarColor = true;
    colorActual = (colorActual + 1) % 3;
    setColores ();
    t = 0;
  }
}
void mouseClicked () {
  mover =!mover;
}

void reiniciarObra () {
  mover = false;
  ejeX = 600;
  velocidad = 4;
  cambiarColor = false;
  t = 0;
  colorActual = 0;
  setColores ();
}
