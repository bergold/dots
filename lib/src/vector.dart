part of dots;

class Vector {

  final num x;
  final num y;

  const Vector(this.x, this.y);

  static aa(num amount, num angle) {
    var x = amount * cos(angle);
    var y = amount * sin(angle);
    return new Vector(x, y);
  }

  num get amount => sqrt(x*x + y*y);
  num get angle => atan(y / x) + (y < 0 ? 180 : 0);

  String toString() => '($x $y)';

  Vector operator + (Vector v) => new Vector(x + v.x, y + v.y);
  Vector operator - (Vector v) => new Vector(x - v.x, y - v.y);

  operator * (s) {
    // Scalar product
    if (s is Vector) return x * s.x + y * s.y;
    // Mutiplication with a scalar.
    if (s is num) return new Vector(x * s, y * s);
  }

  Vector operator / (num s) => new Vector(x / s, y / s);

  Vector get normalized => this / amount;

}
