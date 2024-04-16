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
