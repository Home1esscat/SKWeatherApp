import 'package:intl/intl.dart';

class Utils {
  static String getCurrentYear() {
    return DateFormat('yyyy').format(
      DateTime.now(),
    );
  }

  static bool isDayTime() {
    var now = DateTime.now();
    String currentTimeString = DateFormat('HH').format(now).toString();
    int currentTimeInt = int.parse(currentTimeString);
    return currentTimeInt <= 6 || currentTimeInt >= 17 ? false : true;
  }

  static String unixToDate(int time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return (DateFormat('d MMM yyy').format(date));
  }
}
