void setup () { //<>//
  //setup using rules set by assignment
  size (1280, 720);
  surface.setTitle("20104127 Kate Molony");
  surface.setLocation(0, 0);
}

/*
 method for drawing rounded rectangle
 if statement used to change the colours
 
 Global variables set in order to be
 used later in drawGrid method
 */
int xCoord =40;
int yCoord =40;
float tl;
float tr;
float br;
float bl;

void drawRoundedRectangle (int xCoord, int yCoord, int rectWidth, int rectLength, float tl, float tr, float br, float bl)
{
  strokeWeight (0.2);
  rect(xCoord, yCoord, rectWidth, rectLength, random (9.0, 25.0), random (9.0, 25.0), random (9.0, 25.0), random (9.0, 25.0));

  // if statement to change colour of roundRect in grid
  // colours are transparent to show all shapes
  if ((xCoord == 0) && (yCoord == 0))
  {
    fill (245, 150, 250, 80);    //pink
  } else if ((xCoord < 80) && (yCoord < 80))
  {
    fill (189, 228, 255, 120);  //babyBlue
  } else if ((xCoord < 160) && (yCoord < 160))
  {
    fill (134, 152, 217, 180);  //darkBlue
  } else if ((xCoord < 240) && (yCoord < 240))
  {
    fill (174, 161, 240, 80);  //lilac
  } else if ((xCoord < 320) && (yCoord < 320))
  {
    fill (180, 132, 217, 120);  //purple
  } else if ((xCoord < 400) && (yCoord < 400))
  {
    fill (245, 150, 250, 80);    //pink
  } else if ((xCoord < 480) && (yCoord < 480))  // babyBlue //colour repeat
  {
    fill (189, 228, 255, 120);
  } else if ((xCoord < 560) && (yCoord < 560))
  {
    fill (134, 152, 217, 180);  //darkBlue
  } else if ((xCoord < 640) && (yCoord < 640))
  {
    fill (174, 161, 240, 120);  //lilac
  } else if ((xCoord < 720) && (yCoord < 720))
  {
    fill (180, 132, 217, 120);  //purple
  } else if ( (xCoord < 800))
  {
    fill (245, 150, 250, 80);    //pink
  } else if ((xCoord < 880))
  {
    fill (189, 228, 255, 120);  // colour repeat //babyBlue
  } else if ( (xCoord < 960))
  {
    fill (134, 152, 217, 180);  //darkBlue
  } else if ((xCoord < 1040))
  {
    fill (174, 161, 240, 90);  //lilac
  } else if ( (xCoord < 1120))
  {
    fill (180, 132, 217, 120);  //purple
  } else if ((xCoord < 1200))
  {
    fill (245, 150, 250, 120);    //pink
  } else if ((xCoord < 1280))
  {
    fill (189, 228, 255, 80);  //babyBlue
  } else //used to fill any other rect
  {
    fill (245, 150, 250, 80);    //pink
  }
}

/*
 Method for drawing gridlines
 */
void drawGridLines (int a, int b, int c, int d)
{
  strokeWeight (1);
  line (a, b, c, d);
  line (b, a, d, c);
}

/*
 MousePressed method used to both:
 (LEFT Click) change roundRectangle shape
 which returns back after loop
 and
 (RIGHT Click) save PNG
 
 Global variables set for width and height
 in order to be used later in drawGrid method
 */

int rectWidth = 35;
int rectLength = 35;

void mousePressed () {
  // LEFT Click changes width and length

  if ( mousePressed && (mouseButton == LEFT) )
  {
    rectWidth = rectWidth -5;
    rectLength = rectLength +5;
  }
  if ((rectWidth <= 0 ) && (rectLength > 60))
  {
    rectWidth=35;  // return to the start position
    rectLength= 35;
  }

  // RIGHT Click save PNG file
  else if ( mousePressed && (mouseButton == RIGHT) )
  {
    save ("assignment.PNG");
  }
}

/*
method with return type
 to get product of a number
 */

int getProduct (int num1, int num2)
{
  return num1 * num2 ;
}

/*
method with no return type to draw circles
 
 for loop to repeated draw overlapping circles
 with getProduct method used to increase each cicles size
 
 global variable set for circle size to be used in drawGrid method
 */

