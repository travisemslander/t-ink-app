import 'inventory_item.dart';

class InventoryLoader {
  InventoryLoader() ;

  List<InventoryItem> load() {
    var list = List<InventoryItem>();

    list.add(InventoryItem("BOOK1", "My Handbook", "My Handbook description", InventoryType.book));

    list.add(InventoryItem("BOOK2", "How to do Magic", "Learn how to make magic", InventoryType.book));

    list.add(InventoryItem("BOOK3", "Movie Book #9", "Working on Color Man 2", InventoryType.book));

    list.add(InventoryItem("BOOK4", "First Stop", "Stopping off the highway at Super America gas station", InventoryType.book));

    list.add(InventoryItem("BOOK5", "Mom's Color Book", "Color book for my mom", InventoryType.book));

    list.add(InventoryItem("BOOK6", "My Family", "A book about my family", InventoryType.book));

    list.add(InventoryItem("COMIC1", "A T-INK Comic", "Description", InventoryType.comic));

    list.add(InventoryItem("SHIRT1", "T-INK Shirt", "Description", InventoryType.apparel));

    list.add(InventoryItem("TABLEWARE1", "T-INK Coffee Cup", "Description", InventoryType.tableware));

    list.add(InventoryItem("GAME1", "T-INK Cards", "T-INK Playing cards that are kind of like the game War. Whoever has more power can take that amount of power away from their opponent's card. It is like a battle.", InventoryType.game));
    
    list.add(InventoryItem("VIDEO1", "Ice Skating Video", "Description", InventoryType.video));

    return list;
  }
}