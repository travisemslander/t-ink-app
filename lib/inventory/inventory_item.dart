enum InventoryType { book, comic, apparel, tableware, food, audio, video, game }

class InventoryItem {
  final String name;
  final String description;
  final InventoryType type;
  final String itemId;

  InventoryItem(this.itemId, this.name, this.description, this.type) {
    // nothing to put here
  }
}
