import 'package:coffee_app/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _selectedNavIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All Coffee',
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White',
    'Mocha',
  ];

  final List<Map<String, String>> _coffeeItems = [
    {
      'name': 'Artisan Cappuccino',
      'category': 'Cappuccino',
      'ingredients': 'With Oat Milk & Cinnamon',
      'price': '4.20',
      'rating': '4.9',
      'image': 'assets/images/1.jpg',
    },
    {
      'name': 'Double Espresso',
      'category': 'Espresso',
      'ingredients': 'Single Origin Ethiopian Beans',
      'price': '3.50',
      'rating': '4.8',
      'image': 'assets/images/2.jpg',
    },
    {
      'name': 'Velvet Caramel Latte',
      'category': 'Latte',
      'ingredients': 'With Steamed Almond Milk',
      'price': '5.10',
      'rating': '4.9',
      'image': 'assets/images/3.jpg',
    },
    {
      'name': 'Classic Flat White',
      'category': 'Flat White',
      'ingredients': 'With Micro-Foam Whole Milk',
      'price': '4.60',
      'rating': '4.7',
      'image': 'assets/images/4.jpg',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddedSnackbar(String coffeeName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Color(0xFFD17842), size: 20),
            const SizedBox(width: 10),
            Text(
              'Added $coffeeName to cart',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF141921),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _coffeeItems.where((item) {
      final matchesSearch =
          item['name']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              item['ingredients']!
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase());
      if (!matchesSearch) return false;

      if (_selectedCategoryIndex == 0) return true;
      return item['category'] == _categories[_selectedCategoryIndex];
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF141921),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
            child: const Icon(Icons.apps_rounded,
                size: 20, color: Color(0xFFD17842)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF141921),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
              child: const Icon(Icons.person_outline_rounded,
                  size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0C0F14),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedNavIndex,
            onTap: (idx) => setState(() => _selectedNavIndex = idx),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_rounded),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: 'Alerts'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Text(
                'Find the best\ncoffee for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                  height: 1.05,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF141921),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search roasts, blends, milk types...',
                    hintStyle: TextStyle(
                      color: Colors.white.withValues(alpha: 0.35),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFFD17842),
                      size: 22,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close_rounded,
                                size: 18, color: Colors.white70),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),

            // Category Bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _selectedCategoryIndex = index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _categories[index],
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFFD17842)
                                  : Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: isSelected ? 8 : 0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD17842),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Horizontal Coffee Cards
            SizedBox(
              height: 290,
              child: filteredItems.isEmpty
                  ? Center(
                      child: Text(
                        'No coffees found in this category',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 14,
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 20),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return CoffeeTile(
                          coffeeName: item['name']!,
                          coffeeIngredients: item['ingredients']!,
                          coffeePrice: item['price']!,
                          rating: item['rating']!,
                          imagePath: item['image']!,
                          onAddTap: () => _showAddedSnackbar(item['name']!),
                        );
                      },
                    ),
            ),

            // Special Editorial Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text(
                'Special For You',
                style: GoogleFonts.bebasNeue(
                  fontSize: 28,
                  letterSpacing: 1.1,
                  color: Colors.white,
                ),
              ),
            ),

            // Special For You Hero Card
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF141921),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/5.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5 Rare Single-Origin Beans You Must Brew',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFD17842).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Curated',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD17842),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'by Mayank Batra',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