int ellipseSize = 3;

void drawCircle (int xCoord, int yCoord, int ellipseWidth, int ellipseHeigth)
{
  fill (245, 150, 250, 80); //pink

  for (int i=0; i <=5; i ++)
  {
    ellipse (xCoord, yCoord, getProduct(ellipseSize, ellipseSize)*i, getProduct(ellipseSize, ellipseSize)*i);
  }
}

/*
 KeyPressed method to move circles on gridlines
 
 Global variables set for circle position
 in order to be used later in drawGrid method
 */

int circlePosition = 80;

void keyPressed () {
  circlePosition = circlePosition +40;
  if (circlePosition >= 160)
  {
    // return to the middle of grid (start position)
    circlePosition=80;
  }
}

/*
printMyDetails method used to display
 student name (top left position of screen)
 and
 student number (bottom left position of screen)
 
 nested for loop used to outline text
 
 Global String variable set for name and number
 to use used in other methods
 */

String studentName = "Kate Molony";
String studentNumber = "20104127";

void printMyDetails ()
{
  stroke(0);
  strokeWeight (10);
  fill(255); //white
  textSize (80);
  text (studentName, 0, 80);  //top left
  text (studentNumber, 0, 720);  //bottowm left


  //for loop to outline text
  for (int x = -1; x < 2; x++) {
    for (int y = -1; y < 2; y++) {
      text(studentName, 0+x, 80+y);
      text(studentNumber, 0+x, 720+y);
    }
    fill(134, 152, 217, 180); //darkBlue outline

    text(studentName, 0+x, 80);
    text(studentName, 0, 80+x);
    text(studentNumber, 0+x, 720);
    text(studentNumber, 0, 720+x);
  }
  fill(255);
  text(studentName, 0, 80);
  text(studentNumber, 0, 720);

  repeatMyDetails ();
}

/*
MouseClicked
 changes the colour of student name
 when the mouse is clicked over it
 */

void mouseClicked ()
{
  if ((pmouseX < 400) && (pmouseY <80))
  {
    fill (189, 228, 255, 120);  //babyBlue
    text(studentName, 0, 80);
  }
}

/*
 MouseReleased
 changes the colour of student number
 when the mouse is clicked and released over it
 */

void mouseReleased ()
{
  if ((pmouseX < 320) && (pmouseY >640))
  {
    fill (134, 152, 217, 180);  //darkBlue
    text(studentNumber, 0, 720);
  }
}

/*
method with no retuen type to repeat details
 
 while loop used to repeatedly draw
 a substring of student name downwards
 and
 number upward
 
 two nested while loop with if statment
 while, if, while to repeat charater of string ("K") and
 while, if, for to repeat charater of string ("0")
 */

void repeatMyDetails () {

  int repeatDown = 0;
  int repeatCharDown = 0;
  int repeatUp = 0;
  int repeatNumUp = 0;

  while ((repeatDown<=4) && (pmouseX < 400) && (pmouseY <80))
  {
    if ((repeatDown == 4) && (repeatCharDown < 8))
    {
      while ((repeatCharDown<=8) && (pmouseX < 400) && (pmouseY <80))
      {
        text (studentName.charAt(0), 0, 80*repeatCharDown);
        repeatCharDown ++;
      }
    }
    //repeated loop down when mouse is over name
    text(studentName.substring(0, 4), 0, 80*repeatDown);
    repeatDown++;
  }

  while ((repeatUp<=160) && (pmouseX < 320) && (pmouseY >640))
  {
    //repeated loop up when mouse is over number
    text(studentNumber, 0, 640-repeatUp);
    repeatUp+=80;

    if ((repeatUp == 240) && (repeatCharDown <= 6))
    {
      for (repeatNumUp = 0; repeatNumUp <=400; repeatNumUp += 80)
      {
        changeTextColor ();
        text(studentNumber.charAt(3), 120, 560-repeatNumUp);
      }
    }
  }
}

/*
method with no return value
 used to change the colour
 when comparing the value of 2 strings
 */
void changeTextColor ()
{
  if (studentName.compareTo(studentNumber)<0)
  {
    fill(189, 228, 255, 120);  //babyBlue
  } else if (studentName.compareTo(studentNumber)>0)
  {
    fill (180, 132, 217, 120);  //purple
  }
}

