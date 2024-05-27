import 'package:intl/intl.dart';

class AppDateTime {
  static final months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  static convertToDateTimeString(
    int millisecondsSinceEpoch, {
    DateFormat? dateFormat,
  }) {
    final time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return (dateFormat ?? DateFormat("dd/MM/yyyy")).format(time);
  }
}
