import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';
import 'package:object_box_project/view_orders_screen.dart';

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
  // set default items
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index].itemName,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // increase quantity by one
                            ElevatedButton(
                              onPressed: () {
                                items[index].itemCount++;
                                setState(() {});
                              },
                              child: const Icon(Icons.add),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                items[index].itemCount.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            // decrease quantity by one
                            ElevatedButton(
                              onPressed: () {
                                // Negative values are not allowed
                                if (items[index].itemCount == 0) return;
                                items[index].itemCount--;
                                setState(() {});
                              },
                              child: const Icon(Icons.remove),
                            )
                          ],
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 10);
                  },
                  itemCount: items.length,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: saveOrderModel, child: const Text('Confirm'))
          ],
        ),
      ),
    );
  }

  void saveOrderModel() {
    // fetch all items whose quantity is greater than 0
    List<ItemModel> orderedItems =
        items.where((element) => element.itemCount > 0).toList();

    // add that item to the orderModel
    widget.orderModel?.items.addAll(orderedItems);

    // print length
    widget.orderModel?.items.toList().forEach((element) {
      print(element.itemName);
    });
    // update order box
    widget.orderBox.put(widget.orderModel!);
    setState(() {});
    _showTopFlash();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewOrdersScreen(orderBox: widget.orderBox)));
  }

  void _showTopFlash({FlashBehavior style = FlashBehavior.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      //persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.black,
          brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: style,
          position: FlashPosition.bottom,
          child: FlashBar(
            title: const Text(
              'Success',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Order placed successfully',
              style: TextStyle(color: Colors.white),
            ),
            //showProgressIndicator: true,
            primaryAction: TextButton(
              onPressed: () => controller.dismiss(),
              child:
                  const Text('DISMISS', style: TextStyle(color: Colors.amber)),
            ),
          ),
        );
      },
    );
  }
}
