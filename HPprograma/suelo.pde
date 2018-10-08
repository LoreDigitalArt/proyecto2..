class Suelo {
  float x;
  float y;
  float w;
  float h;
  
  Body b;

  Suelo(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    PolygonShape sd = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);
    
    sd.setAsBox(box2dW, box2dH);


    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    b.createFixture(sd,1);
  }

  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(0,895,w,h);
  }

}
