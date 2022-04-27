import 'package:object_box_project/model/item_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
//@Sync()
class OrderModel {
  int id = 0;
  bool ordered = false;

  @Backlink()
  final items = ToMany<ItemModel>();

  OrderModel({
    this.id = 0,
    this.ordered = false,
  });
}
