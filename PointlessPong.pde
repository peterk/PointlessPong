// PointlessPong - a simple excursion using the Kinect .
// Kinect library for Processing by Daniel Shiffman: http://www.shiffman.net

import org.openkinect.*;
import org.openkinect.processing.*;

KinectTracker tracker;
Kinect kinect;

int ballsize = 10;
int padheight = 100;

Ball ball;
PVector body;

void setup() {
  size(640,320);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  ball = new Ball(ballsize);
}

void draw() {
  background(33);

  tracker.track();
  tracker.setThreshold(500);

  // Debug show kinect tracking image
  tracker.display();

  body = tracker.getLerpedPos();

  // The pad
  fill(50,100,250,200);
  noStroke();
  rect(body.x,body.y-(padheight/2),20,padheight);

  //Ball
  ball.move();
  ball.display();

  //Collission?
  if((ball.x + ballsize >= body.x && ball.x + ballsize <= body.x + 20) && (ball.y >= body.y-(padheight/2) && ball.y <= body.y + (padheight/2))) {
    ball.collide();
  }

}


void stop() {
  tracker.quit();
  super.stop();
}

