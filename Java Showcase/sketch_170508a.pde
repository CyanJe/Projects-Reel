
//import ddf.minim.*;
//AudioPlayer player;
//Minim minim;
//
//import processing.sound.*;
//SoundFile file;
int leng = 1024;
int wid = 768;
PImage img,img2,img3,img4,img5, img6,img10;
PFont myFont;
PFont myFont2;
int screen = 0;
int currLev=0, currScreen=0,counter,counter2,counter3,level=1;
String test="TestArea.jpg";
int keys;
gun testy = new gun('n','n');
screen first = new screen("TestArea.jpg");
enemy shifty = new enemy("TestGhost.png",300,300,50,60,2,'n',2);
enemy boppo = new enemy("TestGhost.png",300,300,50,60,5,'n',2);
enemy bippo = new enemy("TestGhost.png",300,300,50,60,5,'n',2);
enemy king = new enemy("TestGhost.png",300,300,50,60,10,'n',3);
enemy speedy = new enemy("TestGhost.png",300,300,50,60,5,'n',3);
enemy spaddy = new enemy("TestGhost.png",300,300,50,60,5,'n',3);
int s = second();
int lives;
boolean play =true;
boolean start=true,win,win2,win3;
ArrayList<enemy> possy = new ArrayList<enemy>();
ArrayList<enemy> possy2 = new ArrayList<enemy>();
ArrayList<enemy> sPossy = new ArrayList<enemy>();
ArrayList<enemy> sPossy2 = new ArrayList<enemy>();
ArrayList<enemy> possy3 = new ArrayList<enemy>();



void setup() {
 
  //minim = new Minim(this);
  //player = minim.loadFile("Bonetrousle.mp3", 2048);
  //player.loop();
  
  //file = new SoundFile(this, "Bonetrousle.mp3");
  //file.play();
  //size(1024, 768);
  fullScreen();
  img = loadImage("title_screen.jpg");
  img2 = loadImage("TestArea.jpg");
  img3 = loadImage("GhostHallway.png");
  img4 = loadImage("GhostFireplace.png");
  img5 = loadImage("OutTheDoor.png");
  img6 = loadImage("graveyard.png");
  img10 = loadImage("TestGhost.png");
  for(int i=0; i<10;i++)
  {
     possy.add(shifty);
  }
  for(int i=0; i<10;i++)
  {
     possy2.add(boppo);
  }
  for(int i=0; i<10;i++)
  {
     possy3.add(king);
  }
  for(int i=0; i<10;i++)
  {
     sPossy.add(speedy);
  }
  for(int i=0; i<10;i++)
  {
     sPossy2.add(spaddy);
  }
 
}

void draw()
{
  if(screen == 0)
  {
  homeScreen();
  }
 
  if(screen == 1)
  {
  instructionsScreen();
  }
  if(screen == 2)
  {
  mainGame();
  //testScreen();
  }
  if(screen == 3)
  {
    loseScreen();
  }
  if(screen ==4)
  {
    winScreen();
  }
 
}
void keyPressed()
{
  if(screen == 0)
  {
  screen = 1;
  }
 if(screen == 2)
 {
  start=false;
 }
 if(screen == 4)
 {
   screen = 0;
 }
 
 
}

