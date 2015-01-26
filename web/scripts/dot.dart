part of dots.web;

class DotWorld extends World {

  final num width;
  final num height;

  final num _bumperType = 'dot-bumper';
  final num _bumperRadius = 10;

  DotWorld(this.width, this.height);

  //@override
  void setup() {

    _calcFixed(94, 78, 212, 144);

    var testV = new Dot('red', 10);
    testV.p = new Vector(-20, height / 2);
    testV.v = new Vector(100, 0);
    bodies.add(testV);

    var testA = new Dot('blue', 10);
    testA.p = new Vector(width + 20, height / 2 + 6);
    testA.v = new Vector(-50, 0);
    bodies.add(testA);

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
    container.children = [];

    window.console.groupCollapsed("trigger render");
    world.bodies.forEach((body) {
      window.console.log("${body.p}, ${body.v}, ${body.a}");
      var b = new DivElement();
      b.classes.add('dot');
      b.classes.add(body.type);
      b.style.left = '${body.p.x}px';
      b.style.top = '${body.p.y}px';
      container.append(b);
    });
    window.console.groupEnd();
  }

}
