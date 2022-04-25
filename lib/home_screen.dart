import 'dart:io';

import 'package:flutter/material.dart';
import 'package:object_box_project/model/item_model.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';

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
      var syncServerIp = Platform.isAndroid ? '10.2.2.2': '127.0.0.1';
      Sync.client(store, serverUri, creds)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
