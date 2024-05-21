import 'package:intl/intl.dart';

class AppDateTime {
  static convertToDateTimeString(
    int millisecondsSinceEpoch, {
    DateFormat? dateFormat,
  }) {
    final time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return (dateFormat ?? DateFormat("dd/MM/yyyy")).format(time);
  }
}
