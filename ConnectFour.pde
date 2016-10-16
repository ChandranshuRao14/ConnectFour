Chips[][] boardArray = new Chips[6][7];
int choice = 0;
String turn = "red";
boolean notDone = true;

void setup(){
  size(1050,900);
  background(0);
  drawBoard();
  noLoop();
}

void draw(){
  choice = checkCall(key);
  if(turn.equals("red")){
    placeChip(choice, "red");
    if(checkConnectFour()){
      endGame("red");
    }
    turn = "yellow";
  }
  else if(turn.equals("yellow")){
    placeChip(choice, "yellow");
    if(checkConnectFour()){
      endGame("yellow");
    }    
    turn = "red";
  }
}

class Board{
  private int rows, columns;
  public Board(int r, int c){
    rows = r;
    columns = c;
  }
}

class Chips{
  private int x,y;
  private int row, column;
  private String colour = "white";
  private boolean isEmpty = true;
  public Chips(int r, int c, int xcoor, int ycoor){
    row = r;
    column = c;
    x = xcoor;
    y = ycoor;
    fill(255,255,255);
    ellipse(x,y,110,110);
  }
  
  public boolean isSpaceEmpty(){
    return isEmpty;
  }
  public String getColor(){
    return colour;
  }
  
  public void changeColor(String c){
    if(c.equals("yellow")){
      colour = "yellow";
      isEmpty = false;
      fill(255,255,0);
      ellipse(x,y,110,110);
  }
    if(c.equals("red")){
      colour = "red";
      isEmpty = false;
      fill(255,0,0);
      ellipse(x,y,110,110);
  }  
}
}

void drawBoard(){
  Board game = new Board(6,7);
  int xc,yc;
  for(int r=0;r<6;r++){
    for(int c=0;c<7;c++){
      xc = 110 + 120*c;
      yc = 95 + 120*r;
      boardArray[r][c] = new Chips(r,c,xc,yc);
    }
  }
}

void placeChip(int call, String c){
  if(call > 0){
    for(int i=5; i>=0; i--){
      if(boardArray[i][call-1].isSpaceEmpty()){
        boardArray[i][call-1].changeColor(c);
        break;
      }
    }
  }
}

public boolean checkConnectFour(){
  int[][] nums = new int[6][7];
  for(int i = 0; i < 6; i++){
    for(int m = 0; m < 7; m++){
      String col = boardArray[i][m].getColor();
      if(col.equals("white")){
        nums[i][m] = 0;
      } else if(col.equals("red")){
        nums[i][m] = 1;
      } else if(col.equals("yellow")){
        nums[i][m] = 2;
      }
    }
  }
  for(int i = 0; i < 6; i++){
    for(int m = 0; m < 4; m++){
      if(nums[i][m] != 0){
        if(nums[i][m] == nums[i][m+1] && nums[i][m] == nums[i][m+2] && nums[i][m] == nums[i][m+3]){
          return true;
        }
      }
    }
  }
 for(int i = 0; i < 3; i++){
  for(int m = 0; m < 7; m++){
   if(nums[i][m] != 0){
    if(nums[i][m] == nums[i+1][m] && nums[i][m] == nums[i+2][m] && nums[i][m] == nums[i+3][m]){
     return true;
    }
   }
  }
 } 
 for(int i = 0; i < 3; i++){
  for(int m = 0; m < 4; m++){
   if(nums[i][m] != 0){
    if(nums[i][m] == nums[i+1][m+1] && nums[i][m] == nums[i+2][m+2] && nums[i][m] == nums[i+3][m+3]){
     return true;
    }
   }
  }
 } 
 for(int i = 0; i < 3; i++){
  for(int m = 3; m < 7; m++){
   if(nums[i][m] != 0){
    if(nums[i][m] == nums[i+1][m-1] && nums[i][m] == nums[i+2][m-2] && nums[i][m] == nums[i+3][m-3]){
     return true;
    }
   }
  }
 }  
 return false;
}

public int checkCall(char k){
  int ch = 0;
  if(k == '1'){
    ch = 1;
  }
   if(k == '2'){
    ch = 2;
  } 
  if(k == '3'){
    ch = 3;
  }
  if(k == '4'){
    ch = 4;
  }
  if(k == '5'){
    ch = 5;
  }
  if(k == '6'){
    ch = 6;
  }
  if(k == '7'){
    ch = 7;
  }
  return ch;
}

void keyPressed(){
  redraw();
}

void endGame(String s){
  if(notDone){
    textSize(50);
    fill(0,0,0);
    rect(20,20,1050,140);
    fill(255,255,255);
    text("Game Over. The winner is " + s + ".",20,50,1050,140);
    notDone = false;
  }
  
}
