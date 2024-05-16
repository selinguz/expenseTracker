//convert string to a double
import 'package:intl/intl.dart';

double convertStringToDouble(String string) {
  double? amount = double.tryParse(string);
  return amount ?? 0;
}

//format double amount into turkish lira
String formatAmount(double amount) {
  final format =
      NumberFormat.currency(locale: 'tr_TR', symbol: '₺', decimalDigits: 2);
  return format.format(amount);
}

//calculate the number of months since the first start month
int calculateMonthCount(int startYear, startMonth, currentYear, currentMonth) {
  int monthCount =
      (currentYear - startYear) * 12 + (currentMonth - startMonth + 1);
  return monthCount;
}

//get current month name
String getCurrentMonthName() {
  DateTime now = DateTime.now();
  List<String> months = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık'
  ];
  return months[now.month - 1];
}
