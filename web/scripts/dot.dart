part of dots.web;

class DotWorld extends World {

  final num width;
  final num height;

  final String _bumperType = 'bumper';
  final num _bumperRadius = 4;

  DotWorld(this.width, this.height);

  //@override
  void setup() {

    _calcFixed(94, 78, 212, 144);

    /*var testR = new Dot('red', 6);
    testR.p = new Vector(-20, height / 2);
    testR.v = new Vector(100, 0);
    bodies.add(testR);*/

    var testB = new Dot('blue', 6);
    var randg = new Random();
    var xxx = randg.nextInt(21) - 10;
    testB.p = new Vector(width / 2 + xxx, -20);
    testB.v = new Vector(0, 2);
    testB.a = new Vector(0, 10);
    bodies.add(testB);

  }

  void _calcFixed(num x, num y, num w, num h) {
    var a = w / 4;
    var b = h / 4;
    for (var i = 0; i < 5; i++) {
      var oy = i * b + y;
      var c = 5 - (i % 2);
      for (var j = 0; j < c; j++) {
        var ox = j * a + x;
        if (c == 4) ox += a / 2;
        _spawnFixed(ox, oy);
      }
    }
  }

  void _spawnFixed(num x, num y) {
    var d = new Dot.fixed(_bumperType, _bumperRadius);
    d.p = new Vector(x, y);
    bodies.add(d);
  }

}

class Dot extends Body {

  /// The dot's type.
  final String type;

  Dot(this.type, r) : super(r);

  Dot.fixed(this.type, r) : super.fixed(r);

}

class DotRender extends Render {

  final HtmlElement container;

  DotRender(this.container, w) : super(w);

  void render() {
    var confrag = window.document.createDocumentFragment();

    window.console.groupCollapsed("trigger render");
    world.bodies.forEach((body) {
      window.console.log("${body.p}, ${body.v}, ${body.a}");
      var b = new DivElement();
      b.classes.add('dot');
      b.classes.add(body.type);
      b.style.left = '${body.p.x}px';
      b.style.top = '${body.p.y}px';
      b.style.width = '${body.radius * 2}px';
      b.style.height = '${body.radius * 2}px';
      confrag.append(b);
    });
    window.console.groupEnd();

    container.children = [];
    container.append(confrag);
  }

}
