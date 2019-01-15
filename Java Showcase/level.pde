class level
{
  private ArrayList<screen> screens = new ArrayList<screen>();
  private int currScreen;
  
  public level()
  {
  }
  
  public screen getCurrScreen()
  {
    return screens.get(currScreen);
    
  }
  
  public void screenShift()
  {
    currScreen++;
    //shifts the screen slowly to the next one
  }
  
  
  
  
}