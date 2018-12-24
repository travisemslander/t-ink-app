import 'package:flutter/material.dart';
import 'inventory_item.dart';

class InventoryDetail extends StatefulWidget {
  final InventoryItem item;
  final Set<String> favorites;

  InventoryDetail(this.item, this.favorites);

  @override
  InventoryDetailState createState() => new InventoryDetailState();
}

class InventoryDetailState extends State<InventoryDetail> {
  Set<String> _favorites;

  @override
  Widget build(BuildContext context) {
    InventoryItem item = widget.item;
    _favorites = widget.favorites;

    return new Scaffold(
      appBar: new AppBar(
        title: Text(item.name),
        actions: <Widget>[
          IconButton(
              icon: _favoriteIcon(item.itemId),
              onPressed: () {
                _favoriteToggle(item.itemId);
              })
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(child: Image.asset("assets/BOOK1.jpg", fit: BoxFit.cover))
      ]),
      bottomSheet: Column(
        //padding: EdgeInsets.only(top: 80.0, left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(item.description),
          SizedBox(height: 24.0),
          RaisedButton(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.symmetric(vertical: 12.0),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: new Text(
              "Purchase",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          )  
        ]
      ),
    );
  }

  Icon _favoriteIcon(String itemId) {
    if (_favorites.contains(itemId)) {
      return Icon(Icons.favorite, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: null);
    }
  }

  void _favoriteToggle(String itemId) {
    setState(() {
      if (_favorites.contains(itemId)) {
        _favorites.remove(itemId);
      } else {
        _favorites.add(itemId);
      }
    });
  }
}
