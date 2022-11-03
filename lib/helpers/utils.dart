import 'package:intl/intl.dart';

class Utils {
  static String getCurrentYear() {
    return DateFormat('yyyy').format(
      DateTime.now(),
    );
  }
}
