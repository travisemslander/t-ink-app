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
    _favorites = widget.favorites;
    _itemImageAsset = AssetImage("assets/"+item.itemId+".jpg");

    precacheImage(_itemImageAsset, context, onError: (e, stackTrace) {
      setState(() {
        _itemImageAsset = AssetImage("assets/tink-circle-512.png");
      });
    });

    return new Scaffold(
      body: InventoryDetailScroller(widget.item, _itemImageAsset, _favoriteIcon(item.itemId), () => _favoriteToggle(item.itemId))
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

class InventoryDetailScroller extends StatelessWidget {
  final InventoryItem _item;
  final AssetImage _itemImageAsset;
  final Icon _favicon;
  final _favfunc;

  InventoryDetailScroller(this._item, this._itemImageAsset, this._favicon, this._favfunc);
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(_item.name),
          backgroundColor: Colors.black, // shouldn't matter
          expandedHeight: 400.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(image:_itemImageAsset, fit:BoxFit.cover),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 0.5),
                      colors: <Color>[Color(0x70000000), Color(0x00000000)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: _favicon,
              onPressed: _favfunc,
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                child: Text(_item.description),
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
            ]
          ),
        )
      ]
    );
  }
}
