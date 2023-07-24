import 'package:intl/intl.dart';

class DateTimeService {
  static formateDate(DateTime? dateTime) {
    final dateFormat = DateFormat.yMd();
    if (dateTime != null) return dateFormat.format(dateTime);
  }

  static formateDateTime(DateTime? dateTime) {
    final dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
    if (dateTime != null) return dateFormat.format(dateTime);
  }
}
