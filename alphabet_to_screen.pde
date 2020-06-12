ArrayList <Block> alphaA = new ArrayList<Block>() ;
int blockSize =5;

void setup()
{   size(400, 400);
    createBlocks("quick brown fox jumps");
}

void draw()
{   background(255, 255, 6);
    for ( int i = 0; i< alphaA.size() ; i++)
        alphaA.get(i).update();
}

class Block
{  int posx, posy;
   int red, green, blue, alpha;
   boolean isVisible =true; 
   Block( int x, int y, int r, int g, int b, int a)
   {  posx = x;
      posy = y;
      red = r;
      green = g;
      blue = b;
      alpha =a;
   }
   void update()
   {  fill(red,green, blue, alpha);
      rect(posx, posy, 5, 5);
   }
   void print(int num)
   {  System.out.println("Number "+ num+ ": "+posx+ ": " + posy+ ": " + red+": "+blue + ": " +green + ": "+ alpha);}
}

void convertAlphaToBlocks(char c, int startX, int startY )
{
   //blocks is a 2D array that contains the conversion table of an alphabet into blocks in a 5x8 grid structure 
   //first index of blocks contains representation for A and the last one for Zz
   int blocks[][] = {
   {31, 17, 17, 17, 31, 17, 17, 17, 17},
   {30, 17, 17, 30, 17, 17, 17, 30},
   {30, 16, 16, 16, 16, 16, 16, 30},
   {30, 17, 17, 17, 17, 17, 17, 30},
   {31, 16, 16, 28, 16, 16, 16, 31},
   {31, 16, 16, 28, 16, 16, 16, 16},
   {31, 16, 16, 23, 17, 17, 17, 31},
   {17, 17, 17, 31, 17, 17, 17, 17},
   {4, 4, 4, 4, 4, 4, 4, 4},
   {31, 4, 4, 4, 4, 4, 20, 28},
   {17, 18, 20, 24, 24, 20, 18, 17},
   {16, 16, 16, 16, 16, 16, 16, 31},
   {17, 27, 21, 21, 17, 17, 17, 17},
   {17, 25, 25, 21, 21, 19, 19, 17},
   {14, 17, 17, 17, 17, 17, 17, 14},
   {30, 17, 17, 30, 16, 16, 16, 16},
   {30, 18, 18, 18, 18, 22, 30, 1},
   {30, 17, 17, 30, 24, 20, 18, 17},
   {15, 16, 16, 30, 1, 1, 1, 30},
   {31, 4, 4, 4, 4, 4, 4, 4},
   {17, 17, 17, 17, 17, 17, 17, 14},
   {17, 17, 17, 17, 10, 10, 4, 4},
   {17, 17, 17, 17, 21, 21, 27, 17},
   {17, 17, 10, 4, 4, 10, 17, 17},
   {17, 17, 17, 31, 4, 4, 4, 4},
   {31, 2, 2, 4, 4, 8, 8, 31}};
   
   int val, posX, posY, charIndex;
    
   //Find which alphabet & its conversion index in block
   if ( c >= 'A' && c <= 'Z' )
       charIndex = c - 'A';
   else
       return;
       
   //Create appropriate blocks for the mentioned alphabet    
   for ( int i = 0; i < 8 ; i++)
      { //Start the character at mentioned X location
        posX =startX;
        
        //For each new row of blocks, shift y position by the blockSize
        posY = startY+ blockSize * i;
        
        for (int j = 16; j > 0; j /= 2)
        { 
          val = blocks[charIndex][i] & j;
          System.out.println("Val is:" + val );
          if(val > 0 )
          { alphaA.add(new Block(posX, posY, int(random(255)), int(random(255)), int(random(255)), 100));
          }
          posX += blockSize;
        }
      }
}
void createBlocks(String word)
{   
    String temp[] = word.toUpperCase().split(" ");
    int rowX , rowY;  
    //Convert each character in the word to its corresponding blocks
    
    rowY = max(20, 200 - ( 6 * blockSize * temp.length ) );
      
    
    for (int j = 0; j < temp.length; j++)
    { rowX = max(20, 200 - ( 5 * blockSize + (temp[j].length() - 1) * 7 * blockSize)/2 );
      
      
     for ( int i = 0; i < temp[j].length(); i++)
      {     convertAlphaToBlocks(temp[j].charAt(i), rowX, rowY);
            rowX = rowX + blockSize * 7;
      }
      rowY = rowY + blockSize * 12;
    }
}
