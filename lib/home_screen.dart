import 'package:flutter/material.dart';
import 'package:object_box_project/model/item_model.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';
import 'package:object_box_project/order_screen.dart';
import 'package:object_box_project/view_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Store? _store;
  Box<OrderModel>? orderBox;
  Box<ItemModel>? itemBox;

  @override
  void initState() {
    super.initState();

    addDefaultOrder() {
      // save default order
      OrderModel orderModel = OrderModel(ordered: true);

      // returns primary id
      int? recordId = orderBox?.put(orderModel);
    }

    // open store
    openStore().then((Store store) {
      _store = store;

      // initialize orderBox
      orderBox = _store?.box<OrderModel>();

      // print values
      // count checks number of records that exists
      debugPrint(orderBox?.count().toString());
      addDefaultOrder();
      debugPrint(orderBox?.count().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order App Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to our restaurant",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      final orderModel = OrderModel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen(
                                  orderModel: orderModel,
                                  orderBox: orderBox!)));
                    },
                    child: const Text("Create your order")),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewOrdersScreen(
                                    orderBox: orderBox!,
                                  )));
                    },
                    child: const Text("View orders"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // close box
    _store?.close();
  }
}
