class Ball {
  float x, y, speedX, speedY, diameter;
  color c;

  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = color(225);
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }

  float left() {
    return x - diameter / 2;
  }

  float right() {
    return x + diameter / 2;
  }

  float top() {
    return y - diameter / 2;
  }

  float bottom() {
    return y + diameter / 2;
  }
};
