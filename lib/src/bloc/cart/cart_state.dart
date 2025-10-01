import 'package:equatable/equatable.dart';
import '../../repository/cart_repository.dart';

class CartState extends Equatable {
  final Map<String, CartItem> items;
  final String? error;

  const CartState({required this.items, this.error});

  factory CartState.initial() => const CartState(items: {});

  CartState copyWith({Map<String, CartItem>? items, String? error}) {
    return CartState(items: items ?? this.items, error: error);
  }

  int get totalCount =>
      items.values.fold(0, (s, e) => s + e.quantity);

  double get totalPrice =>
      items.values.fold(0.0, (s, e) => s + e.totalPrice);

  @override
  List<Object?> get props => [items, error];
}
