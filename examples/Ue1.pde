/* Gregor Altstädt
 * 11.10.12*/

void setup() {
  // println("2. Aufgabe");
  smooth();
  size(400, 400);
  noLoop();
}

void draw() {
  background(255);
  fill(200);
  stroke(1);

  // println("3. Aufgabe");
  // Die Orientierung der y-Achse ist 180 gedreht zur Kartesischen
  // darstellung.
  line(10, 90, 160, 105);
  ellipse(200, 200, 40, 40);
  triangle(30, 75, 58, 20, 86, 75);
  rect(100, 100, 30, 60);


  // println("4. Aufgabe");
  // Steht auf Bildschirm. Dient für Benutzer der Software.
  text("Mein erstes Programm", 100, 30, 110, 110);

  // Steht in der Console. Dient dem entwickler.
  print("Mein erstes Programm"); // Kein Umbruch folgend
  println("Mein erstes Programm"); // Umbruch folgend

  // Die Zahlen werden als ganze Zahlen behandelt und sind dadurch fast
  // immer null.
  println("5. Aufgabe");
  println(1 / 1);
  println(1 / 2);
  println(1 / 3);
  println(1 / 5);
  println(1 / 8);
  println(1 / 13);

  println("6. Aufgabe");
  // Zeigt die aktuelle Mausposition im Fenster an.
  println("mouseX: " + mouseX + " mouseY: " + mouseY); 

}