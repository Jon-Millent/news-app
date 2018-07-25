import 'dart:async';

class LoLi{

  static Future<Null> sleep (int milliseconds) async{
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  static Timer setTimeout(Function callback, int milliseconds){
    Timer timer = new Timer(
        new Duration(milliseconds: milliseconds),
        callback
    );
    return timer;
  }

  static Timer setInterval(Function callback, int milliseconds) {
    Duration li = new Duration(milliseconds: milliseconds);

    Timer function() {
      Timer timer = new Timer(li, function);
      callback(timer);
      return timer;
    }

    return new Timer(li, function);
  }

}