void homeScreen()
{
  image(img, 0, 0);
  myFont = createFont("Algerian", 32);
  textFont(myFont);
  textSize(50);
  stroke(0);
  fill(#FC0000);
  text("RESTLESS DEAD", 600, 90);
  fill(0);
  rect(50,600,675,100);
  textSize(50);
  fill(255);
  text("Press any key to start.", 85,665);
 
}

void loseScreen()
{
  background(#000000);
  textFont(myFont2);
  textSize(50);
  fill(#F50707);
  if(lives>0)
  {
    text("You died", 450,300);
  }
  else
  text("Game Over", 450,300);
}

void winScreen()
{
  background(#4AE9ED);
  textFont(myFont2);
  textSize(50);
  fill(#EAF207);
  text("You Win", 450,300);
  text("Press any key to return to title screen.", 85,665);
}

void instructionsScreen()
{
  background(#159574);
  myFont2 = createFont("Times New Roman", 32);
  textFont(myFont2);
  textSize(50);
  fill(0);
  text("You are an elite ghostbuster. You are stuck in a", 50,100);
  text("haunted house and cannot get out without", 50,150);
  text("defeating all the ghosts and their king.", 50, 200);
  text("Use your mouse to aim towards each ghost.", 50, 250);
  //text("Each ghost can only be killed using a specific",50,300);
  //text("gun. Gray=normal(Press z), Red=fire(Press x),", 50, 350);
  //text("Blue=ice(Press c), Yellow=energy(Press v).",50,400);
  text("Good Luck. You'll need it.", 200,500);
  fill(#334E98);
  rect(700,695, 1024,768);
  textSize(57);
  fill(255);
  text("Click to Start", 710,750);
  counter=0;
  counter2=0;
  possy.get(counter).reset();
  possy2.get(counter).reset();
  start=true;
  lives=3;
  level=1;
}
void mousePressed()
{
  if(screen == 1)
  {
  screen = 2;
  }
  if(screen ==2)
  {
    testy.drawBlast();
    possy.get(counter).hurtEnemy();
    possy2.get(counter).hurtEnemy();
    possy3.get(counter).hurtEnemy();
    sPossy.get(counter).hurtEnemy();
    sPossy2.get(counter).hurtEnemy();
  }
  if(screen == 3)
 {
   if(lives>0)
   {
      lives--;
      screen=2;
      counter=0;
      counter2=0;
      possy.get(counter).reset();
      possy2.get(counter).reset();
      start=true;
   }
   else
   {
   screen = 0;
   }
 }
 
}

void mainGame()
{
  if(level==1)
  {
    if(start==true)
    {
      background(#000000);
      textFont(myFont2);
      textSize(50);
      fill(#F50707);
      text("Level 1", 450,300);
      text("Press any key to start.", 85,665);
      text("Lives:", 85,85);
      for(int i=0;i<lives;i++)
      {
        rect((75*i)+250,35,25,50);
      }
    }
    else
    {
      level1();
    }
  }
  if(level==2)
  {
    if(start==true)
    {
      background(#000000);
      textFont(myFont2);
      textSize(50);
      fill(#F50707);
      text("Level 2", 450,300);
      text("Press any key to start.", 85,665);
      text("Lives:", 85,85);
      for(int i=0;i<lives;i++)
      {
        rect((75*i)+250,35,25,50);
      }
      win=false;
      win2=false;
      counter=0;
      counter2=0;
      possy.get(counter).reset();
      possy2.get(counter).reset();
      start=true;
    }
    else
    {
      level2();
    }
  }
  if(level==3)
  {
    if(start==true)
    {
      background(#000000);
      textFont(myFont2);
      textSize(50);
      fill(#F50707);
      text("Level 3", 450,300);
      text("Press any key to start.", 85,665);
      text("Lives:", 85,85);
      for(int i=0;i<lives;i++)
      {
        rect((75*i)+250,35,25,50);
      }
      win=false;
      win2=false;
      counter=0;
      counter2=0;
      sPossy.get(counter).reset();
      start=true;
    }
    else
    {
      level3();
    }
  }
  if(level==4)
  {
    if(start==true)
    {
      background(#000000);
      textFont(myFont2);
      textSize(50);
      fill(#F50707);
      text("Level 4", 450,300);
      text("Press any key to start.", 85,665);
      text("Lives:", 85,85);
      for(int i=0;i<lives;i++)
      {
        rect((75*i)+250,35,25,50);
      }
      win=false;
      win2=false;
      counter=0;
      counter2=0;
      sPossy.get(counter).reset();
      sPossy2.get(counter).reset();
      start=true;
    }
    else
    {
      level4();
    }
  }
  if(level==5)
  {
    if(start==true)
    {
      background(#000000);
      textFont(myFont2);
      textSize(50);
      fill(#F50707);
      text("Level 5", 450,300);
      text("Press any key to start.", 85,665);
      text("Lives:", 85,85);
      for(int i=0;i<lives;i++)
      {
        rect((75*i)+250,35,25,50);
      }
      win=false;
      win2=false;
      win3=false;
      counter=0;
      counter2=0;
      counter3=0;
      possy.get(counter).reset();
      possy2.get(counter).reset();
      possy3.get(counter).reset();
     
    }
    else
    {
      level5();
    }
  }
}

void level1()
{
  image(img2,0,0);
  
  possy.get(counter).alive();
  
  //}
  if(possy.get(counter).isDead()==false)
  {
    possy.get(counter).drawSprite();
    img10.resize(shifty.getXLength(),possy.get(counter).getYLength());
    possy.get(counter).moveEnemy();
    
    if(possy.get(counter).getXLength()>300||possy.get(counter).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(possy.get(counter).isDead()==true)
  {
    if(counter<possy.size()-1)
    {
      counter++;
      possy.get(counter).reset();
    }
    else
    {
      level++;
      start=true;
    }
    
  }
  stroke(#F70A0A);
  noFill();
  ellipse(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,80,80);
  line(mouseX,mouseY-50,mouseX,mouseY-10);
  line(mouseX-50,mouseY,mouseX-10,mouseY);
  line(mouseX,mouseY+50,mouseX,mouseY+10);
  line(mouseX+50,mouseY,mouseX+10,mouseY);
  //int m=millis();
  //int keys;
  
  
  /*if(keys-m>0)
  {
    test.drawBlast(300,300,m);
  }*/
  
  
  
}

void level2()
{
  image(img3,0,0);
  
  possy.get(counter).alive();
  possy2.get(counter).alive();
  //}
  if(possy.get(counter).isDead()==false)
  {
    possy.get(counter).drawSprite();
    possy.get(counter).moveEnemy();
    
    if(possy.get(counter).getXLength()>300||possy.get(counter).getYLength()>500)
    {
      screen=3;
    }
    
  }
   if(possy2.get(counter2).isDead()==false)
  {
    possy2.get(counter2).drawSprite();
    possy2.get(counter2).moveEnemy();
    
    if(possy2.get(counter2).getXLength()>300||possy2.get(counter2).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(possy.get(counter).isDead()==true)
  {
    if(counter<possy.size()-1)
    {
      counter++;
      possy.get(counter).reset();
    }
    else
    {
      win=true;;
    }
    
  }
  if(possy2.get(counter2).isDead()==true)
  {
    if(counter2<possy2.size()-1)
    {
      counter2++;
      possy2.get(counter2).reset();
    }
    else
    {
      win2=true;
    }
    
  }
  if(win&&win2)
  {
    level++;
    start=true;
  }
  stroke(#F70A0A);
  noFill();
  ellipse(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,80,80);
  line(mouseX,mouseY-50,mouseX,mouseY-10);
  line(mouseX-50,mouseY,mouseX-10,mouseY);
  line(mouseX,mouseY+50,mouseX,mouseY+10);
  line(mouseX+50,mouseY,mouseX+10,mouseY);
  //int m=millis();
  //int keys;
  
  
  /*if(keys-m>0)
  {
    test.drawBlast(300,300,m);
  }*/
  
  
  
}

void level3()
{
  image(img4,0,0);
  
  sPossy.get(counter).alive();
  
  //}
  if(sPossy.get(counter).isDead()==false)
  {
    sPossy.get(counter).drawSprite();
    //img10.resize(shifty.getXLength(),sPossy.get(counter).getYLength());
    sPossy.get(counter).moveEnemy();
    
    if(sPossy.get(counter).getXLength()>300||sPossy.get(counter).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(sPossy.get(counter).isDead()==true)
  {
    if(counter<sPossy.size()-1)
    {
      counter++;
      sPossy.get(counter).reset();
    }
    else
    {
      level++;
      start=true;
      
    }
    
  }
  stroke(#F70A0A);
  noFill();
  ellipse(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,80,80);
  line(mouseX,mouseY-50,mouseX,mouseY-10);
  line(mouseX-50,mouseY,mouseX-10,mouseY);
  line(mouseX,mouseY+50,mouseX,mouseY+10);
  line(mouseX+50,mouseY,mouseX+10,mouseY);
  //int m=millis();
  //int keys;
  
  
  /*if(keys-m>0)
  {
    test.drawBlast(300,300,m);
  }*/
  
  
  
}

void level4()
{
  image(img5,0,0);
  
  sPossy.get(counter).alive();
  sPossy2.get(counter2).alive();
  //}
  if(sPossy.get(counter).isDead()==false)
  {
    sPossy.get(counter).drawSprite();
    sPossy.get(counter).moveEnemy();
    
    if(sPossy.get(counter).getXLength()>300||sPossy.get(counter).getYLength()>500)
    {
      screen=3;
    }
    
  }
   if(sPossy2.get(counter2).isDead()==false)
  {
    sPossy2.get(counter2).drawSprite();
    sPossy2.get(counter2).moveEnemy();
    
    if(sPossy2.get(counter2).getXLength()>300||sPossy2.get(counter2).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(sPossy.get(counter).isDead()==true)
  {
    if(counter<possy.size()-1)
    {
      counter++;
      sPossy.get(counter).reset();
    }
    else
    {
      win=true;
    }
    
  }
  if(sPossy2.get(counter2).isDead()==true)
  {
    if(counter2<possy2.size()-1)
    {
      counter2++;
      sPossy2.get(counter2).reset();
    }
    else
    {
      win2=true;
    }
    
  }
  if(win&&win2)
  {
    level++;
    start=true;
    
  }
  stroke(#F70A0A);
  noFill();
  ellipse(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,80,80);
  line(mouseX,mouseY-50,mouseX,mouseY-10);
  line(mouseX-50,mouseY,mouseX-10,mouseY);
  line(mouseX,mouseY+50,mouseX,mouseY+10);
  line(mouseX+50,mouseY,mouseX+10,mouseY);
  //int m=millis();
  //int keys;
  
  
  /*if(keys-m>0)
  {
    test.drawBlast(300,300,m);
  }*/
  
  
  
}
void level5()
{
  image(img6,0,0);
  
  possy.get(counter).alive();
  possy2.get(counter).alive();
  possy3.get(counter).alive();
  //}
  if(possy.get(counter).isDead()==false)
  {
    possy.get(counter).drawSprite();
    possy.get(counter).moveEnemy();
    
    if(possy.get(counter).getXLength()>300||possy.get(counter).getYLength()>500)
    {
      screen=3;
    }
    
  }
   if(possy2.get(counter2).isDead()==false)
  {
    possy2.get(counter2).drawSprite();
    possy2.get(counter2).moveEnemy();
    
    if(possy2.get(counter2).getXLength()>300||possy2.get(counter2).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(possy3.get(counter3).isDead()==false)
  {
    possy3.get(counter3).drawSprite();
    possy3.get(counter3).moveEnemy();
    
    if(possy3.get(counter3).getXLength()>300||possy3.get(counter3).getYLength()>500)
    {
      screen=3;
    }
    
  }
  if(possy.get(counter).isDead()==true)
  {
    if(counter<possy.size()-1)
    {
      counter++;
      possy.get(counter).reset();
    }
    else
    {
      win=true;;
    }
    
  }
  if(possy2.get(counter2).isDead()==true)
  {
    if(counter2<possy2.size()-1)
    {
      counter2++;
      possy2.get(counter2).reset();
    }
    else
    {
      win2=true;
    }
    
  }
  if(possy3.get(counter3).isDead()==true)
  {
    if(counter3<possy3.size()-1)
    {
      counter3++;
      possy3.get(counter2).reset();
    }
    else
    {
      win3=true;
    }
    
  }
  if(win&&win2&&win3)
  {
    screen=4;
    start=true;
  }
  stroke(#F70A0A);
  noFill();
  ellipse(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,80,80);
  line(mouseX,mouseY-50,mouseX,mouseY-10);
  line(mouseX-50,mouseY,mouseX-10,mouseY);
  line(mouseX,mouseY+50,mouseX,mouseY+10);
  line(mouseX+50,mouseY,mouseX+10,mouseY);
  //int m=millis();
  //int keys;
  
  

  
  
}