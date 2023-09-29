import 'package:uuid/uuid.dart';
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();
const uuid = Uuid();

class Debt {
  Debt({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;

  final DateTime date;

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket(this.expenses);
  ExpenseBucket.forCategory(List<Debt> allExpenses) : expenses = allExpenses;

  final List<Debt> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
