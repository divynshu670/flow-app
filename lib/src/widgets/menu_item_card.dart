import 'package:flutter/material.dart';
import '../models/models.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback? onAdd;
  final VoidCallback? onTap;
  const MenuItemCard({super.key, required this.item, this.onAdd, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: item.imageUrl.isNotEmpty ? Image.network(item.imageUrl, fit: BoxFit.cover, errorBuilder: (_,__,___)=> Container(color: Colors.grey[200])) : Container(color: Colors.grey[200])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(item.description, style: TextStyle(fontSize: 12, color: Colors.grey[700]), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(child: Text('₹${item.price}', style: const TextStyle(fontWeight: FontWeight.bold))),
                  ElevatedButton.icon(onPressed: onAdd, icon: const Icon(Icons.add, size: 18), label: const Text('Add'), style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), minimumSize: const Size(64, 36))),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
