part of dots.web;

void initDebugConsole(DotWorld world, Driver driver) {

  var container = querySelector('#debugconsole');
  container.attributes.remove('hidden');

  container.querySelector('#btn1').onClick.listen((e) => driver.start());
  container.querySelector('#btn2').onClick.listen((e) => driver.stop());
  container.querySelector('#btn3').onClick.listen((e) => world.drop());
  container.querySelector('#btn4').onClick.listen((e) => world.drop(20));
  container.querySelector('#btn5').onClick.listen((e) => world.reset());
  container.querySelector('#btn6').onClick.listen((e) {
    driver.start();
    new Timer(new Duration(seconds: 1), () => driver.stop());
  });

}
