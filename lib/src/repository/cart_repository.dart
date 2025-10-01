import '../models/models.dart';

class CartItem {
  final MenuItem item;
  final int quantity;

  CartItem({required this.item, required this.quantity});

  CartItem copyWith({MenuItem? item, int? quantity}) {
    return CartItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }

  int get totalPrice => item.price * quantity;
}

class CartRepository {
  // in-memory backing store
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => Map.unmodifiable(_items);

  void addItem(MenuItem menuItem) {
    final existing = _items[menuItem.id];
    if (existing != null) {
      _items[menuItem.id] = existing.copyWith(quantity: existing.quantity + 1);
    } else {
      _items[menuItem.id] = CartItem(item: menuItem, quantity: 1);
    }
  }

  void decrementItem(MenuItem menuItem) {
    final existing = _items[menuItem.id];
    if (existing == null) return;
    if (existing.quantity > 1) {
      _items[menuItem.id] = existing.copyWith(quantity: existing.quantity - 1);
    } else {
      _items.remove(menuItem.id);
    }
  }

  void removeItem(MenuItem menuItem) {
    _items.remove(menuItem.id);
  }

  void clear() {
    _items.clear();
  }

  int get totalCount => _items.values.fold(0, (prev, e) => prev + e.quantity);

  double get totalPrice =>
      _items.values.fold(0.0, (prev, e) => prev + e.totalPrice);
}
