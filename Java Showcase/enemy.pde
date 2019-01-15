class enemy
{
  private String image;
  private int xMin,yMin,xLength,yLength,orXL,orYL;
  private int health=2,attack,timing,speed;
  private char element;
  private boolean dead=true;
  
  public enemy(String i,int xm, int ym,int xl,int yl, int t, char e, int sp)
  {
    image=i;
    xMin=xm;
    yMin=ym;
    orXL=xl;
    orYL=yl;
    xLength=xl;
    yLength=yl;
    timing=t;
    element=e;
    speed=sp;
  }
  
  public void drawSprite()
  {
    //draws sprite
    
    //fill(#E83636);
    //rect(xMin,yMin,xLength,yLength);
    
    //image(img10,xMin,yMin);
    
    
    noStroke();
    fill(#FFFFFF);
    quad(xMin+(xLength/6),yMin+(yLength/4),xMin+(xLength-(xLength/6)),yMin+(yLength/4),xMin+(xLength-(xLength/3)),yMin+(yLength-(yLength/8)),xMin+(xLength/3),yMin+(yLength-(yLength/8)));
    triangle(xMin+(xLength/8),yMin+(yLength/4),xMin+(xLength/2),yMin+(yLength/4),xMin+(xLength/8),yMin+(yLength/2));
    triangle(xMin+(xLength-(xLength/8)),yMin+(yLength/4),xMin+(xLength-(xLength/4)),yMin+(yLength/4),xMin+(xLength-(xLength/8)),yMin+(yLength/2));
    ellipse(xMin+(xLength/2),yMin+(yLength/6),xLength/4,yLength/4);
    fill(0);
    ellipse(xMin+(xLength*7/16),yMin+(yLength/6),xLength/20,yLength/20);
    ellipse(xMin+(xLength*9/16),yMin+(yLength/6),xLength/20,yLength/20);
    if(timing==10)
    {
    fill(#F5EE11);
    triangle(xMin+xLength/2,yMin,xMin+(xLength*5/8),yMin+(yLength/8),xMin+(xLength*3/8),yMin+(yLength/8));
    triangle(xMin+xLength/2,yMin+(yLength/8),xMin+(xLength*3/8),yMin,xMin+(xLength*3/8),yMin+(yLength/8));
    triangle(xMin+xLength/2,yMin+(yLength/8),xMin+(xLength*5/8),yMin,xMin+(xLength*5/8),yMin+(yLength/8));
    }
  }
  
  public void hurtEnemy()//int hurt)
  {
    //hurts the enemy by a certain amount
    if(mouseX>=xMin && mouseX<=xMin+xLength && mouseY>=yMin && mouseY<=yMin+yLength)
    health--;
  }
  
  public int getAttack()
  {
    return attack;
  }
  
  public char getElement()
  {
    return element;
  }
  
  public int getTime()
  {
    return timing;
  }
  
  public boolean isDead()
  {
    if(health<=0)
      dead=true;
    return dead;
  }
  
  public void alive()
  {
    dead=false;
  }
  
  public int getXLength()
  {
    return xLength;
  }
  
  public int getYLength()
  {
    return yLength;
  }
  
  private void moveEnemy()
  {
    xLength+=speed;
    yLength+=speed;
    //moves enemy forward
    //xMin--;
    //yMin--;
    //xLength++;
    //yLength++;
    /*
    if(xMin==100)
    {
      
    }
    else
      drawSprite()
      */
    
  }
  
  private void reset()
  {
    xMin=(int)(Math.random()*500)+300;
    yMin=(int)(Math.random()*500)+100;
    xLength=orXL;
    yLength=orYL;
    health=2;
    img10.resize(xLength,yLength);
    
  }
  
}