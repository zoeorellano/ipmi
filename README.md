PImage imagen;
int filas = 10;
int columnas = 20;
int desplazamiento = 0;
boolean cambiarColor = false;

void setup() {
  size(800, 400);
  colorMode(HSB, 360, 100, 100);
  imagen = loadImage("M_4.jpeg");
}

void draw() {
  background(255);
  image(imagen, 0, 0, 400, 400);
  dibujarTablero(filas, columnas, desplazamiento, cambiarColor);

  if (mousePressed) {
    if (frameCount % 5 == 0) {
      desplazamiento = desplazamiento + 1;
      if (desplazamiento > columnas / 2) {
        desplazamiento = -columnas / 2;
      }
    }
  }
}

void dibujarTablero(int filas, int columnas, int desplazamiento, boolean cambiarColor) {
  float y = 0;
  float alto = 400.0 / filas;

  for (int fila = 0; fila < filas; fila++) {
    float x = 400;

    for (int columna = 0; columna < columnas; columna++) {

      float distancia = columna - columnas / 2 + desplazamiento;
      if (distancia < 0) distancia = -distancia;

      float ancho = map(distancia, 0, columnas / 2, 1, 40);

      color colorBase;
      if ((fila + columna) % 2 == 0) {
        colorBase = color(0);
      } else {
        if (cambiarColor == false) {
          colorBase = color(0, 0, 100);
        } else {
          colorBase = color(0, 100, 40);
        }
      }

      fill(colorBase);
      rect(x, y, ancho, alto);

      stroke(0);
      strokeWeight(1);
      noFill();
      rect(x, y, ancho, alto);

      noStroke();

      x = x + ancho;
    }
    y = y + alto;
  }
}



void keyPressed() {
  if (key == ' ') {
    if (cambiarColor == false) {
      cambiarColor = true;
    } else {
      cambiarColor = false;
    }
  } else if (key == 'r' || key == 'R') {
    reiniciarPrograma();
  }
}

void reiniciarPrograma() {
  desplazamiento = 0;
  cambiarColor = false;
}

