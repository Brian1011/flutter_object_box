import 'package:flutter/material.dart';

import 'model/order_model.dart';
import 'objectbox.g.dart';

class ViewOrdersScreen extends StatefulWidget {
  final Box<OrderModel> orderBox;
  const ViewOrdersScreen({required this.orderBox, Key? key}) : super(key: key);

  @override
  _ViewOrdersScreenState createState() => _ViewOrdersScreenState();
}

class _ViewOrdersScreenState extends State<ViewOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Orders"),
      ),
      body: Column(
        children: const [Expanded(child: Text("All"))],
      ),
    );
  }
}
