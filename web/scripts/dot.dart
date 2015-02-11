part of dots.web;

class DotWorld extends World {

  num width;
  num height;

  Map _dropBox;
  Random _randomizer = new Random();

  /// The acceleration that is applyed to all moving dots.
  final Vector _dotA = const Vector(0, 100);
  List<String> dotColors = ['#eaaa58', '#66b6be', '#e6d2c2'];
  final int _blackhole = 100;

  DotWorld(this.width, this.height);

  @override
  void setup() {

    var viewBox = { 'w': width, 'h': height };

    var paddingBox = maxsizeLayout(new Map.from(viewBox), maxw: 400, maxh: 300);

    paddingBox['w'] -= 188;
    paddingBox['h'] -= 156;

    var dotsBox = { 'w': 212, 'h': 144 };

    dotsBox = containLayout(paddingBox, dotsBox);
    dotsBox = centerLayout(viewBox, dotsBox);

    _dropBox = {
      'x': dotsBox['x'],
      'y': -150,
      'w': dotsBox['w'],
      'h': 100
    };

    _alignBumpers(dotsBox['x'], dotsBox['y'], dotsBox['w'], dotsBox['h']);

  }

  @override
  void step(num dt) {
    var bh = height + _blackhole;
    bodies.removeWhere((b) => b.s.y > bh);
    super.step(dt);
  }

  void _alignBumpers(num x, num y, num w, num h) {
    var a = w / 4;
    var b = h / 4;
    for (var i = 0; i < 5; i++) {
      var oy = i * b + y;
      var c = 5 - (i % 2);
      for (var j = 0; j < c; j++) {
        var ox = j * a + x;
        if (c == 4) ox += a / 2;
        _addBumper(ox, oy);
      }
    }
  }

  void _addBumper(num x, num y) {
    var d = new Bumper();
    d.s = new Vector(x, y);
    bodies.add(d);
  }

  void drop([int n = 1]) {
    for (var i = 0; i < n; i++) {
      var p = randomPointInRect(_dropBox);
      var dot = new Dot(_randomDotColor());
      dot.s = new Vector(p['x'], p['y']);
      dot.a = _dotA;
      bodies.add(dot);
    }
  }

  /// Returns a random color out of the list [dotColors].
  String _randomDotColor() {
    return (dotColors..shuffle(_randomizer)).first;
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

  /// Crops if the size of [box] is bigger than [maxw] or [maxh].
  /// It doesn't maintain aspect ratio,
  Map maxsizeLayout(Map box, { maxw, maxh }) {
    if (maxw != null && box['w'] > maxw) box['w'] = maxw;
    if (maxh != null && box['h'] > maxh) box['h'] = maxh;
    return box;
  }

  /// Algins [box] in the center of [container].
  Map centerLayout(Map container, Map box) {
    box['x'] = (container['w'] - box['w']) / 2;
    box['y'] = (container['h'] - box['h']) / 2;
    return box;
  }

  /// Returns random x and y coordinates for a point, that is in
  /// the bounding [rect]
  Map randomPointInRect(Map rect) {
    var xmin = rect['x'];
    var xmax = rect['x'] + rect['w'] +1;
    var ymin = rect['y'];
    var ymax = rect['y'] + rect['h'] +1;
    var p = { 'X': 0, 'y': 0 };
    p['x'] = _randomizer.nextInt(xmax - xmin) + xmin;
    p['y'] = _randomizer.nextInt(ymax - ymin) + ymin;
    return p;
  }

}

class Dot extends DynamicBody with CanvasDot {

  static const defaultRadius = 6;

  /// The dot's color.
  final String color;
  /// The coefficient of restitution.
  final num k = 0.25;

  Dot(this.color) : super(defaultRadius);

}

class Bumper extends FixedBody with CanvasDot {

  static const defaultRadius = 4;

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
