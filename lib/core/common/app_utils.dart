import 'package:intl/intl.dart';

class AppUtils {
  static String formatDate(DateTime dt, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(dt);
  }

  static String limitText(String text, {int max = 40}) {
    if (text.length <= max) return text;
    return text.substring(0, max) + '...';
  }
}
