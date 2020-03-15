int buttonCount=0;//this is to switch pages


int buttonPush(int buttonCount) { //this function will return 0 for page one or 1 for page 2 depending on a button push from the dashboard
  //!!!!!!!add if button is pushed increase count by 1!!!!!!!!
  int temp = buttonCount%2;
  //println(temp);
  return temp;//will return 1 or 0
}
