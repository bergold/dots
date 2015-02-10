part of dots;

abstract class Body {

  /// The body's position [px].
  Vector s = const Vector(0, 0);
  /// The body's velocity [px/s].
  Vector v = const Vector(0, 0);
  /// The body's acceleration [px/s^2].
  Vector a = const Vector(0, 0);
  /// The coefficient of restitution.
  final num k = 1;
  /// Should return the radius of the bounding circle.
  final num radius;

  Body(this.radius);

  void step(num dt);
  void accelerate(Vector ac);

}

class FixedBody extends Body {

  /// The body's velocity [px/s].
  final Vector v = const Vector(0, 0);
  /// The body's acceleration [px/s^2].
  final Vector a = const Vector(0, 0);

  FixedBody(r) : super(r);

  void step(num dt) {}
  void accelerate(Vector ac) {}

}

class DynamicBody extends Body {

  List<Vector> _accelerations = new List<Vector>();

  DynamicBody(r) : super(r);

  /// Applies the velocity and acceleration
  /// on the body's position for a given time difference.
  void step(num dt) {
    var _a = _accelerations.fold(a, (prev, next) => prev + next);
    _accelerations.clear();
    s = (_a / 2 * dt * dt) + (v * dt) + s;
    v = (_a * dt) + v;
  }

  /// Applies a extra acceleration for the duration of one frame.
  void accelerate(Vector ac) => _accelerations.add(ac);

}
