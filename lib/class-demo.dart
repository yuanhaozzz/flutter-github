import 'dart:convert';

// class Person {
//   num x, y;
//   // 构造函数
//   Person(this.x, this.y);
//   // 命名构造函数
//   Person.init() {
//     print('call Proson');
//   }
// }

class Man {
  num x, y;

  // 初始化列表
//   Man.init(Map<String, num> json)
//       : x = json['x'],
//         y = json['y'] {
//     print('init$x, $y');
//   }
  // 调用父类构造函数
//   Man() : super.init() {
//     print('call man');
//   }

  Man(this.x, this.y);

  // 重定向本类构造函数
  Man.redirect(Map<String, num> json) : this(json['x'], json['y']);

  num distanceTo(num other) {
    return x - other;
  }
}

class Logger {
  final String name;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      print(_cache);

      return logger;
    }
  }

  Logger._internal(this.name);
}

// Getter Setter

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

void main() {
//   var logger = Logger('text');
//   print(logger);
//   var man = new Man(1, 2);
//   print(man.x);
//   print(man.distanceTo(2));
  var rectangle = Rectangle(1, 2, 3, 4);
  rectangle.right = 12;
  print(rectangle.left);
}
