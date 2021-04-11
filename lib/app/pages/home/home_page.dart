import 'package:english_platform_app/app/models/item_model.dart';
import 'package:english_platform_app/app/pages/home/components/item_widget.dart';
import 'package:english_platform_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var item = ItemModel();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar Item'),
            content: TextField(
              onChanged: (value) {
                item.setTitle(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo Item',
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  controller.addItem(item);
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: 'Pesquisa...'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Observer(builder: (_) {
              return Text('${controller.totalChecked}');
            }),
            onPressed: () {}
          )
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.listFiltered.length,
          itemBuilder: (_, index) {
            var item = controller.listFiltered[index];
            return ItemWidget(
              item: item,
              removeCliked: () {
                controller.removeItem(item);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
