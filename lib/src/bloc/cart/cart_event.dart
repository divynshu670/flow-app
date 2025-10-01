import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class CartAddItem extends CartEvent {
  final MenuItem item;
  const CartAddItem(this.item);
  @override
  List<Object?> get props => [item];
}

class CartDecrementItem extends CartEvent {
  final MenuItem item;
  const CartDecrementItem(this.item);
  @override
  List<Object?> get props => [item];
}

class CartRemoveItem extends CartEvent {
  final MenuItem item;
  const CartRemoveItem(this.item);
  @override
  List<Object?> get props => [item];
}

class CartClear extends CartEvent {
  const CartClear();
}