/*
 Method for Drawing the grid art piece
 16x9 grid of 3 shapes (ellipse, roundedRectangles, gridLines)
 using nested for loop statement
 */

void drawGrid () {

  //16x9 grid
  for (int a =0; a <=720; a++) // 9 rows of rects
  {
    for (int b =0; b <=1280; b++) // 16 rect on each row
    {

      //circles
      drawCircle (circlePosition*a, circlePosition*b, ellipseSize, ellipseSize);

      //rectangles
      //width and height different for overlapping effect
      drawRoundedRectangle (xCoord*(a*2), yCoord*(b*2), rectWidth+5, rectLength+6, tl, tr, br, bl);

      drawRoundedRectangle ((xCoord*(a*2)+39), (yCoord*(b*2)+39), rectWidth+5, rectLength+6, tl, tr, br, bl);

      drawRoundedRectangle ((xCoord*(a*2)+40), (yCoord*(b*2)), rectWidth+10, rectLength+17, tl, tr, br, bl);

      drawRoundedRectangle ((xCoord*(a*2)), (yCoord*(b*2)+39), rectWidth+15, rectLength+20, tl, tr, br, bl);

      //grid lines
      drawGridLines(a*80, b*80, 80*a, 80*a);
    }
  }
}


void draw () {
  background(255);

  drawGrid();
  printMyDetails ();
}

