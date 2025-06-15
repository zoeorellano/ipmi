//IMPI comisión 2

PImage M_4;  
int filas = 10;
int columnas = 20;
int desplazamiento = 0;
boolean cambiarColor = false; // variable de estado para alternar el color de los cuadrados blancos

void setup() {
  size(800, 400);
  colorMode(HSB, 360, 100, 100); 
  M_4 = loadImage ("M_4.jpeg");
}

void draw() {
  float y = 0;
  image (M_4, 0, 0, 400 ,400);

  for (int a = 0; a < filas; a++) {
    float alto = 400.0 / filas;
    float x = 400;

    for (int b = 0; b < columnas; b++) {
      float d = abs(b - columnas/2 + desplazamiento);

      //ancho de cada rectángulo con distorsión
      float ancho = map(d, 0, columnas/2, 1, 40);

      // tablero: si (a + b) es par, es negro / si es impar, es blanco
      if ((a + b) % 2 == 0) {
        fill(0); 
      } else {
        if (cambiarColor) {
          fill(rojoOscuro()); 
        } else {
          fill(0, 0, 100);  
        }
      }

      // función que NO retorna un valor
      dibujarCuadro(x, y, ancho, alto);
      x += ancho;
    }

    y += alto;
  }
}

// función para retornar el color rojo en HSB
color rojoOscuro() {
  return color(0, 100, 40);  
}

// función que NO retorna un valor
void dibujarCuadro(float x, float y, float ancho, float alto) {
  rect(x, y, ancho, alto);
}

void mousePressed() {
  desplazamiento = desplazamiento + 1;

  if (desplazamiento > columnas / 2) {
    desplazamiento = -columnas / 2;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (cambiarColor == false) {
      cambiarColor = true;  // cambiar estado de la variable a true
    } else {
      cambiarColor = false; // cambiar estado de la variable a false
    }
  }
}
