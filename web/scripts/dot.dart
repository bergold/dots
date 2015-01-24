part of dots.web;

class DotWorld extends World {

  final num width;
  final num height;

  DotWorld(this.width, this.height);

  //@override
  void setup() {

    var testV = new Dot('red', 10);
    testV.p = new Vector(-20, height / 2);
    testV.v = new Vector(100, 0);
    bodies.add(testV);

    var testA = new Dot('blue', 10);
    testA.p = new Vector(width + 20, height / 2 + 6);
    testA.v = new Vector(-50, 0);
    bodies.add(testA);

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
