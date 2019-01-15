class gun
{
  int attack, hyper, kills;
  char element, assignKey;
  
  public gun(char e, char ak)
  {
    element=e;
    assignKey=ak;
  }
  
  public char getElement()
  {
    return element;
  }
  
  public void drawBlast()
  {
    int m=millis();
    noStroke();
    fill(#AAAAAA);
    ellipse(mouseX,mouseY,20,20);
    while(m<1000)
    {
    }
  }
  
  public char getAsignKey()
  {
    return assignKey;
  }
  
  public int getAttack(char enEl)
  {
    //returns attack/ how much damage is dealt
    if(elementCompare(element,enEl)>0)
      return attack*2;
    else if(elementCompare(element,enEl)<0&&elementCompare(element,enEl)>-2)
      return attack;
    else if(elementCompare(element,enEl)==0)
      return attack/2;
    else
      return -1;
  }
  
  public int elementCompare(char gEl, char eEl)
  {
    switch(gEl)
    {
      case 'n': switch(eEl)
              {
                case 'n': return 1;
                case 'f': return 0;
                case 'i': return 0;
                case 'e': return -1;
                default: return -2;
              }
      case 'f': switch(eEl)
              {
                case 'n': return 0;
                case 'f': return -1;
                case 'i': return 1;
                case 'e': return 0;
                default: return -2;
              }
      case 'i': switch(eEl)
              {
                case 'n': return 0;
                case 'f': return 1;
                case 'i': return -1;
                case 'e': return -1;
                default: return -2;
              }
      case 'e': switch(eEl)
              {
                case 'n': return -1;
                case 'f': return 0;
                case 'i': return 0;
                case 'e': return 1;
                default: return -2;
              }
      default: return -2;
    }
  }
  /*
  several different elements:
  normal, fire, ice, and energy*/
  
  
  
  
}