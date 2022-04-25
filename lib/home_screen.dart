import 'dart:io';

import 'package:flutter/material.dart';
import 'package:object_box_project/model/item_model.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';
import 'package:object_box_project/order_screen.dart';

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
    // open store
    openStore().then((Store store) {
      _store = store;
      var syncServerIp = Platform.isAndroid ? '10.2.2.2' : '127.0.0.1';
      Sync.client(store, 'ws:$syncServerIp : 9999', SyncCredentials.none());
    });

    orderBox = _store?.box<OrderModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order App Demo'),
      ),
      body: Column(
        children: [
          const Text(
            "Welcome to our restaurant",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                final orderModel = OrderModel();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderScreen(
                            orderBox: orderBox, orderModel: orderModel)));
              },
              child: const Text("Create your order"))
        ],
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
