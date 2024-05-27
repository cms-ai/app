import 'package:app/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class CommonDatePicker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final DateTime? initialDateTime;
  final Function(DateTime) onDateTimeChanged;
  const CommonDatePicker({
    super.key,
    this.mode = CupertinoDatePickerMode.dateAndTime,
    this.initialDateTime,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor4,
      height: 300,
      child: CupertinoDatePicker(
        mode: mode,
        initialDateTime: initialDateTime,
        onDateTimeChanged: onDateTimeChanged,
        use24hFormat: false,
        minuteInterval: 1,
      ),
    );
  }
}
