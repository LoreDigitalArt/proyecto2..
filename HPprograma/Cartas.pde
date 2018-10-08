class Carta{  
  float ancho;
  float alto;
  Body b;
  
  Carta(float x_, float y_, float ancho_, float alto_){
    this.ancho = ancho_; 
    this.alto = alto_;
  
    BodyDef bodydef = new BodyDef();
    bodydef.type = BodyType.DYNAMIC;
    bodydef.position = box2d.coordPixelsToWorld(x_,y_);
    
    
    b = box2d.createBody(bodydef);
    
    PolygonShape polygonshape = new PolygonShape();

    float anchoEnBox2d = box2d.scalarPixelsToWorld(ancho_/2);
    float altoEnBox2d = box2d.scalarPixelsToWorld(alto_/2);
    polygonshape.setAsBox(anchoEnBox2d,altoEnBox2d);
    
    FixtureDef  fixturedef = new FixtureDef();
    
    fixturedef.shape = polygonshape;
    fixturedef.density = 1;
    fixturedef.friction = 0.3;
    fixturedef.restitution = 0.5;
    box2d.setGravity(0,-9.8);
    
    b.createFixture(fixturedef);
    
  }
  
  boolean estaEnPantalla(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    if(posicion.y>height+max(ancho,alto)){
      //eliminaElBody();
      return false;
    }
    else{
      return true;
    }
  }
  
  
  void display(){
    
    Vec2 posicion = box2d.getBodyPixelCoord(this.b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x, posicion.y);
    fill(255);
    stroke(0);
    rect(0,0,ancho,alto);
    triangle(0,0,50,0,25,20);
    fill(#901313);
    stroke(0);
    ellipse(25,17,10,10);
    popMatrix();
    
  }
}
