import 'inventory_item.dart';

class InventoryLoader {
  InventoryLoader() ;

  List<InventoryItem> load() {
    var list = List<InventoryItem>();

    list.add(InventoryItem(
      "BOOK1",
      InventoryType.book,
      "My Handbook",
      "My Handbook description",
    ));

    list.add(InventoryItem(
      "BOOK2", 
      InventoryType.book,
      "How to do Magic", 
      "Learn how to make magic"
    ));

    list.add(InventoryItem(
      "BOOK3", 
      InventoryType.book,
      "Movie Book #9", 
      "Working on Color Man 2"
    ));

    list.add(InventoryItem(
      "BOOK4", 
      InventoryType.book,
      "First Stop",
      "Stopping off the highway at Super America gas station"
    ));

    list.add(InventoryItem(
      "BOOK5",
      InventoryType.book,
      "Mom's Color Book",
      "Color book for my mom"
    ));

    list.add(InventoryItem(
      "BOOK6",
      InventoryType.book,
      "My Family",
      "A book about my family"
    ));

    list.add(InventoryItem(
      "COMIC1", InventoryType.comic,
      "A T-INK Comic",
      "Description"
    ));

    list.add(InventoryItem(
      "SHIRT1",
      InventoryType.apparel,
      "T-INK Shirt",
      "Description"
    ));

    list.add(InventoryItem(
      "TABLEWARE1",
      InventoryType.tableware,
      "T-INK Coffee Cup",
      "Description"
    ));

    list.add(InventoryItem(
      "GAME1",
      InventoryType.game,
      "T-INK Cards",
      "T-INK Playing cards that are kind of like the game War. Whoever has more power can take that amount of power away from their opponent's card. It is like a battle."
    ));
    
    list.add(InventoryItem(
      "VIDEO1",
      InventoryType.video,
      "Ice Skating Video",
      "Description"
    ));

    return list;
  }
}