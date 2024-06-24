import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasir_app/features/income/data/models/daily_income_model.dart';
import 'package:kasir_app/features/transaction/data/models/order_model.dart';

class IncomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getTodaysTransactions() {
    DateTime now = DateTime.now();
    DateTime start = startOfDay(now);
    DateTime end = endOfDay(now);

    return _firestore
        .collection('orders')
        .where('order_at', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('order_at', isLessThanOrEqualTo: Timestamp.fromDate(end))
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return OrderModel(
            transactionId: data['transactionId'],
            id: data['id'],
            subtotal: data['subTotal'],
            products: [],
            userId: data['userId'],
            createdAt: data['created_at'],
            orderAt: (data['order_at'] as Timestamp).toDate());
      }).toList();
    });
  }

  Stream<List<OrderModel>> getMonthlyTransactions() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    return _firestore
        .collection('orders')
        .where('order_at', isGreaterThanOrEqualTo: startOfMonth)
        .where('order_at', isLessThanOrEqualTo: endOfMonth)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return OrderModel(
            transactionId: data['transactionId'],
            id: data['id'],
            subtotal: data['subTotal'],
            products: [],
            userId: data['userId'],
            createdAt: data['created_at'],
            orderAt: (data['order_at'] as Timestamp).toDate());
      }).toList();
    });
  }

  Stream<List<DailyIncome>> getDailyIncomeForMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    return FirebaseFirestore.instance
        .collection('orders')
        .where('order_at', isGreaterThanOrEqualTo: startOfMonth)
        .where('order_at', isLessThanOrEqualTo: endOfMonth)
        .snapshots()
        .map((snapshot) {
      Map<DateTime, int> dailyTotals = {};

      for (var doc in snapshot.docs) {
        final order = OrderModel.fromSnapshot(doc);
        final date = DateTime(
            order.orderAt!.year, order.orderAt!.month, order.orderAt!.day);
        dailyTotals[date] = (dailyTotals[date] ?? 0) + order.subtotal!;
      }

      return dailyTotals.entries
          .map((e) => DailyIncome(date: e.key, total: e.value))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
    });
  }
}

DateTime startOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day, 0, 0, 0);
}

DateTime endOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day, 23, 59, 59);
}
