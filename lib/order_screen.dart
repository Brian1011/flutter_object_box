import 'package:flutter/material.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';

import 'model/item_model.dart';

class OrderScreen extends StatefulWidget {
  final OrderModel? orderModel;
  final Box<OrderModel> orderBox;
  const OrderScreen({Key? key, this.orderModel, required this.orderBox})
      : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<ItemModel> items = [
    ItemModel(itemCount: 0, itemName: 'Pizza Salami'),
    ItemModel(itemCount: 0, itemName: 'Pizza Margaretta'),
    ItemModel(itemCount: 0, itemName: 'Spaghetti'),
    ItemModel(itemCount: 0, itemName: 'Lasagne'),
    ItemModel(itemCount: 0, itemName: 'Rice with Chicken'),
    ItemModel(itemCount: 0, itemName: 'Fried Noodle'),
    ItemModel(itemCount: 0, itemName: 'Fried Rice'),
    ItemModel(itemCount: 0, itemName: 'Salad'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make order"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  widget.orderModel?.ordered = true;
                  widget.orderBox.put(widget.orderModel!);
                  Navigator.pop(context);
                },
                child: const Text('Confirm'))
          ],
        ),
      ),
    );
  }

  void saveOrderModel(int index) {
    widget.orderModel?.items.add(items[index]);
    widget.orderBox.put(widget.orderModel!);
    setState(() {});
  }
}
