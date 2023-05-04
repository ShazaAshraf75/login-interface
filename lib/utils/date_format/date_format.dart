import 'package:intl/intl.dart';

String dateFormat(String dateFormat) {
  return DateFormat('dd-MM-yyyy').format(
    DateTime.parse(dateFormat),
  );
}
