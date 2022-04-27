import 'package:flutter/material.dart';

class ViewOrdersScreen extends StatefulWidget {
  const ViewOrdersScreen({Key? key}) : super(key: key);

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
