part of dots;

class Collision {

  final Body body1;
  final Body body2;

  Collision(this.body1, this.body2);

  /// Returns true if the two bodies collide, otherwise false.
  static bool collides(Body body1, Body body2) {
    // ToDo: Check if the bodies collide.
    //       - do they intersect?
    //       - do the velocity vectors point against each other?
    return false;
  }

  /// Applies the collision on the bodies.
  /// That means, calculating the new velocity.
  void apply() {

  }

}
