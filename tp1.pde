//tp1 comision:5
//zoe orellano
//Legajo:119104/0
PImage pepper;
void setup(){
  size(800,400);
  background(255);
  pepper = loadImage("pepper.png");
  
  fill(255,50);
  ellipse(240,200,50,50);
  
  fill(29,131,72);
stroke(29,131,72);
bezier(562,94,600,40,680,40,690,83); 
circle(571,100,27);
circle(559,100,25);
circle(586,103,25);
}

void draw(){
  
  image(pepper,0,0,400,400);
  smooth();
  fill(217,0,0);
  stroke(217,0,0);
  circle(553,107,29);
  circle(582,107,30);
  circle(571,103,28);
  circle(492,334,18);
  circle(496,333,24);
  circle(499,321,23);
  circle(503,323,29);
  circle(502,324,29);
  circle(490,340,19);
  circle(489,339,16);
  circle(488,337,14);
  circle(565,144,81);
  circle(566,167,85);
  circle(564,180,85);
  circle(561,202,86);
  circle(553,229,81);
  circle(525,286,59);
    bezier(470,700,470,750,410,770,405,780);
    
 
  stroke(217,0,0);
  bezier(540,100,490,196,570,210,485,330);
  bezier(485,330,485,350,550,330,596,230);
  bezier(597,230,598,230,625,130,595,99); 
  bezier(500,300,503,330,465,362,465,362);
  bezier(430,360,447,379,463,363,500,345);
  bezier(445,375,490,360,523,328,558,297);
  //bezier(438,369,485,354,518,320,545,281);

  strokeWeight(5);

  line(505,262,430,360);
  line(510,268,434,354);
    line(528,323,465,362);
  ellipse(546,200,76,201);
  ellipse(453,356,23,27);
  ellipse(442,358,10,5);

strokeWeight(27);
fill(217,0,0);
stroke(217,0,0);

line(438,364,503,300);

strokeWeight(5);
fill(255);
stroke(255);
//bezier(565,94,600,50,680,50,690,90)
bezier(591,89,600,55,687,48,685,117); 

strokeWeight(2);
noStroke();

fill(255,50);
ellipse(586,162,20,100);
bezier(440,366,475,354,538,330,580,235);

fill(29,131,72);
stroke(29,131,72);
triangle(673,90,672,70,689,83);
circle(572,95,20);
circle(557,93,20);
circle(589,97,20);
bezier(578,87,590,90,599,92,590,84);

strokeWeight(6);
line (551,88,578,80);
}
