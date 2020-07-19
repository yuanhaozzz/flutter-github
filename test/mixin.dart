class Animal {
  void test() {
    print('object========================');
  }
}

class Dog with Animal {
  Dog.init() {
    test();
  }
}

void main() => Dog.init();
