import 'package:intl/intl.dart';

class Common {
  caculateDays(String s) {
    int loveDays = 0;
    DateTime lovedDate = DateFormat("dd/MM/yyyy").parse(s);
    DateTime currentDate = DateTime.now();
    loveDays = currentDate.difference(lovedDate).inDays;
    return loveDays;
  }

  convertDate(DateTime date) {
    String s = "";
    s = s + "${date.day}/${date.month}/${date.year}";
    return s;
  }

  switchDateToString(DateTime date) {
    String s = DateFormat('dd/MM/yyyy').format(date);
    return s;
  }
}
