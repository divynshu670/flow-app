import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_state.dart';
import '../screens/order/order_page.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      final show = state.totalCount > 0;
      return AnimatedContainer(duration: const Duration(milliseconds: 200), height: show ? 72 : 0, child: show ? GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrderPage())), child: Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [const Icon(Icons.shopping_bag_outlined), const SizedBox(width: 8), Text('${state.totalCount} items')]),
        Row(children: [Text('₹${state.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(width: 12), const Icon(Icons.arrow_forward_ios, size: 16)])
      ]))) : const SizedBox.shrink());
    });
  }
}
