class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;

  boolean dead = false;
  boolean rearchedGoal = false;
  boolean isBest = false;

  float fit = 0;

  Dot() {
    brain = new Brain(400);

    pos = new PVector(width/2, height-150);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }



  //--------------------------------------------------------------------------------
  void show() {
    if (isBest) {
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    } else {
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }

  //--------------------------------------------------------------------------------
  void move() {
    if (brain.dir.length > brain.step) {
      acc = brain.dir[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }


  //--------------------------------------------------------------------------------
  void update() {

    if (!dead && !rearchedGoal) {
      move();
      if (pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2) {
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) {
        //Ha llegado a la meta
        rearchedGoal = true;
      }
    }
  }


  //--------------------------------------------------------------------------------
  void calculateFit() {

    if (rearchedGoal) {
      fit = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    } else {
      float distToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fit = 1.0/(distToGoal*distToGoal);
    }
  }


  //--------------------------------------------------------------------------------
  //Clonarlo
  Dot crearBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();

    return baby;
  }

  //--------------------------------------------------------------------------------
}
