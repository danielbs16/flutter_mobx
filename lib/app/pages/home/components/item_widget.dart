import 'package:english_platform_app/app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final Function removeCliked;

  const ItemWidget({Key key, this.item, this.removeCliked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title),
          leading: Checkbox(
            value: item.check,
            onChanged: (bool value) {
              item.setCheck(value);
            },
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: removeCliked,
          ),
        );
      },
    );
  }
}
