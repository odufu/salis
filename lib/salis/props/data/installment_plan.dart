enum PaymentFrequency { daily, weekly, monthly, quarterly, yearly }

class InstallmentPlan {
  final double totalCost;
  double? amountPaid = 0;
  final double initialPayment;
  final PaymentFrequency frequency;
  final List<double> paymentAmounts;
  final List<DateTime> paymentSchedules;

  InstallmentPlan({
    required this.totalCost,
    this.amountPaid,
    required this.initialPayment,
    required this.frequency,
  })  : paymentAmounts =
            _calculatePaymentAmounts(totalCost - initialPayment, frequency),
        paymentSchedules = _calculatePaymentSchedules(
            DateTime.now(), totalCost - initialPayment, frequency);

  // Helper method to calculate payment amounts
  static List<double> _calculatePaymentAmounts(
      double remainingCost, PaymentFrequency frequency) {
    int numPayments = _frequencyToPayments(frequency);
    double paymentAmount = remainingCost / numPayments;
    return List<double>.filled(numPayments, paymentAmount);
  }

  // Helper method to calculate payment schedules
  static List<DateTime> _calculatePaymentSchedules(
      DateTime startDate, double remainingCost, PaymentFrequency frequency) {
    int numPayments = _frequencyToPayments(frequency);
    List<DateTime> schedules = [];
    for (int i = 1; i <= numPayments; i++) {
      schedules.add(_nextPaymentDate(startDate, i, frequency));
    }
    return schedules;
  }

  // Helper to determine next payment date
  static DateTime _nextPaymentDate(
      DateTime startDate, int installmentNumber, PaymentFrequency frequency) {
    switch (frequency) {
      case PaymentFrequency.daily:
        return startDate.add(Duration(days: installmentNumber));
      case PaymentFrequency.weekly:
        return startDate.add(Duration(days: installmentNumber * 7));
      case PaymentFrequency.monthly:
        return DateTime(
            startDate.year, startDate.month + installmentNumber, startDate.day);
      case PaymentFrequency.quarterly:
        return DateTime(startDate.year,
            startDate.month + (installmentNumber * 3), startDate.day);
      case PaymentFrequency.yearly:
        return DateTime(
            startDate.year + installmentNumber, startDate.month, startDate.day);
    }
  }

  // Mapping frequency to number of payments
  static int _frequencyToPayments(PaymentFrequency frequency) {
    switch (frequency) {
      case PaymentFrequency.daily:
        return 365;
      case PaymentFrequency.weekly:
        return 52;
      case PaymentFrequency.monthly:
        return 12;
      case PaymentFrequency.quarterly:
        return 4;
      case PaymentFrequency.yearly:
        return 1;
    }
  }
}

// Example usage
// void main() {
//   InstallmentPlan plan = InstallmentPlan(
//     totalCost: 30000000,
//     initialPayment: 200000,
//     frequency: PaymentFrequency.monthly,
//   );

//   print('Payment amounts: ${plan.paymentAmounts}');
//   print('Payment dates: ${plan.paymentSchedules}');
// }
