import 'dart:async';
import 'package:flutter/material.dart';
import 'inventory_item.dart';
import 'dart:math' as math;

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
      body: InventoryDetailScroller(widget.item, _itemImageAsset)
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

  InventoryDetailScroller(this._item, this._itemImageAsset);
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate:_SliverAppBarDelegate(
            minHeight: 60.0,
            maxHeight: 400.0,
            child: Image(image: _itemImageAsset, fit:BoxFit.cover),
          )
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

/* below from https://medium.com/flutter-io/slivers-demystified-6ff68ab0296f */
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, 
      double shrinkOffset, 
      bool overlapsContent) 
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}