/*
 Name :            Kate Molony
 Student Number:   20104127
 
 Brief description of piece (1 or 2 sentences MAX):
 ===================================================
 The art piece follows a regular grid theme using light colours,
 rounded rectangles, circle targets and gridlines.
 
 
 Adobe Color Palette Used:
 =========================
 - LINK: https://color.adobe.com/explore?page=2
 - color 1: babyBlue (189, 228, 255)
 - color 2: darkBlue (134, 152, 217)
 - color 3: lilac (174, 161, 240)
 - color 4: purple (180, 132, 217)
 - color 5: pink (245, 150, 250)
 - color WHITE: (255)
 
 Instructions:
 =============
 - Pressing any key causes the circles to change position
 - Pressing the Right mouse button saves the assignment .PNG
 - Pressing the Left mouse button causes the rectangles to change wight and height
 - Hoovering the mouse over text will cause the text to repeat
 - Pressing the mouse over the text on either the top or bottom of the
 screen will cause the text to change colour
 
 Known bugs/problems:
 ====================
 The left corner circle is repeatedly drawn
 
 Any sources referred to during the development of the assignment.
 
 https://docs.kogics.net/tutorials/generative-art-grid-intro.html
 https://forum.processing.org/two/discussion/16700/how-to-outline-text.html
 https://happycoding.io/tutorials/processing/for-loops
 
 */
 
 /* Reflection
 
 ** EXAMPLE ONLY **
 ** REPLACE THIS ENTIRE TEMPLATE WITH THE DETAILS HANDED IN WEEK 2 OF THE ASSIGNMENT**
 ******************
 
 Name :            Kate Molony
 
 Student Number:   20104127
 
 Part A - Mark (X /5)
 -----------------------------
 
 Comments - 1/1
 indente/formatted - 1/1
 naming - 1/1
 includsion of Readme - 1/1
 includsion of Reflection - 1/1
 
 Having reviewed my work according to the detailed rubric above, in relation to naming,
 commenting, indentation, and submitting my readme and reflection I have complete 5 of
 these fully. I am recording 5/5
 
 PART A:(5/5)
 
 Part B - Mark (X /2)
 -----------------------------
 
 Sizing.
 
 I have sized the display window correctly so 1/2.
 
 I have positioned the display window correctly so 1/2.
 
 PART B: (2/2)
 
 Part C - Mark (X /5)
 -----------------------------
 line 357 - draw()
 line 001 - setup()
 
 Setup and draw are fully working for me, so I score myself excellent 100%. 5/5
 
 PART C: (5/5)
 
 Part D - Mark (X /10)
 -----------------------------
 Use of if statements:
 
 I have multiple if statements, with multiple branches and
 in nested loops with line number shown.
 
 I used if statement on lines 172, 233 and 248
 I used a nested if on line 113
 I have if statements with multiple branches on lines 29 and 314
 I used if statements inside loops on lines 277 and 298
 
 With respect to the marking scheme I would give myself a very good mark.
 In order to get an excellent mark I could have added another nested if
 with booleen conditions.
 
 I am recording a very good mark for this. 85%
 
 PART D: (8/10)
 
 Part E: (X/20)
 -----------------------------
 Loops
 
 I have 5 loops types in my code at lines 156, 206, 275 
 290 and 332
 
 I have for loops in my code at lines 156, 206
 I have while loops in my code at lines 275
 Nesting is demonstrated on lines 206
 A for inside a for (lines 206, 332)
 A while indise a while (line 275)
 A for inside a while (line 290)
 
 With respect to the marking scheme I would give myself an excellent.
 I have multiple examples of loops and nested loops
 I am recording an excellent mark for this. 100%
 
 PART E: (20/20)
 
 Part F: (X/20)
 -----------------------------
 Bespoke Method
 
 I have 8 bespoke methods
 They are called in lines 158, 222, 300, 338, 342, 344, 346, 348, 351
 360, 361.
 
 Line 22 shows a method with 8 parameters and no return value.
 Line 89 and 152 shows a method with 4 parameters and no return value.
 Line 136 shows a method with 2 parameters and a return value.
 Line 268, 195, 312 and 329 and shows a method with no parameters and no return value.
 
 Line 68 shows an overloaded method with 5 parameters and a return value.
 Line 73 shows an overloaded method with 3 parameters and a return value.
 
 With respect to the marking scheme I would give myself an excellent.
 In order to get a perfect mark I could have added an overloaded method
 I’m recording an excellent mark for this 90%
 
 90% of 20, is 18/20
 
 PART F: (18/20)
 
 Part G: (X/10)
 -----------------------------
 Processing Method calls – (nothing for setup() and draw(), nothing for mouse methods, or
 string methods)
 
 I have called 9 Processing methods
 
 strokeWeight
 rect
 fill
 random
 line
 fill
 ellipse
 stroke
 text
 textSize
 background
 
 at lines 24, 25, 31-82, 92, 158, 197-202, 208, 209
 213-216, 218-220, 235-236, 250-251, 281, 286, 293, 301,
 316, 319
 
 With respect to the marking scheme I would give myself an excellent. 100%
 
 PART G: (10/10)
 
 Part H: (X/10)
 -----------------------------
 Mouse Methods – NOTE not mouse system variables
 
 I have used 3 Mouse methods
 
 mousePressed line 110
 mouseClicked line 231
  mouseReleased line 246
 
 With respect to the marking scheme I would give myself an excellent. 80%
 In order to get a perfect score, I could have made some of the mouse methods
 more complex
 
 PART H: (8/10)
 
 Part I: (X/10)
 -----------------------------
 String Methods (i.e. methods called from the Java String class)
 
 I have used 3 String methods
 
 charAt line 281 and 301
 substring line 286
 compareTo line 314 and 317
 
 I’m recording a very good mark for this. 75%
 That’s a mark of 7.5/10 but rounding would bring me to the next grade so I truncate instead
 giving 7/10
 
 PART I: (7/10)
 
 Part J: (X/3)
 -----------------------------
 My program saves the display in a PNG file on a right mouse click 3/3
 
 PART J: (3/3)
 
 Part K: (X/5)
 -----------------------------
 I have a unique looking final image based on the regular grid theme. 
 The cell contents uses colours, transparency , randomness, text, 
 shapes overlayed on each other. It’s also interactive – if you press 
 any keys the circles change position, pressing the mouse causes the 
 rectangles to change shape, hoovering the mouse over text will cause 
 the text to repeat, pressing over the text will cause it to change 
 colour. I will be uploading it to GitHub! 5/5.
 
 Part K: (5/5)
 
 Overall mark
 5+2+5+8+20+18+10+8+7+3+5= 91
 
 This will be multiplied by a mark out of 10 for complexity of the problem you tackled. E.g. 10/10 = *1
 
 This will be multiplied by a mark out of 10 for interview. 10/10 * 1
 
 *** Constraints ***
 Ignoring the constraints results in the equivalent of scoring 3/10 = .3 for interview
 
 
 */
