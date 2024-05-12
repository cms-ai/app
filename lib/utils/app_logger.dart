import 'package:logger/logger.dart';

class AppLogger {
  final logger = Logger();
  void showDebug({
    String? nameFile,
    int? numberLine,
    String? output,
  }) {
    logger.d("$nameFile - $numberLine \n $output");
  }
}
