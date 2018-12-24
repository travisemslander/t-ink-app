import 'package:flutter/material.dart';
import 'inventory/inventory_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home Page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'T-INK',
          ),
        ),
        drawer: new Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text('T-INK'),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text('Store'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          )
        ])),
        body: InventoryList(),
      ),
    );
  }
}
