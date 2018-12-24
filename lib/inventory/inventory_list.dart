import 'package:flutter/material.dart';
import 'inventory_item.dart';
import 'inventory_loader.dart';
import 'inventory_detail.dart';

class InventoryList extends StatefulWidget {
  @override
  InventoryListState createState() => new InventoryListState();
}

class InventoryListState extends State<InventoryList> {
  List<InventoryItem> _list;
  Set<String> _favorites = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  InventoryListState() {
    InventoryLoader loader = InventoryLoader();
    _list = loader.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _getTile(i);
      },
    );
  }

  Widget _getTile(i) {
    // do some math magic to allow dividers every other row
    if (i.isOdd) return Divider();
    final index = i ~/ 2;

    if (index >= _list.length) {
      return null;
    }
    return _buildTile(_list[index]);
  }

  ListTile _buildTile(InventoryItem item) {
    return ListTile(
      title: Text(
        item.name,
        style: _biggerFont,
      ),
      leading: Icon(_iconForType(item)),
      trailing: IconButton(
          icon: _favoriteIcon(item.itemId),
          onPressed: () {
            _favoriteToggle(item.itemId);
          }),
      onTap: () {
        _showItem(item);
      },
    );
  }

  void _showItem(InventoryItem item) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) {
        return InventoryDetail(item, _favorites);
      }),
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

  IconData _iconForType(InventoryItem item) {
    IconData icon = Icons.broken_image;
    if (item.type == InventoryType.book) {
      icon = Icons.book;
    } else if (item.type == InventoryType.comic) {
      icon = Icons.photo_album;
    } else if (item.type == InventoryType.apparel) {
      icon = Icons.accessibility_new;
    } else if (item.type == InventoryType.food) {
      icon = Icons.fastfood;
    } else if (item.type == InventoryType.tableware) {
      icon = Icons.free_breakfast;
    } else if (item.type == InventoryType.audio) {
      icon = Icons.audiotrack;
    } else if (item.type == InventoryType.video) {
      icon = Icons.ondemand_video;
    } else if (item.type == InventoryType.game) {
      icon = Icons.casino;
    }
    return icon;
  }
}

