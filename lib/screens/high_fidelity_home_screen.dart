import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityHomeScreen extends StatefulWidget {
  const HighFidelityHomeScreen({super.key});

  @override
  State<HighFidelityHomeScreen> createState() => _HighFidelityHomeScreenState();
}

class _HighFidelityHomeScreenState extends State<HighFidelityHomeScreen> {
  int _selectedCategoryIndex = 0;
  int _bottomNavIndex = 0;
  final List<String> _categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Map<String, dynamic>> _products = [
    {
      "image": "assets/images/I216_192_417_715.png",
      "name": "Caffe Mocha",
      "description": "Deep Foam",
      "price": "4.53",
      "rating": "4.8"
    },
    {
      "image": "assets/images/I216_208_417_717.png",
      "name": "Flat White",
      "description": "Espresso",
      "price": "3.53",
      "rating": "4.8"
    },
    {
      "image": "assets/images/I216_240_417_716.png",
      "name": "Mocha Fusi",
      "description": "Ice/Hot",
      "price": "7.53",
      "rating": "4.8"
    },
    {
      "image": "assets/images/I216_224_417_718.png",
      "name": "Caffe Panna",
      "description": "Ice/Hot",
      "price": "5.53",
      "rating": "4.8"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverBody(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 280.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: false,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildHeader(),
        collapseMode: CollapseMode.pin,
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 44.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF111111), Color(0xFF313131)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationAndProfile(),
            const SizedBox(height: 24),
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationAndProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: GoogleFonts.sora(
                  color: const Color(0xFFA2A2A2), fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Bilzen, Tanjungbalai",
                  style: GoogleFonts.sora(
                      color: const Color(0xFFDDDDDD),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down,
                    color: Color(0xFFDDDDDD), size: 20),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.push('/profile'),
          child: const CircleAvatar(
            radius: 22,
            backgroundImage:
                AssetImage('assets/images/I216_106_417_719.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: GoogleFonts.sora(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: "Search coffee",
              hintStyle: GoogleFonts.sora(color: const Color(0xFFA2A2A2)),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF313131),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/216_258.png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.0)
                ],
                begin: Alignment.centerLeft,
                end: const Alignment(0.8, 0),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFED5151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Promo",
                    style: GoogleFonts.sora(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Buy one get\none FREE",
                  style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      height: 1.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSliverBody() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          children: [
            _buildCategoryTabs(),
            const SizedBox(height: 24),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategoryIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFC67C4E)
                      : const Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _categories[index],
                  style: GoogleFonts.sora(
                    color: isSelected ? Colors.white : const Color(0xFF2F4B4E),
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_products[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        context.push('/detail_item');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    product['image'],
                    height: 132,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFBBE21), size: 14),
                        const SizedBox(width: 4),
                        Text(
                          product['rating'],
                          style: GoogleFonts.sora(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2F2D2C)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          product['description'],
                          style: GoogleFonts.sora(
                              fontSize: 12, color: const Color(0xFF9B9B9B)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${product['price']}',
                          style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2F4B4E)),
                        ),
                        InkWell(
                          onTap: () {
                            context.push('/order');
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC67C4E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.favorite, 1),
          _buildNavItem(Icons.shopping_bag, 2),
          _buildNavItem(Icons.notifications, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _bottomNavIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _bottomNavIndex = index;
        });
        if (index == 1) context.push('/favorites');
        if (index == 2) context.push('/order');
        if (index == 3) context.push('/notifications');
      },
      borderRadius: BorderRadius.circular(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF8D8D8D),
            size: 28,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFC67C4E),
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}