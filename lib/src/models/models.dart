class MenuItem {
  final String id;
  final String name;
  final int price; // rupees
  final String description;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['id'] as String,
      name: map['name'] as String,
      price: (map['price'] as num).toInt(),
      description: map['description'] as String,
      imageUrl: map['image_url'] as String? ?? '',
    );
  }
}

class Restaurant {
  final String id;
  final String name;
  final String rating;
  final String deliveryTime;
  final String distanceKm;
  final String avgCostForTwo;
  final String imageUrl;
  final List<MenuItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.distanceKm,
    required this.avgCostForTwo,
    required this.imageUrl,
    required this.menu,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    final menu = (map['menu'] as List<dynamic>)
        .map((e) => MenuItem.fromMap(Map<String, dynamic>.from(e)))
        .toList();
    return Restaurant(
      id: map['id'] as String,
      name: map['name'] as String,
      rating: map['rating'] as String,
      deliveryTime: map['delivery_time'] as String,
      distanceKm: map['distance_km'] as String,
      avgCostForTwo: map['avg_cost_for_two'] as String,
      imageUrl: map['image_url'] as String? ?? '',
      menu: menu,
    );
  }
}
