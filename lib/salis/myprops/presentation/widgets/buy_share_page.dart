import '../../../../salis/props/data/co_ownership.dart';
import 'package:flutter/material.dart';

class BuySharePage extends StatelessWidget {
  final OwnershipPool pool;
  const BuySharePage({
    required this.pool,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('Buy Shares of ${pool.equityShare.toString()}'),
              Text('Share Price ${pool.sharePrice.toString()}'),
              Text('Buy Shares of ${pool.owner.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
