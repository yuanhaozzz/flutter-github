int futureTask() {
  return throw 111;
}

class Global {
  static String text = 'asdsda';
  static Future init() {
    return new Future(() => '');
  }
}
