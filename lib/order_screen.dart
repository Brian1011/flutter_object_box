import 'package:flutter/material.dart';
import 'package:object_box_project/model/order_model.dart';
import 'package:object_box_project/objectbox.g.dart';

class OrderScreen extends StatefulWidget {
  final OrderModel? orderModel;
  final Box<OrderModel> orderBox;
  const OrderScreen({Key? key, this.orderModel, required this.orderBox})
      : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
