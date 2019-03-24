import 'dart:async';
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
  AssetImage _itemImageAsset;

  @override
  Widget build(BuildContext context) {
    InventoryItem item = widget.item;
    _itemImageAsset = AssetImage("assets/"+item.itemId+".jpg");
    _favorites = widget.favorites;

    precacheImage(_itemImageAsset, context, onError: (e, stackTrace) {
      setState(() {
        _itemImageAsset = AssetImage("assets/tink-circle-512.png");
      });
    });

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
      body: Builder(
        // inner builder so we can fetch the scaffold from context for snack bar
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Expanded(child: new Image(image: _itemImageAsset, fit:BoxFit.cover)),
              Container(
                child: Text(item.description),
                padding: EdgeInsets.all(16.0),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  onPressed: () {
                    SnackBar snack = new SnackBar(
                      content: new Text("Thanks for your purchase"),
                    );
                    Scaffold.of(context).showSnackBar(snack);
                    Future.delayed(Duration(seconds:1), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: new Text(
                    "Purchase",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(16.0),
              ),
            ],
          );
        },
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
