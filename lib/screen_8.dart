import 'package:flutter/material.dart';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  final TextEditingController destinationController =
      TextEditingController();

  int selectedDestination = 0;
  int travelers = 2;
  bool booked = false;

  final Color backgroundColor = const Color(0xFFF3F7FA);
  final Color navy = const Color(0xFF102A43);
  final Color blue = const Color(0xFF2F80ED);
  final Color cyan = const Color(0xFF6EDFF6);
  final Color muted = const Color(0xFF8291A1);

  final List<Map<String, dynamic>> destinations = [
    {
      'name': 'Paris',
      'country': 'France',
      'price': '\$890',
      'image': 'assets/travel/paris.jpg',
    },
    {
      'name': 'Dubai',
      'country': 'UAE',
      'price': '\$640',
      'image': 'assets/travel/dubai.jpg',
    },
    {
      'name': 'Maldives',
      'country': 'Maldives',
      'price': '\$1,120',
      'image': 'assets/travel/maldives.jpg',
    },
    {
      'name': 'Istanbul',
      'country': 'Turkey',
      'price': '\$520',
      'image': 'assets/travel/istanbul.jpg',
    },
    {
      'name': 'Bali',
      'country': 'Indonesia',
      'price': '\$980',
      'image': 'assets/travel/bali.jpg',
    },
    {
      'name': 'Switzerland',
      'country': 'Switzerland',
      'price': '\$1,250',
      'image': 'assets/travel/switzerland.jpg',
    },
  ];

  @override
  void dispose() {
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            SliverToBoxAdapter(
              child: _buildSearch(),
            ),
            SliverToBoxAdapter(
              child: _buildHeroDestination(),
            ),
            SliverToBoxAdapter(
              child: _buildTripDetails(),
            ),
            SliverToBoxAdapter(
              child: _buildPopularHeader(),
            ),
            SliverToBoxAdapter(
              child: _buildPopularDestinations(),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 13),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GOOD MORNING',
                  style: TextStyle(
                    color: muted,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Explore the world',
                  style: TextStyle(
                    color: navy,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.8,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.flight_rounded,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE3EAF0),
          ),
        ),
        child: TextField(
          controller: destinationController,
          onChanged: (_) {
            setState(() {});
          },
          style: TextStyle(
            color: navy,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: 'Where do you want to go?',
            hintStyle: TextStyle(
              color: muted,
              fontSize: 12,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: blue,
              size: 21,
            ),
            suffixIcon: destinationController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      destinationController.clear();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: muted,
                      size: 18,
                    ),
                  )
                : Icon(
                    Icons.tune_rounded,
                    color: muted,
                    size: 18,
                  ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroDestination() {
    final destination = destinations[selectedDestination];

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      height: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(.12),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Image.asset(
              destination['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      navy.withOpacity(.08),
                      navy.withOpacity(.88),
                    ],
                    stops: const [
                      0,
                      .38,
                      1,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 13,
              left: 13,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.92),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: blue,
                      size: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'TOP PICK',
                      style: TextStyle(
                        color: navy,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 13,
              right: 13,
              child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.25),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination['country'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          destination['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.7,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Starting from ${destination['price']}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        booked = !booked;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            booked
                                ? 'Trip added to your plan'
                                : 'Trip removed from your plan',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: booked ? cyan : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        booked ? 'Added' : 'Plan trip',
                        style: TextStyle(
                          color: navy,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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

  Widget _buildTripDetails() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Plan your trip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.09),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Flexible',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _tripItem(
                  Icons.flight_takeoff_rounded,
                  'Departure',
                  '12 Oct',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _tripItem(
                  Icons.flight_land_rounded,
                  'Return',
                  '19 Oct',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      travelers = travelers >= 5 ? 1 : travelers + 1;
                    });
                  },
                  child: _tripItem(
                    Icons.person_outline_rounded,
                    'Travelers',
                    '$travelers people',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _tripItem(
                  Icons.airline_seat_recline_normal_rounded,
                  'Class',
                  'Economy',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tripItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.075),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            height: 29,
            width: 29,
            decoration: BoxDecoration(
              color: blue.withOpacity(.18),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: cyan,
              size: 15,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 8,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 11),
      child: Row(
        children: [
          Text(
            'Popular places',
            style: TextStyle(
              color: navy,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          Text(
            'Explore all',
            style: TextStyle(
              color: blue,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularDestinations() {
    final query = destinationController.text.trim().toLowerCase();

    final filtered = destinations.where((destination) {
      if (query.isEmpty) {
        return true;
      }

      return destination['name']
              .toString()
              .toLowerCase()
              .contains(query) ||
          destination['country']
              .toString()
              .toLowerCase()
              .contains(query);
    }).toList();

    if (filtered.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Center(
          child: Text(
            'No destination found',
            style: TextStyle(
              color: muted,
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 154,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: filtered.length,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 11);
        },
        itemBuilder: (context, index) {
          final destination = filtered[index];
          final originalIndex = destinations.indexOf(destination);
          final selected = originalIndex == selectedDestination;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDestination = originalIndex;
                booked = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 132,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: selected ? blue : Colors.transparent,
                  width: 1.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.035),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          destination['image'],
                          width: double.infinity,
                          height: 91,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            color: navy,
                            size: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    destination['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: navy,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: muted,
                        size: 10,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          destination['country'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: muted,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        destination['price'],
                        style: TextStyle(
                          color: blue,
                          fontSize: 8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
