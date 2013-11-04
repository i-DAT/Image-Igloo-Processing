import ddf.minim.*;

Minim minim;
AudioPlayer tink;

int image_pointer = 0;
float rotation = 180;
int level = 0;
String[] filenames;
boolean running = false;

void setup()
{
  size(1280, 1024);
  smooth();
  File folder = new File(sketchPath("")+"images");
  filenames = folder.list();
  background(0);
  minim = new Minim(this);
  tink = minim.loadFile("tink.mp3", 128);
}

void draw()
{
  if ((running) && (level<8)) {
    delay(100);
    PImage img;
    float number_of_images_in_level = (PI*(8-level)*82)/50;
    if (filenames[image_pointer].toLowerCase().indexOf(".jpg") != -1) {
      rotation+=360/number_of_images_in_level;
      if (rotation>540) {
        rotation=180;
        level++;
      }
      img = loadImage("images/"+filenames[image_pointer]);
      domeImage(img, rotation, 100-(level*12.9)-7.0, 100, 81);
      tink.play(0);
    }
    image_pointer++;
    if (image_pointer>=filenames.length) image_pointer=0;
  }
}

void keyPressed()
{
  running = !running;
}

void stop()
{
  tink.close();
  minim.stop();  
  super.stop();
}

