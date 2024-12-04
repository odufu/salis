class PaymentPool {
  String? owner = "";
  bool? isTaken = false;
  double? price = 0;
  double? equity = 0;
  final String date;
  PaymentPool({
    this.owner,
    this.isTaken,
    this.price,
    this.equity,
    required this.date,
  });
}

List<PaymentPool> dummyPools = [
  PaymentPool(
    date: "2024-10-24",
    owner: "userId",
    price: 500000,
    equity: 20,
    isTaken: true,
  ),
  PaymentPool(
    date: "2024-10-24",
    owner: "userId",
    price: 500000,
    equity: 20,
    isTaken: true,
  ),
  PaymentPool(
    date: "2024-10-24",
    owner: "userId",
    price: 500000,
    equity: 20,
    isTaken: true,
  ),
  PaymentPool(
    date: "2024-10-24",
    owner: "userId",
    price: 500000,
    equity: 20,
    isTaken: true,
  ),
  PaymentPool(
    date: "2024-10-24",
    owner: "userId",
    price: 500000,
    equity: 20,
    isTaken: true,
  ),
];
