enum InventoryType { book, comic, apparel, tableware, food, audio, video, game }

class InventoryItem {
  final String name;
  final String description;
  final InventoryType type;
  final String itemId;

  InventoryItem(this.itemId, this.type, this.name, this.description) {
    // nothing to put here
  }
}
