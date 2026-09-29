import 'package:flutter/material.dart';

class Screen15 extends StatefulWidget {
  const Screen15({super.key});

  @override
  State<Screen15> createState() => _Screen15State();
}

class _Screen15State extends State<Screen15> {
  int selectedCar = 0;

  final List<Map<String, String>> cars = [
    {
      'name': 'BMW',
      'model': 'BMW 5 Series',
      'image': 'assets/car/bmw.jpg',
      'price': '\$55',
      'type': 'Automatic',
      'seats': '5 Seats',
    },
    {
      'name': 'Mercedes',
      'model': 'Mercedes C-Class',
      'image': 'assets/car/mercedes.jpg',
      'price': '\$60',
      'type': 'Automatic',
      'seats': '5 Seats',
    },
    {
      'name': 'Toyota',
      'model': 'Toyota Camry',
      'image': 'assets/car/toyota.jpg',
      'price': '\$40',
      'type': 'Automatic',
      'seats': '5 Seats',
    },
    {
      'name': 'Range Rover',
      'model': 'Range Rover Sport',
      'image': 'assets/car/range_rover.jpg',
      'price': '\$90',
      'type': 'Automatic',
      'seats': '5 Seats',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F3),
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
                        Icons.menu_rounded,
                        color: Color(0xFF21473C),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'CAR RENTAL',
                    style: TextStyle(
                      fontFamily: 'Facebook',
                      color: Color(0xFF21473C),
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
                        Icons.person_outline_rounded,
                        color: Color(0xFF21473C),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Move with style',
                style: TextStyle(
                  fontFamily: 'Grindy',
                  color: Color(0xFF788A83),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Choose Your Ride',
                style: TextStyle(
                  fontFamily: 'Heylowitch',
                  color: Color(0xFF19362F),
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xFFE2EEE9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3E4DE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF315B50),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PICKUP LOCATION',
                          style: TextStyle(
                            fontFamily: 'Facebook',
                            color: Color(0xFF82918B),
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Cairo, Egypt',
                          style: TextStyle(
                            fontFamily: 'Facebook',
                            color: Color(0xFF19362F),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF71817B),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  const Text(
                    'Available Cars',
                    style: TextStyle(
                      fontFamily: 'Facebook',
                      color: Color(0xFF19362F),
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD5E6E0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${cars.length} Cars',
                      style: const TextStyle(
                        fontFamily: 'Facebook',
                        color: Color(0xFF315B50),
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...List.generate(
                cars.length,
                (index) {
                  final car = cars[index];
                  final selected = selectedCar == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCar = index;
                      });
                    },
                    child: Container(
                      height: 125,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        gradient: selected
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFFDCEBE5),
                                  Color(0xFFF9FBFA),
                                ],
                              )
                            : const LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFF4D806F)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 105,
                            height: 109,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFE5F0EC),
                                  Color(0xFFD0E0DA),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Image.asset(
                              car['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        car['name']!,
                                        style: const TextStyle(
                                          fontFamily: 'Heylowitch',
                                          color: Color(0xFF19362F),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      selected
                                          ? Icons.check_circle_rounded
                                          : Icons.circle_outlined,
                                      color: selected
                                          ? const Color(0xFF315B50)
                                          : Colors.black26,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  car['model']!,
                                  style: const TextStyle(
                                    fontFamily: 'Grindy',
                                    color: Color(0xFF7A8A84),
                                    fontSize: 8,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.settings_outlined,
                                      size: 12,
                                      color: Color(0xFF4D806F),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      car['type']!,
                                      style: const TextStyle(
                                        fontFamily: 'Grindy',
                                        color: Color(0xFF71817B),
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.event_seat_outlined,
                                      size: 12,
                                      color: Color(0xFF4D806F),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      car['seats']!,
                                      style: const TextStyle(
                                        fontFamily: 'Grindy',
                                        color: Color(0xFF71817B),
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      car['price']!,
                                      style: const TextStyle(
                                        fontFamily: 'Facebook',
                                        color: Color(0xFF315B50),
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Text(
                                      ' / day',
                                      style: TextStyle(
                                        fontFamily: 'Grindy',
                                        color: Color(0xFF7A8A84),
                                        fontSize: 8,
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
                  );
                },
              ),
              const SizedBox(height: 2),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3F7565),
                        Color(0xFF21473C),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Text(
                      'Rent ${cars[selectedCar]['name']}',
                      style: const TextStyle(
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