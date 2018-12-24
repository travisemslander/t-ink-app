import 'inventory_item.dart';

class InventoryLoader {
  InventoryLoader() ;

  List<InventoryItem> load() {
    var list = List<InventoryItem>();

    list.add(InventoryItem("BOOK1", "Oragami Handbook", "Learn how to make cool oragami with this handbook.", InventoryType.book));

    list.add(InventoryItem("COMIC1", "A T-INK Comic", "Description", InventoryType.comic));

    list.add(InventoryItem("SHIRT1", "T-INK Shirt", "Description", InventoryType.apparel));

    list.add(InventoryItem("TABLEWARE1", "T-INK Coffee Cup", "Description", InventoryType.tableware));

    list.add(InventoryItem("GAME1", "T-INK Cards", "T-INK Playing cards that are kind of like the game War. Whoever has more power can take that amount of power away from their opponent's card. It is like a battle.", InventoryType.game));
    
    list.add(InventoryItem("VIDEO1", "Ice Skating Video", "Description", InventoryType.video));

    return list;
  }
}