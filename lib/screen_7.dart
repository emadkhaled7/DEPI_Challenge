import 'package:flutter/material.dart';

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  final TextEditingController searchController = TextEditingController();

  String selectedType = 'All';

  final Color backgroundColor = const Color(0xFFF4F1EA);
  final Color primaryColor = const Color(0xFF20231F);
  final Color secondaryColor = const Color(0xFF73756F);
  final Color accentColor = const Color(0xFFD8A45D);

  final List<Map<String, dynamic>> properties = [
    {
      'name': 'Casa Verde',
      'location': 'New Cairo',
      'price': '\$420k',
      'type': 'Villa',
      'beds': '4',
      'baths': '3',
      'area': '280 m²',
      'image': 'assets/real_estate/villa_1.jpg',
    },
    {
      'name': 'The Urban',
      'location': 'Zamalek',
      'price': '\$185k',
      'type': 'Apartment',
      'beds': '2',
      'baths': '2',
      'area': '145 m²',
      'image': 'assets/real_estate/apartment_1.jpg',
    },
    {
      'name': 'Oak Residence',
      'location': 'Madinaty',
      'price': '\$310k',
      'type': 'Villa',
      'beds': '3',
      'baths': '3',
      'area': '240 m²',
      'image': 'assets/real_estate/villa_2.jpg',
    },
    {
      'name': 'Skyline 08',
      'location': 'New Cairo',
      'price': '\$220k',
      'type': 'Apartment',
      'beds': '3',
      'baths': '2',
      'area': '170 m²',
      'image': 'assets/real_estate/apartment_2.jpg',
    },
  ];

  final Set<String> favoriteProperties = {};

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredProperties {
    final query = searchController.text.trim().toLowerCase();

    return properties.where((property) {
      final matchesSearch =
          query.isEmpty ||
          property['name'].toString().toLowerCase().contains(query) ||
          property['location'].toString().toLowerCase().contains(query);

      final matchesType =
          selectedType == 'All' || property['type'] == selectedType;

      return matchesSearch && matchesType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchSection(),
            _buildLocationRow(),
            _buildTypeFilters(),
            Expanded(
              child: _buildPropertyList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'EXPLORE',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                const Text(
                  'Find your place',
                  style: TextStyle(
                    fontSize: 29,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _showFilterSheet,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.10),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Colors.black.withOpacity(.045),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: searchController,
          onChanged: (_) => setState(() {}),
          textInputAction: TextInputAction.search,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Search homes or locations',
            hintStyle: TextStyle(
              color: secondaryColor.withOpacity(.65),
              fontSize: 13,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: primaryColor,
              size: 21,
            ),
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      searchController.clear();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: secondaryColor,
                      size: 19,
                    ),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.location_on_outlined,
              color: primaryColor,
              size: 17,
            ),
          ),
          const SizedBox(width: 9),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CURRENT LOCATION',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .7,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'New Cairo, Egypt',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: secondaryColor,
          ),
          const Spacer(),
          Text(
            '${filteredProperties.length} properties',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeFilters() {
    const types = [
      'All',
      'Villa',
      'Apartment',
    ];

    return SizedBox(
      height: 62,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final type = types[index];
          final isSelected = selectedType == type;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedType = type;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 19),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected
                      ? primaryColor
                      : Colors.black.withOpacity(.035),
                ),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: isSelected ? Colors.white : secondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPropertyList() {
    final items = filteredProperties;

    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.search_off_rounded,
                  color: secondaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'No properties found',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Try another location or property type',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 28),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
        childAspectRatio: .70,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildPropertyCard(items[index]);
      },
    );
  }

  Widget _buildPropertyCard(Map<String, dynamic> property) {
    final propertyName = property['name'].toString();
    final isFavorite = favoriteProperties.contains(propertyName);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.045),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(19),
                  ),
                  child: Image.asset(
                    property['image'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(19),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.16),
                          Colors.transparent,
                          Colors.black.withOpacity(.12),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 9,
                  top: 9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.94),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      property['type'],
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 9,
                  top: 9,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isFavorite) {
                          favoriteProperties.remove(propertyName);
                        } else {
                          favoriteProperties.add(propertyName);
                        }
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.94),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavorite
                            ? const Color(0xFFD75C5C)
                            : primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propertyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: secondaryColor,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          property['location'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property['price'],
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      _compactInfo(
                        Icons.bed_outlined,
                        property['beds'],
                      ),
                      const SizedBox(width: 7),
                      _compactInfo(
                        Icons.bathtub_outlined,
                        property['baths'],
                      ),
                      const SizedBox(width: 7),
                      _compactInfo(
                        Icons.square_foot_rounded,
                        property['area'],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _compactInfo(
    IconData icon,
    String text,
  ) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 12,
            color: primaryColor.withOpacity(.7),
          ),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 25),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Filter properties',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Property type',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: ['All', 'Villa', 'Apartment'].map((type) {
                  final isSelected = selectedType == type;

                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedType = type;
                      });
                      Navigator.pop(context);
                    },
                    selectedColor: primaryColor,
                    backgroundColor: backgroundColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
