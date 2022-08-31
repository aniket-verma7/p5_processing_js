import javax.swing.JOptionPane;

ArrayList<Remote> remote = new ArrayList<Remote>();
ArrayList<RemoteDetails> remoteDetails = new ArrayList<RemoteDetails>();
ArrayList<String> hexArray = new ArrayList<String>();
ArrayList<String> stopHexArray = new ArrayList<String>();

PImage on,off;
boolean tab = true;
String time = "100";
String endTime = "90";
JSONArray hexCode;
JSONArray stopHexCode;
JSONObject jsonTime;
JSONArray jsonRemote;
int countM=0;
int countD=0;
int scaleX=620;
int scaleY=180;

void setup()
{
  size(1300,900);
  on = loadImage("assets/on.png");
  off = loadImage("assets/off.png");
  on.resize(60,60);
  off.resize(60,60);
  
  loadFile();
  initRemote();
  initRemoteDetails();
}

void loadFile()
{
  hexCode = loadJSONArray("hexcode.json");
  stopHexCode = loadJSONArray("stopHexCode.json");
  for (int i = 0; i < hexCode.size(); i++) 
  {
    
    JSONObject code = hexCode.getJSONObject(i);
    String tempCode = code.getString(String.valueOf(i+1));
    hexArray.add(tempCode);
  }
  
  for (int i = 0; i < stopHexCode.size(); i++) 
  {  
    JSONObject code = stopHexCode.getJSONObject(i);
    String tempCode = code.getString(String.valueOf(i+1));
    stopHexArray.add(tempCode);
  }
  
  jsonTime = loadJSONObject("time.json");
  time = jsonTime.getString("time");
  endTime = jsonTime.getString("end");
  countM = Integer.parseInt(jsonTime.getString("countM"));
  countD = Integer.parseInt(jsonTime.getString("countD"));
}

void initRemote()
{
  int gap=0;
  int id=1;
  for(int i=100;i<=400;i+=100)
  {
    Remote r = new Remote("Bátur "+id++,0);
    r.setPoint(i+gap,280);
    remote.add(r);
    gap=i*2;
  }
  
  gap=0;
  for(int i=100;i<=400;i+=100)
  {
    Remote r = new Remote("Bátur "+id++,0);
    r.setPoint(i+gap,560);
    remote.add(r);
    gap=i*2;
  }
}

void initRemoteDetails()
{
  int id=1;
  jsonRemote = loadJSONArray("remote.json");
  for(int i=200;i<=800;i+=80)
  {
    RemoteDetails r = new RemoteDetails("Batur "+id);
    r.setPoint(100,i);
    JSONObject code = jsonRemote.getJSONObject(id-1);
    r.setActive(code.getBoolean(String.valueOf(id)));
    remoteDetails.add(r);
    id+=1;
  }
}
void draw()
{
  background(205);
  stroke(205);
  
  if(tab)fill(205);
  else fill(100);
  rect(0,0,width/2,50);
  
  if(!tab)fill(205);
  else fill(100);
  rect(width/2,0,width,50);
 
  fill(0);
  textSize(30);
  text("Bátastýring",250,35);
  text("Stillingar",900,35);
  
  if(tab)
  {
    for(int i=0;i<remote.size();i++)
    {
      if(remoteDetails.get(i).isActive())
      {
        noFill();
        remote.get(i).drawRemote();
        remote.get(i).drawButton();
        remote.get(i).displayNameAndTime();
      }
    }
      drawBottomButton();
  }
  else
  {
    for(RemoteDetails tmp : remoteDetails)
    {
      float x = tmp.getX();
      float y = tmp.getY();
      if(tmp.isActive())image(on,x,y);
      else image(off,x,y);
      tmp.drawButton();
      drawHeilAndEnd();
    }
    resetButton();
  }

}

void resetButton()
{
  push();
  fill(200,0,0);
  translate(730,520);
  rect(300,300,200,50,10);
  fill(255);
  textSize(25);
  text("Reset",370,330);
  pop();
}
void drawHeilAndEnd()
{
  push();
  translate(730,520);
  fill(0);
  textSize(30);
  text("Heildartími (s)",0,0);
  text(time,70,65);
  text("Endatími (s)",300,0);
  text(endTime,370,65);
  
  fill(100,30);
  rect(0,30,200,50,10);
  rect(290,30,200,50,10);
  pop();
}

void drawBottomButton()
{
  push();
  
  fill(0);
  rect(350,750,250,100,10);
  rect(700,750,250,100,10);
  
  fill(150);
  rect(350,750,60,100,10);
  rect(540,750,60,100,10);
  rect(700,750,60,100,10);
  rect(890,750,60,100,10);
  
  fill(255);
  textSize(20);
  text("Miðar",450,785);
  text("Dagspassi",775,785);
  textSize(30);
  text(countM,470,820);
  text(countD,820,820);
  
  fill(0);
  text("-",370,800);
  text("-",720,800);
  text("+",560,800);
  text("+",910,800);
  pop();
}

