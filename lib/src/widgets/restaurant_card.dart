import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String rating;
  final String deliveryTime;
  final String distanceKm;
  final String avgCostForTwo;
  final String imageUrl;
  final VoidCallback? onTap;
  final double height;

  const RestaurantCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.distanceKm,
    required this.avgCostForTwo,
    required this.imageUrl,
    this.onTap,
    this.height = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = 12.0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height,
          child: Row(
            children: [
              // Left: Image (50%)
              Expanded(flex: 1, child: _buildImage()),

              // Right: Details (50%)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Name
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 6),

                      // Rating • Delivery time
                      Row(
                        children: [
                          _smallIconText(Icons.star, rating),
                          const SizedBox(width: 8),
                          _dotSeparator(),
                          const SizedBox(width: 8),
                          _smallIconText(Icons.schedule, deliveryTime),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Distance • Avg cost
                      Row(
                        children: [
                          _smallIconText(Icons.location_on, '$distanceKm km'),
                          const SizedBox(width: 12),
                          _dotSeparator(),
                          const SizedBox(width: 12),
                          _smallIconText(Icons.attach_money, avgCostForTwo),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      color: Colors.grey.shade200,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.fastfood, size: 36, color: Colors.grey),
          );
        },
      ),
    );
  }

  Widget _smallIconText(IconData icon, Object text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget _dotSeparator() {
    return const SizedBox(
      width: 6,
      height: 6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
      ),
    );
  }
}
