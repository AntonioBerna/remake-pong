Ball ball;
Paddle paddleLeft;
Paddle paddleRight;

int scoreLeft = 0;
int scoreRight = 0;

void setup() {
  size(800, 600);
  smooth();

  ball = new Ball(width / 2, height / 2, 50);
  ball.speedX = 5;
  ball.speedY = random(-3, 3);

  paddleLeft = new Paddle(15, height / 2, 30, 200);
  paddleRight = new Paddle(width - 15, height / 2, 30, 200);
}

void draw() {
  background(0);
  ball.move();
  ball.display();

  if (ball.right() > width) {
    ball.speedX = -ball.speedX;
    scoreLeft += 1;
    ball.x = width / 2;
    ball.y = height / 2;
  }

  if (ball.left() < 0) {
    ball.speedX = -ball.speedX;
    scoreRight += 1;
    ball.x = width / 2;
    ball.y = height / 2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }

  paddleLeft.move();
  paddleLeft.display();

  paddleRight.move();
  paddleRight.display();

  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height - paddleLeft.h / 2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h / 2;
  }

  if (paddleRight.bottom() > height) {
    paddleRight.y = height - paddleRight.h / 2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h / 2;
  }

  if (ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h / 2, paddleLeft.h / 2, -10, 10);
  }

  if (ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h / 2, paddleRight.h / 2, -10, 10);
  }

  textSize(90);
  textAlign(CENTER);
  text(scoreRight, width / 2 + 90, 90);
  text(scoreLeft, width / 2 - 90, 90);
}

void keyPressed() {
  if (keyCode == UP) {
    paddleRight.speedY = -3;
  }

  if (keyCode == DOWN) {
    paddleRight.speedY = 3;
  }

  if (key == 'a') {
    paddleLeft.speedY = -3;
  }

  if (key == 'z') {
    paddleLeft.speedY = 3;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    paddleRight.speedY = 0;
  }

  if (keyCode == DOWN) {
    paddleRight.speedY = 0;
  }

  if (key == 'a') {
    paddleLeft.speedY = 0;
  }

  if (key == 'z') {
    paddleLeft.speedY = 0;
  }
}
