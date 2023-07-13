import 'package:intl/intl.dart';

class TimeFormat {
  static String simplify(DateTime date) {
    const localeLangguage = 'id_ID';

    return DateFormat.yMMMd(localeLangguage).format(date);
  }
}
