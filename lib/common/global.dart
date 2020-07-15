int futureTask() {
  return throw 111;
}

class Global {
  static String text = 'asdsda';
  static String domain = 'www.baidu.com';
  static Future init() {
    return new Future(() => {});
  }
}
