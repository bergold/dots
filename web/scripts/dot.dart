part of dots.web;

class DotWorld extends World {

  final num width;
  final num height;

  final num _bumperRadius = 4;

  DotWorld(this.width, this.height);

  //@override
  void setup() {

    _calcBumper(94, 78, 212, 144);

    /*var testR = new Dot('red', 6);
    testR.p = new Vector(-20, height / 2);
    testR.v = new Vector(100, 0);
    bodies.add(testR);*/

    var testB = new Dot('blue', 6);
    var randg = new Random();
    var xxx = randg.nextInt(101) - 50;
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
    var d = new Bumper(_bumperRadius);
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

class Dot extends DynamicBody {

  /// The dot's type.
  final String type;

  Dot(this.type, r) : super(r);

}

class Bumper extends FixedBody {

  final String type = 'bumper';

  Bumper(r) : super(r);

}

class DotRender extends Render {

  final HtmlElement container;

  DotRender(this.container, w) : super(w);

  void render() {
    var confrag = window.document.createDocumentFragment();

    window.console.groupCollapsed("trigger render");
    world.bodies.forEach((body) {
      window.console.log("${body.s}, ${body.v}, ${body.a}");
      var b = new DivElement();
      b.classes.add('dot');
      b.classes.add(body.type);
      b.style.left = '${body.s.x}px';
      b.style.top = '${body.s.y}px';
      b.style.width = '${body.radius * 2}px';
      b.style.height = '${body.radius * 2}px';
      confrag.append(b);
    });
    window.console.groupEnd();

    container.children = [];
    container.append(confrag);
  }

}
