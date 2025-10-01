import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../widgets/menu_item_card.dart';
import '../../widgets/cart_bottom_bar.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final items = restaurant.menu;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 900 ? 3 : (width >= 600 ? 3 : 2);

    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: Column(
        children: [
          if (restaurant.imageUrl.isNotEmpty)
            SizedBox(height: 200, width: double.infinity, child: Image.network(restaurant.imageUrl, fit: BoxFit.cover, errorBuilder: (_,__,___)=> Container(color: Colors.grey[200]))),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [Expanded(child: Text('Menu', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))), Text('${items.length} items', style: const TextStyle(color: Colors.grey))]),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.72),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return MenuItemCard(
                  item: item,
                  onAdd: () {
                    context.read<CartBloc>().add(CartAddItem(item));
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added ${item.name}'), duration: const Duration(milliseconds: 800)));
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
