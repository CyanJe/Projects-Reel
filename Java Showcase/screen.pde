class screen
{
  private ArrayList<enemy> enemies = new ArrayList<enemy>();
  private String image;
  private int xVal;
  
  public screen(String im)
  {
    image=im;
  }
  
  public void drawScreen()
  {
    //draws screen for background
  }
  
  public void hurtEnemy()
  {
    //hurts the enemy
  }
  
  public ArrayList<enemy> getEnemies()
  {
    return enemies;
  }
  
  
  
  
}