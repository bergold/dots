part of dots.web;

class DotWorld extends World {

  final num width;
  final num height;

  DotWorld(this.width, this.height);

  @override
  void setup() {

    _calcBumper(94, 78, 212, 144);

    var testB = new Dot('blue', '#eaaa58');
    var randg = new Random();
    //var xxx = randg.nextInt(101) - 50;
    var xxx = 0;
    testB.s = new Vector(width / 2 + xxx, -20);
    testB.v = new Vector(0, 0);
    testB.a = new Vector(0, 100);
    bodies.add(testB);

  }

  void _calcBumper(num x, num y, num w, num h) {
    var a = w / 4;
    var b = h / 4;
    for (var i = 0; i < 5; i++) {
      var oy = i * b + y;
      var c = 5 - (i % 2);
      for (var j = 0; j < c; j++) {
        var ox = j * a + x;
        if (c == 4) ox += a / 2;
        _spawnBumper(ox, oy);
      }
    }
  }

  void _spawnBumper(num x, num y) {
    var d = new Bumper();
    d.s = new Vector(x, y);
    bodies.add(d);
  }

  /// Scales the [box] so that it fits into the [container].
  Map containLayout(Map container, Map box) {
    var k1 = container['h'] / container['w'];
    var k2 = box['h'] / box['w'];
    if (k1 < k2) {
      box['h'] = container['h'];
      box['w'] = box['h'] / k2;
    } else {
      box['w'] = container['w'];
      box['h'] = box['w'] * k2;
    }
    return box;
  }

}

class Dot extends DynamicBody with CanvasDot {

  static const defaultRadius = 6;

  /// The dot's type.
  final String type;
  final String color;
  /// The coefficient of restitution.
  final num k = 0.25;

  Dot(this.type, this.color) : super(defaultRadius);

}

class Bumper extends FixedBody with CanvasDot {

  static const defaultRadius = 4;

  final String type = 'bumper';
  final String color = '#4f3c0f';
  /// The coefficient of restitution.
  final num k = 0.25;

  Bumper() : super(defaultRadius);

}

abstract class CanvasDot {

  //Vector s;
  //num radius;
  String color = 'black';

  void draw(CanvasRenderingContext2D ctx) {
    ctx.save();
    ctx.beginPath();
    ctx.arc(s.x, s.y, radius, 0, 2 * PI);
    ctx.fillStyle = color;
    ctx.fill();
    ctx.restore();
  }

}

class CanvasDotRender extends Render {

  final CanvasElement canvas;
  final DotWorld world;
  CanvasRenderingContext2D ctx;

  CanvasDotRender(this.canvas, DotWorld w) : world = w, super(w) {
    ctx = canvas.getContext('2d');
  }

  void render() {
    // Clean.
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    // Draw all bodies.
    world.bodies.forEach((b) => (b as CanvasDot).draw(ctx));
  }

}
