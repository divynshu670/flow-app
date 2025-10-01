import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/offer_card.dart';
import '../../widgets/restaurant_card.dart';
import '../../screens/restaurant/restaurant_detail_screen.dart';

final List<Map<String, dynamic>> _rawRestaurants = [
  {
    'id': 'rest_001',
    'name': 'Truffles Bistro',
    'rating': '4.6',
    'delivery_time': '25-35 mins',
    'distance_km': '2.1',
    'avg_cost_for_two': '700',
    'image_url':
        'https://images.pexels.com/photos/1639563/pexels-photo-1639563.jpeg',
    'menu': [
      {
        'id': 't1',
        'name': 'Classic Cheeseburger',
        'price': 249,
        'description': 'Beef patty, cheddar, lettuce, tomato, house sauce',
        'image_url':
            'https://images.pexels.com/photos/1639563/pexels-photo-1639563.jpeg',
      },
      {
        'id': 't2',
        'name': 'Truffle Fries',
        'price': 139,
        'description': 'Crispy fries, truffle oil, parmesan',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 't3',
        'name': 'Grilled Chicken Sandwich',
        'price': 229,
        'description': 'Marinated chicken, aioli, pickles, brioche',
        'image_url':
            'https://images.pexels.com/photos/2232/vegetables-italian-pizza-restaurant.jpg',
      },
      {
        'id': 't4',
        'name': 'Caesar Salad',
        'price': 179,
        'description': 'Romaine, parmesan, croutons, Caesar dressing',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 't5',
        'name': 'BBQ Pulled Pork Wrap',
        'price': 209,
        'description': 'Slow-cooked pork, slaw, BBQ sauce',
        'image_url':
            'https://images.pexels.com/photos/551997/pexels-photo-551997.jpeg',
      },
      {
        'id': 't6',
        'name': 'Mushroom Risotto',
        'price': 269,
        'description': 'Creamy arborio rice, mixed mushrooms, herbs',
        'image_url':
            'https://images.pexels.com/photos/551996/pexels-photo-551996.jpeg',
      },
      {
        'id': 't7',
        'name': 'Sizzling Pepper Steak',
        'price': 349,
        'description': 'Peppercorn sauce, seasonal veggies',
        'image_url':
            'https://images.pexels.com/photos/675951/pexels-photo-675951.jpeg',
      },
      {
        'id': 't8',
        'name': 'Veggie Quesadilla',
        'price': 159,
        'description': 'Bell peppers, corn, cheese, salsa',
        'image_url':
            'https://images.pexels.com/photos/1435894/pexels-photo-1435894.jpeg',
      },
      {
        'id': 't9',
        'name': 'Chocolate Lava Cake',
        'price': 129,
        'description': 'Warm molten centre, vanilla cream',
        'image_url':
            'https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg',
      },
      {
        'id': 't10',
        'name': 'Iced Coffee',
        'price': 99,
        'description': 'Cold brew, milk, light sweetness',
        'image_url':
            'https://images.pexels.com/photos/197485/pexels-photo-197485.jpeg',
      },
      {
        'id': 't11',
        'name': 'Prawn Linguine',
        'price': 319,
        'description': 'Garlic butter, lemon, parsley',
        'image_url':
            'https://images.pexels.com/photos/46239/salmon-dish-cuisine-restaurant-46239.jpeg',
      },
      {
        'id': 't12',
        'name': 'Margherita Pizza',
        'price': 249,
        'description': 'Fresh basil, tomato sauce, mozzarella',
        'image_url':
            'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      },
    ],
  },

  {
    'id': 'rest_002',
    'name': 'Spice Junction',
    'rating': '4.4',
    'delivery_time': '30-40 mins',
    'distance_km': '4.3',
    'avg_cost_for_two': '550',
    'image_url':
        'https://images.pexels.com/photos/551997/pexels-photo-551997.jpeg',

    'menu': [
      {
        'id': 's1',
        'name': 'Butter Chicken',
        'price': 249,
        'description': 'Creamy tomato gravy, tender chicken',
        'image_url':
            'https://images.pexels.com/photos/128422/pexels-photo-128422.jpeg',
      },
      {
        'id': 's2',
        'name': 'Paneer Tikka Masala',
        'price': 219,
        'description': 'Charred paneer cubes, rich masala',
        'image_url':
            'https://images.pexels.com/photos/1006972/pexels-photo-1006972.jpeg',
      },
      {
        'id': 's3',
        'name': 'Garlic Naan',
        'price': 49,
        'description': 'Stone-baked flatbread with garlic butter',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 's4',
        'name': 'Hyderabadi Chicken Biryani',
        'price': 279,
        'description': 'Long-grain rice, saffron, marinated chicken',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 's5',
        'name': 'Chole Bhature',
        'price': 159,
        'description': 'Spiced chickpeas with puffed bhature',
        'image_url':
            'https://images.pexels.com/photos/297933/pexels-photo-297933.jpeg',
      },
      {
        'id': 's6',
        'name': 'Tandoori Platter',
        'price': 349,
        'description': 'Assorted tandoori starters',
        'image_url':
            'https://images.pexels.com/photos/1003645/pexels-photo-1003645.jpeg',
      },
      {
        'id': 's7',
        'name': 'Lemon Rice',
        'price': 139,
        'description': 'South-Indian style seasoned rice',
        'image_url':
            'https://images.pexels.com/photos/1435905/pexels-photo-1435905.jpeg',
      },
      {
        'id': 's8',
        'name': 'Masala Dosa',
        'price': 129,
        'description': 'Crispy dosa with potato masala',
        'image_url':
            'https://images.pexels.com/photos/1111311/pexels-photo-1111311.jpeg',
      },
      {
        'id': 's9',
        'name': 'Gulab Jamun (2 pcs)',
        'price': 89,
        'description': 'Classic syrup-soaked dessert',
        'image_url':
            'https://images.pexels.com/photos/302680/pexels-photo-302680.jpeg',
      },
      {
        'id': 's10',
        'name': 'Mutton Rogan Josh',
        'price': 379,
        'description': 'Rich Kashmiri-style mutton curry',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 's11',
        'name': 'Raita',
        'price': 59,
        'description': 'Cooling yogurt with cucumber',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 's12',
        'name': 'Masala Chai',
        'price': 49,
        'description': 'Spiced Indian tea',
        'image_url':
            'https://images.pexels.com/photos/302902/pexels-photo-302902.jpeg',
      },
    ],
  },

  {
    'id': 'rest_003',
    'name': 'Urban Eats Cafe',
    'rating': '4.5',
    'delivery_time': '20-30 mins',
    'distance_km': '1.7',
    'avg_cost_for_two': '500',
    'image_url':
        'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
    'menu': [
      {
        'id': 'u1',
        'name': 'Avocado Toast',
        'price': 199,
        'description': 'Multigrain bread, smashed avocado, chili flakes',
        'image_url':
            'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
      },
      {
        'id': 'u2',
        'name': 'Eggs Benedict',
        'price': 249,
        'description': 'Poached eggs, hollandaise, English muffin',
        'image_url':
            'https://images.pexels.com/photos/782233/pexels-photo-782233.jpeg',
      },
      {
        'id': 'u3',
        'name': 'Club Sandwich',
        'price': 219,
        'description': 'Triple-layer sandwich with fries',
        'image_url':
            'https://images.pexels.com/photos/160071/pexels-photo-160071.jpeg',
      },
      {
        'id': 'u4',
        'name': 'Quinoa Salad',
        'price': 179,
        'description': 'Quinoa, roasted veggies, citrus dressing',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 'u5',
        'name': 'Pepperoni Pizza',
        'price': 299,
        'description': 'Thin crust, spicy pepperoni',
        'image_url':
            'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      },
      {
        'id': 'u6',
        'name': 'Buttermilk Pancakes',
        'price': 189,
        'description': 'Stack of pancakes, maple syrup',
        'image_url':
            'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
      },
      {
        'id': 'u7',
        'name': 'BBQ Wings (6 pcs)',
        'price': 239,
        'description': 'Smoky glaze, served with dip',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'u8',
        'name': 'Falafel Wrap',
        'price': 159,
        'description': 'Crispy falafel, tahini, salad',
        'image_url':
            'https://images.pexels.com/photos/1435894/pexels-photo-1435894.jpeg',
      },
      {
        'id': 'u9',
        'name': 'Pumpkin Soup',
        'price': 129,
        'description': 'Creamy seasonal soup',
        'image_url':
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
      },
      {
        'id': 'u10',
        'name': 'Iced Matcha Latte',
        'price': 149,
        'description': 'Premium matcha, milk, light sweetness',
        'image_url':
            'https://images.pexels.com/photos/302902/pexels-photo-302902.jpeg',
      },
      {
        'id': 'u11',
        'name': 'Grilled Salmon Bowl',
        'price': 349,
        'description': 'Rice, greens, teriyaki glaze',
        'image_url':
            'https://images.pexels.com/photos/46239/salmon-dish-cuisine-restaurant-46239.jpeg',
      },
      {
        'id': 'u12',
        'name': 'Chocolate Brownie',
        'price': 119,
        'description': 'Walnut brownie with scoop of ice cream',
        'image_url':
            'https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg',
      },
    ],
  },

  {
    'id': 'rest_004',
    'name': 'Bella Pizza Co.',
    'rating': '4.3',
    'delivery_time': '30-45 mins',
    'distance_km': '5.6',
    'avg_cost_for_two': '650',
    'image_url':
        'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
    'menu': [
      {
        'id': 'b1',
        'name': 'Pepperoni Feast Pizza',
        'price': 399,
        'description': 'Loaded with pepperoni slices',
        'image_url':
            'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      },
      {
        'id': 'b2',
        'name': 'Veggie Delight Pizza',
        'price': 349,
        'description': 'Bell peppers, olives, mushrooms, onions',
        'image_url':
            'https://images.pexels.com/photos/1435894/pexels-photo-1435894.jpeg',
      },
      {
        'id': 'b3',
        'name': 'BBQ Chicken Pizza',
        'price': 429,
        'description': 'BBQ base, smoked chicken, onions',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 'b4',
        'name': 'Garlic Breadsticks',
        'price': 119,
        'description': 'Buttery sticks with herb dip',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'b5',
        'name': 'Marinara Pasta',
        'price': 199,
        'description': 'Tomato basil pasta',
        'image_url':
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
      },
      {
        'id': 'b6',
        'name': 'Four Cheese Pizza',
        'price': 449,
        'description': 'Mozzarella, cheddar, parmesan, blue cheese',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 'b7',
        'name': 'Chicken Wings (8 pcs)',
        'price': 219,
        'description': 'Crispy wings with hot sauce',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'b8',
        'name': 'Greek Salad',
        'price': 159,
        'description': 'Feta, olives, cucumber, tomato',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 'b9',
        'name': 'Tiramisu',
        'price': 159,
        'description': 'Classic Italian dessert',
        'image_url':
            'https://images.pexels.com/photos/302680/pexels-photo-302680.jpeg',
      },
      {
        'id': 'b10',
        'name': 'Veggie Calzone',
        'price': 249,
        'description': 'Folded pizza with mixed veggies',
        'image_url':
            'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      },
      {
        'id': 'b11',
        'name': 'Spicy Paneer Pizza',
        'price': 329,
        'description': 'Paneer, spicy sauce, peppers',
        'image_url':
            'https://images.pexels.com/photos/1006972/pexels-photo-1006972.jpeg',
      },
      {
        'id': 'b12',
        'name': 'Soft Drink (500ml)',
        'price': 79,
        'description': 'Choice of cola or lemonade',
        'image_url':
            'https://images.pexels.com/photos/302902/pexels-photo-302902.jpeg',
      },
    ],
  },

  {
    'id': 'rest_005',
    'name': 'Kebab House',
    'rating': '4.7',
    'delivery_time': '35-50 mins',
    'distance_km': '6.8',
    'avg_cost_for_two': '800',
    'image_url':
        'https://images.pexels.com/photos/551997/pexels-photo-551997.jpeg',

    'menu': [
      {
        'id': 'k1',
        'name': 'Seekh Kebab (4 pcs)',
        'price': 289,
        'description': 'Minced meat skewers, aromatic spices',
        'image_url':
            'https://images.pexels.com/photos/551997/pexels-photo-551997.jpeg',
      },
      {
        'id': 'k2',
        'name': 'Chicken Shawarma Roll',
        'price': 199,
        'description': 'Loaded chicken shawarma, garlic sauce',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'k3',
        'name': 'Chicken Tikka',
        'price': 249,
        'description': 'Char-grilled tikka pieces',
        'image_url':
            'https://images.pexels.com/photos/1006972/pexels-photo-1006972.jpeg',
      },
      {
        'id': 'k4',
        'name': 'Mutton Biryani',
        'price': 379,
        'description': 'Fragrant biryani with slow-cooked mutton',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'k5',
        'name': 'Hummus & Pita',
        'price': 149,
        'description': 'Creamy hummus, warm pita',
        'image_url':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      },
      {
        'id': 'k6',
        'name': 'Mixed Grill Platter',
        'price': 599,
        'description': 'Assortment of kebabs and sides',
        'image_url':
            'https://images.pexels.com/photos/1003645/pexels-photo-1003645.jpeg',
      },
      {
        'id': 'k7',
        'name': 'Falooda',
        'price': 129,
        'description': 'Rose syrup, vermicelli, kulfi',
        'image_url':
            'https://images.pexels.com/photos/302680/pexels-photo-302680.jpeg',
      },
      {
        'id': 'k8',
        'name': 'Rogan Josh',
        'price': 359,
        'description': 'Rich mutton curry, Kashmiri spices',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'k9',
        'name': 'Keema Naan',
        'price': 149,
        'description': 'Stuffed naan with spiced mince',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'k10',
        'name': 'Veg Samosa (2 pcs)',
        'price': 79,
        'description': 'Crispy pastry, spiced potato filling',
        'image_url':
            'https://images.pexels.com/photos/302680/pexels-photo-302680.jpeg',
      },
      {
        'id': 'k11',
        'name': 'Mint Chutney',
        'price': 39,
        'description': 'Refreshing dip',
        'image_url':
            'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      },
      {
        'id': 'k12',
        'name': 'Mango Lassi',
        'price': 99,
        'description': 'Sweet yogurt drink',
        'image_url':
            'https://images.pexels.com/photos/302902/pexels-photo-302902.jpeg',
      },
    ],
  },
];

final restaurants = _rawRestaurants.map((m) => Restaurant.fromMap(m)).toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final offers = [
    {
      'title': 'Pizza Hut',
      'subtitle': 'Get ₹200 off',
      'asset': "assets/image/PizzaHut.png",
    },
    {
      'title': 'Domino\'s',
      'subtitle': 'Buy 1 Get 1',
      'asset': 'assets/image/Dominos.png',
    },
    {
      'title': 'Subway',
      'subtitle': 'Free Coke',
      'asset': 'assets/image/Subway.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_pageController.hasClients && offers.isNotEmpty) {
        final next = (_currentPage + 1) % offers.length;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 20.0;
    final activeDotColor = Theme.of(context).colorScheme.primary;
    final inactiveDotColor = Colors.grey.shade300;

    return Scaffold(
      // removed AppBar to match the former layout — header is inside body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 20,
          ),
          child: Column(
            children: [
              // Header (like former screen)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_pin, size: 20),
                          SizedBox(width: 4),
                          Text(
                            "Divyanshu",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 200,
                        child: const Text(
                          'Deliver to: Sector 44, Gurugram',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person, size: 24),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Offer slider
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final o = offers[index];
                    return OfferCard(
                      title: o['title']!,
                      subtitle: o['subtitle']!,
                      assetImage: o['asset']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Dots indicator (former style)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  offers.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? activeDotColor
                          : inactiveDotColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Restaurants title + filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Restaurants',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Restaurants list (unchanged logic)
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: restaurants.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final r = restaurants[i];
                    return RestaurantCard(
                      name: r.name,
                      rating: r.rating,
                      deliveryTime: r.deliveryTime,
                      distanceKm: r.distanceKm,
                      avgCostForTwo: r.avgCostForTwo,
                      imageUrl: r.imageUrl,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                RestaurantDetailScreen(restaurant: r),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
