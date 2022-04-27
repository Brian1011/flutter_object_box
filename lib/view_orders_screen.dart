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
    // get all items in the box
    List<OrderModel> orders = widget.orderBox.getAll().reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Orders"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    // get single item per index
                    OrderModel order = orders[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ExpansionTile(
                        title: Text("Order no. #${order.id}"),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
