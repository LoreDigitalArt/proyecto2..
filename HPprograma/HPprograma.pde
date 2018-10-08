 //SONIDO
import processing.sound.*;
SoundFile file;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

int x,y;
int pantalla=1;
ArrayList<Suelo> suelo;
ArrayList<Carta> carta;
PInicio pinicio;
PIns pins; 
PCartas pcartas;
PHW phw;
Harry1 harry1;
Harry2 harry2;
Carta una;

void setup(){
  size(900,900);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  una= new Carta(mouseX,mouseY,50,20);
  carta = new ArrayList<Carta>();
  suelo = new ArrayList<Suelo>();
  
  file = new SoundFile(this,"HPSong.mp3");
  pinicio = new PInicio();
  pins = new PIns();
  pcartas = new PCartas();
  phw = new PHW();
  harry1 = new Harry1();
  harry2 = new Harry2();
  
  suelo.add(new Suelo(width,height,width,10));
  suelo.add(new Suelo(width,height,width,10));
}

void draw(){
  file.play(); 
  box2d.step();
  background(255);
    
    
  if(pantalla==1){
    pinicio.p();
    
    if (mousePressed &&(mouseX>=250&&mouseX<=850&&mouseY>=750&&mouseY<=850))
    {
      pantalla=2;
    }
  }
  
  if(pantalla==2){
    pins.p();
    if (key=='z'||key=='Z')
    {
      pantalla=3;
    }
  }
  
  if(pantalla==3){
    pcartas.p();
    harry1.p();
    
    if(mousePressed &&(mouseX>=0 && mouseX<=900 && mouseY>=0 && mouseY<=900)){
      Carta p = new Carta(mouseX,mouseY,50,25);
      carta.add(p);
      
      for(int i=carta.size()-1; i>=0; i--){
        boolean r = carta.get(i).estaEnPantalla();
        if(r){
          carta.get(i).display();
        }
        
      }
      println(carta.size());
    }
    for (Carta p: carta) {
      p.display();
    }
    
    if (key=='x'||key=='X')
    {
      pantalla=4;
    }
  }
  
  if(pantalla==4){
    pcartas.p();
    harry2.p();
    
    for (Carta p: carta) {
      p.display();
    }
    if(mousePressed &&(mouseX>=0 && mouseX<=900 && mouseY>=0 && mouseY<=900)){
      box2d.setGravity(0,9.8);
    }
    
    if (key=='c'||key=='C')
    {
      pantalla=5;
    }
  }
  
  if(pantalla==5){
    phw.p();
    if (key=='v'||key=='V'){
      pantalla=1;
    }
  }
}
