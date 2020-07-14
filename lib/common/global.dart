int futureTask() {
  return throw 111;
}

class Global {
  static Future init() {
    return new Future(futureTask);
  }
}
