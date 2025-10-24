import 'package:intl/intl.dart';

extension CurrencyFormatter on String {
  String toRPCurrency() {
    final number = int.tryParse(this);
    if (number != null) {
      final formatter = NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp');
      return formatter.format(number).replaceAll(RegExp(r',00$'), '');
    }
    return this;
  }
}
