import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc({required this.repository}) : super(CartState.initial()) {
    on<CartAddItem>(_onAdd);
    on<CartDecrementItem>(_onDecrement);
    on<CartRemoveItem>(_onRemove);
    on<CartClear>(_onClear);
  }

  void _onAdd(CartAddItem event, Emitter<CartState> emit) {
    try {
      repository.addItem(event.item);
      emit(CartState(items: Map.from(repository.items)));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to add item'));
    }
  }

  void _onDecrement(CartDecrementItem event, Emitter<CartState> emit) {
    try {
      repository.decrementItem(event.item);
      emit(CartState(items: Map.from(repository.items)));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to decrement item'));
    }
  }

  void _onRemove(CartRemoveItem event, Emitter<CartState> emit) {
    try {
      repository.removeItem(event.item);
      emit(CartState(items: Map.from(repository.items)));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to remove item'));
    }
  }

  void _onClear(CartClear event, Emitter<CartState> emit) {
    repository.clear();
    emit(CartState(items: Map.from(repository.items)));
  }
}
