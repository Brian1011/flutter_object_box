//@Entity()
import 'package:object_box_project/model/order_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class ItemModel {
  int id = 0;
  String itemName;
  int itemCount;

  final orderModel = ToOne<OrderModel>();
  ItemModel({required this.itemName, required this.itemCount});
}
