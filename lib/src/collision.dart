part of dots;

class Collision {

  final Body body1;
  final Body body2;

  Collision(this.body1, this.body2);

  /// Returns true if the two bodies collide, otherwise false.
  static bool collides(Body body1, Body body2) {
    // If both bodies are fixed they don't collide.
    if (body1 is FixedBody && body2 is FixedBody) return false;
    // They interscet if the distance between them is lower than sum
    // of their radius.
    var s = body2.s - body1.s;
    if (s.amount > (body1.radius + body2.radius)) return false;
    // They don't collide if they move in different directions.
    var s2 = s + (body2.v.normalized - body1.v.normalized);
    if (s.amount < s2.amount) return false;
    return true;
  }

  /// Applies the collision on the bodies.
  /// That means, calculating the new velocity.
  void apply() {
    var n = body2.s - body1.s;

    var f1 = (body1.v * n) / (n * n);
    var vp1 = n * f1;
    var vs1 = body1.v - vp1;

    var f2 = (body2.v * n) / (n * n);
    var vp2 = n * f2;
    var vs2 = body2.v - vp2;

    if (body1 is FixedBody) {
      print("collide! fixed 1");
      body2.v = vs2 - vp2;
    } else  if (body2 is FixedBody) {
      print("collide! fixed 2");
      body1.v = vs1 - vp1;
    } else {
      print("collide! moved");
      body1.v = vs1 + vp2;
      body2.v = vs2 + vp1;
    }
  }

}
