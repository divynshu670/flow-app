import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/cart/cart_event.dart';
import '../payment/payment_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Order'), actions: [
        IconButton(onPressed: () => context.read<CartBloc>().add(const CartClear()), icon: const Icon(Icons.delete_outline))
      ]),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        final items = state.items.values.toList();
        if (items.isEmpty) return const Center(child: Text('Your cart is empty'));
        return Column(children: [
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final ci = items[i];
                return ListTile(
                  leading: SizedBox(width: 64, height: 64, child: Image.network(ci.item.imageUrl, fit: BoxFit.cover, errorBuilder: (_,__,___)=> Container(color: Colors.grey[200]))),
                  title: Text(ci.item.name),
                  subtitle: Text('₹${ci.item.price} • ${ci.quantity} x'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(onPressed: () => context.read<CartBloc>().add(CartDecrementItem(ci.item)), icon: const Icon(Icons.remove_circle_outline)),
                    Text('${ci.quantity}'),
                    IconButton(onPressed: () => context.read<CartBloc>().add(CartAddItem(ci.item)), icon: const Icon(Icons.add_circle_outline)),
                  ]),
                );
              },
            ),
          ),
          Padding(padding: const EdgeInsets.all(16.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total (${state.totalCount} items)'), Text('₹${state.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold))])),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12), child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentPage())), child: SizedBox(width: double.infinity, child: Center(child: Text('Proceed to Checkout'))))),
        ]);
      }),
    );
  }
}