void setButtonStatus(int index,boolean status)
{
  JSONObject value = new JSONObject();
  value.setBoolean(String.valueOf(index),status);
  jsonRemote.setJSONObject(index-1,value);
  saveJSONArray(jsonRemote, "remote.json");
}

void mousePressed()
{
  if(mouseX>=0 && mouseX<=width/2 && mouseY>=0 && mouseY<=50)tab=true;
  else if(mouseX>=width/2 && mouseX<=width && mouseY>=0 && mouseY<=50)tab=false;
  
  if(!tab)
  {
    for(RemoteDetails tmp : remoteDetails)
    {
      float x = tmp.getX();
      float y = tmp.getY();
      int index = getHexIndex(tmp.getId());
      if(tmp.isActive() && mouseX>=x && mouseX<=x+60 && mouseY>=y && mouseY<=y+60)
      {
        image(off,x,y);
        tmp.setActive(false);
        setButtonStatus(index,false);
      }
      else if(!tmp.isActive() && mouseX>=x && mouseX<=x+60 && mouseY>=y && mouseY<=y+60)
      {
        image(on,x,y);
        tmp.setActive(true);
        setButtonStatus(index,true);
      }
      push();
      translate(x,y);
      if(mouseX>=x+250 && mouseX<=x+405 && mouseY>=y+10 && mouseY<=y+60)
      {
        noFill();
        String temp = JOptionPane.showInputDialog(null,"Please input a start hexa decimal code");
        if(temp!=null)
        {
          JSONObject value = new JSONObject();
          value.setString(String.valueOf(index),temp);
          hexCode.setJSONObject(index-1,value);
          saveJSONArray(hexCode, "hexcode.json");
        }
      }
      if(mouseX>=x+450 && mouseX<=x+605 && mouseY>=y+10 && mouseY<=y+60)
      {
        noFill();
        String temp = JOptionPane.showInputDialog(null,"Please input a stop hexa decimal code");
        if(temp!=null)
        {
          JSONObject value = new JSONObject();
          value.setString(String.valueOf(index),temp);
          stopHexCode.setJSONObject(index-1,value);
          saveJSONArray(stopHexCode, "stopHexCode.json");
        }
      }
      
      pop();
    }
    
    if(mouseX>=730 && mouseX<=930 && mouseY>=550 && mouseY<=600)
    {
      String temp = JOptionPane.showInputDialog(null,"Please input a value (Heildartími (s)) ");
      if(temp!=null)
      {
        time=temp;
        jsonTime.setString("time",temp+"");
        saveJSONObject(jsonTime,"time.json");
      }
    }
    
    
    if(mouseX>=1020 && mouseX<=1220 && mouseY>=550 && mouseY<=600)
    {
      String temp = JOptionPane.showInputDialog(null,"Please input a value (Endatími (s))");
      if(temp!=null)
      {
        endTime=temp;
        jsonTime.setString("end",temp+"");
        saveJSONObject(jsonTime,"time.json");
      }
    }
    
    if(mouseX>=1030 && mouseX<=1230 && mouseY>=820 && mouseY<=870)
    {
      countD=0;
      countM=0;
      jsonTime.setString("countM",String.valueOf(0));
      jsonTime.setString("countD",String.valueOf(0));
      saveJSONObject(jsonTime,"time.json");
    }
  }
 
  if(tab)
  {
    for(int i=0;i<remote.size();i++)
    {      
      Remote tmp = remote.get(i);
      float x = tmp.getX();
      float y = tmp.getY();
      int index = getHexIndex(tmp.getId());
      push();
      translate(x,y);

      if(mouseX>=x+10 && mouseX<=x+95 && mouseY>=y+100 && mouseY<=y+140 && !tmp.isRunning())
      {
        Thread thread = new Thread(tmp);
        println(hexArray.get(index-1));
        tmp.setTime(Integer.parseInt(time));
        tmp.setEndTime(Integer.parseInt(endTime)); 
        thread.start();
      }
      else if(mouseX>=x+105 && mouseX<=x+190 && mouseY>=y+100 && mouseY<=y+140 && tmp.isRunning())
      {
        println(stopHexArray.get(index-1));
        tmp.setTime(0);
        tmp.halt();
      }
      pop();
    }
      if(mouseX>=350 && mouseX<=410 && mouseY>=750 && mouseY<=850 && countM-1>=0)countM-=1;
      if(mouseX>=540 && mouseX<=600 && mouseY>=750 && mouseY<=850)countM+=1;
      if(mouseX>=890 && mouseX<=950 && mouseY>=750 && mouseY<=850)countD+=1;
      if(mouseX>=700 && mouseX<=760 && mouseY>=750 && mouseY<=850 && countD-1>=0)countD-=1;
      jsonTime.setString("countM",String.valueOf(countM));
      jsonTime.setString("countD",String.valueOf(countD));
      saveJSONObject(jsonTime,"time.json");
  }

}

int getHexIndex(String id)
{
  int temp = id.indexOf(" ");
  int index = Integer.parseInt((id.substring(temp).trim()));
  return index;
}
