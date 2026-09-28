import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'AirPods Pro',
      'image': 'assets/products/airpods.jpg',
      'price': 199.0,
      'oldPrice': 249.0,
      'discount': '-20%',
    },
    {
      'name': 'Smart Watch',
      'image': 'assets/products/smart_watch.jpg',
      'price': 89.0,
      'oldPrice': 120.0,
      'discount': '-26%',
    },
    {
      'name': 'Nike Air Max',
      'image': 'assets/products/sneakers.jpg',
      'price': 129.0,
      'oldPrice': 160.0,
      'discount': '-19%',
    },
    {
      'name': 'Black Hoodie',
      'image': 'assets/products/hoodie.jpg',
      'price': 45.0,
      'oldPrice': 60.0,
      'discount': '-25%',
    },
    {
      'name': 'Urban Backpack',
      'image': 'assets/products/backpack.jpg',
      'price': 55.0,
      'oldPrice': 75.0,
      'discount': '-27%',
    },
    {
      'name': 'Classic Sunglasses',
      'image': 'assets/products/sunglasses.jpg',
      'price': 39.0,
      'oldPrice': 50.0,
      'discount': '-22%',
    },
    {
      'name': 'Digital Camera',
      'image': 'assets/products/camera.jpg',
      'price': 320.0,
      'oldPrice': 390.0,
      'discount': '-18%',
    },
    {
      'name': 'Wireless Headphones',
      'image': 'assets/products/headphones.jpg',
      'price': 75.0,
      'oldPrice': 95.0,
      'discount': '-21%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),

            SliverToBoxAdapter(
              child: _buildSaleBanner(),
            ),

            SliverToBoxAdapter(
              child: _buildCategories(),
            ),

            SliverToBoxAdapter(
              child: _buildSectionHeader(),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildProductCard(products[index]);
                  },
                  childCount: products.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.72,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Row(
        children: [
          Container(
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Find your style',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Stack(
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xffE85D4A),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaleBanner() {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffDDE9FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SUMMER SALE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Up to 40% OFF',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'On selected products',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.shopping_bag_rounded,
            size: 72,
            color: Color(0xff263A63),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {
        'icon': Icons.devices_rounded,
        'name': 'Tech',
      },
      {
        'icon': Icons.checkroom_rounded,
        'name': 'Fashion',
      },
      {
        'icon': Icons.directions_run_rounded,
        'name': 'Sports',
      },
      {
        'icon': Icons.watch_rounded,
        'name': 'Accessories',
      },
    ];

    return SizedBox(
      // Increased from 112 to 125 to prevent bottom overflow.
      height: 125,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(
          16,
          20,
          16,
          12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Container(
            width: 75,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  category['name'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(
        18,
        5,
        18,
        14,
      ),
      child: Row(
        children: [
          Text(
            'Flash Sale',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),

          Text(
            'View all',
            style: TextStyle(
              color: Color(0xff566C9B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    Map<String, dynamic> product,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  left: 7,
                  top: 7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      product['discount'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Positioned(
                  right: 7,
                  top: 7,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 7),

          Text(
            product['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Text(
                '\$${product['price']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(width: 6),

              Text(
                '\$${product['oldPrice']}',
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 11,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
