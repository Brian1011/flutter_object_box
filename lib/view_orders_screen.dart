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
                      color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ExpansionTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order no. #${order.id}"),
                          ],
                        ),
                        children: [
                          ...order.items
                              .map((orderItem) => ListTile(
                                    title: Text(
                                        "${orderItem.itemName} (${orderItem.itemCount})"),
                                  ))
                              .toList()
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
