import 'package:flutter/material.dart';

class Screen13 extends StatefulWidget {
  const Screen13({super.key});

  @override
  State<Screen13> createState() => _Screen13State();
}

class _Screen13State extends State<Screen13> {
  int selectedAmenity = 0;

  final List<Map<String, String>> amenities = [
    {
      'name': 'Luxury Rooms',
      'image': 'assets/hotel/hotel_room.jpg',
    },
    {
      'name': 'Swimming Pool',
      'image': 'assets/hotel/hotel_pool.jpg',
    },
    {
      'name': 'Hotel Exterior',
      'image': 'assets/hotel/hotel_exterior.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF49352C),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'HOTEL PROFILE',
                    style: TextStyle(
                      fontFamily: 'Facebook',
                      color: Color(0xFF49352C),
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFF49352C),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/hotel/hotel_exterior.jpg',
                      width: double.infinity,
                      height: 235,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 235,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color(0xDD211713),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      right: 18,
                      bottom: 18,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'THE GRAND PALACE',
                                  style: TextStyle(
                                    fontFamily: 'Heylowitch',
                                    color: Colors.white,
                                    fontSize: 29,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Color(0xFFE2B08E),
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Hurghada, Egypt',
                                      style: TextStyle(
                                        fontFamily: 'Grindy',
                                        color: Colors.white70,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB47752),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    fontFamily: 'Facebook',
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
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
              const SizedBox(height: 20),
              const Text(
                'A relaxing stay by the Red Sea',
                style: TextStyle(
                  fontFamily: 'Facebook',
                  color: Color(0xFF49352C),
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Enjoy a peaceful luxury experience with comfortable rooms, beautiful views and premium hotel facilities.',
                style: TextStyle(
                  fontFamily: 'Grindy',
                  color: Color(0xFF887970),
                  fontSize: 11,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9D9CD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.king_bed_outlined,
                            color: Color(0xFF8A5C43),
                            size: 21,
                          ),
                          SizedBox(height: 6),
                          Text(
                            '120 Rooms',
                            style: TextStyle(
                              fontFamily: 'Facebook',
                              color: Color(0xFF49352C),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9D9CD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.waves_rounded,
                            color: Color(0xFF8A5C43),
                            size: 21,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Beach Access',
                            style: TextStyle(
                              fontFamily: 'Facebook',
                              color: Color(0xFF49352C),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9D9CD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.restaurant_outlined,
                            color: Color(0xFF8A5C43),
                            size: 21,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Restaurant',
                            style: TextStyle(
                              fontFamily: 'Facebook',
                              color: Color(0xFF49352C),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 23),
              const Text(
                'Hotel Amenities',
                style: TextStyle(
                  fontFamily: 'Facebook',
                  color: Color(0xFF49352C),
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: amenities.length,
                  itemBuilder: (context, index) {
                    final amenity = amenities[index];
                    final selected = selectedAmenity == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAmenity = index;
                        });
                      },
                      child: Container(
                        width: 145,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFFE7D2C2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: selected
                                ? const Color(0xFFAA7454)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset(
                                amenity['image']!,
                                width: double.infinity,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              amenity['name']!,
                              style: const TextStyle(
                                fontFamily: 'Facebook',
                                color: Color(0xFF49352C),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.wifi_rounded,
                          color: Color(0xFF9A6A4D),
                          size: 21,
                        ),
                        SizedBox(width: 11),
                        Text(
                          'Free Wi-Fi',
                          style: TextStyle(
                            fontFamily: 'Facebook',
                            color: Color(0xFF49352C),
                            fontSize: 11,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.check_rounded,
                          color: Color(0xFF9A6A4D),
                          size: 18,
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        Icon(
                          Icons.local_parking_outlined,
                          color: Color(0xFF9A6A4D),
                          size: 21,
                        ),
                        SizedBox(width: 11),
                        Text(
                          'Free Parking',
                          style: TextStyle(
                            fontFamily: 'Facebook',
                            color: Color(0xFF49352C),
                            fontSize: 11,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.check_rounded,
                          color: Color(0xFF9A6A4D),
                          size: 18,
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        Icon(
                          Icons.spa_outlined,
                          color: Color(0xFF9A6A4D),
                          size: 21,
                        ),
                        SizedBox(width: 11),
                        Text(
                          'Spa & Wellness',
                          style: TextStyle(
                            fontFamily: 'Facebook',
                            color: Color(0xFF49352C),
                            fontSize: 11,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.check_rounded,
                          color: Color(0xFF9A6A4D),
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFB47752),
                        Color(0xFF704936),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Text(
                      'View Rooms',
                      style: TextStyle(
                        fontFamily: 'Facebook',
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}