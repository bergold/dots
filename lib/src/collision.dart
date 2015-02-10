part of dots;

class CollisionController {

  final List<Collision> collisions = new List<Collision>();

  void process(Body body1, Body body2) {
    if (!Collision.collides(body1, body2)) return;
    if (hasCollision(body1, body2)) return;
    var c = new Collision(body1, body2);
    c.apply();
    c.applyNormalForce();
    collisions.add(c);
  }

  void step() {
    collisions..retainWhere((c) => Collision.collides(c.body1, c.body2))
      ..forEach((c) => c.applyNormalForce());
  }

  /// Return true if a collision between [body1] and [body2] is stored in
  /// [collisions]
  bool hasCollision(body1, body2) {
    var cc = collisions.where((c) => (c.body1 == body1 && c.body2 == body2) || (c.body1 == body2 && c.body2 == body1));
    return cc.isNotEmpty;
  }

}

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

    var k = (body1.k + body2.k) / 2;

    if (body1 is FixedBody) {
      body2.v = vs2 - vp2 * k;
    } else  if (body2 is FixedBody) {
      body1.v = vs1 - vp1 * k;
    } else {
      body1.v = vs1 + _oneDimensionalCollision(vp1, vp2, k);
      body2.v = vs2 + _oneDimensionalCollision(vp2, vp1, k);
    }
  }

  /// Provides the math for a one dimensional collision.
  Vector _oneDimensionalCollision(v1, v2, k) => (v1 + v2 - (v1 - v2) * k) / 2;

  /// Applies the normal force's acceleration.
  void applyNormalForce() {
    var bd;
    if (body1 is DynamicBody && body2 is FixedBody) {
      bd = body1;
    } else if (body2 is DynamicBody && body1 is FixedBody) {
      bd = body2;
    } else return;
    var n = body2.s - body1.s;

    var f = (bd.a * n) / (n * n);
    var ap = n * f;

    var an = ap * -1;
    bd.accelerate(an);
  }

}
