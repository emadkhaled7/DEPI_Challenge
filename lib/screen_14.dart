import 'package:flutter/material.dart';

class Screen14 extends StatefulWidget {
  const Screen14({super.key});

  @override
  State<Screen14> createState() => _Screen14State();
}

class _Screen14State extends State<Screen14> {
  int selectedEvent = 0;

  final List<Map<String, String>> events = [
    {
      'name': 'Live Music Night',
      'category': 'MUSIC',
      'image': 'assets/tickets/concert.jpg',
      'date': 'Oct 18 • 8:00 PM',
      'location': 'New York City',
      'price': '\$35',
    },
    {
      'name': 'Summer Music Festival',
      'category': 'FESTIVAL',
      'image': 'assets/tickets/festival.jpg',
      'date': 'Oct 22 • 6:00 PM',
      'location': 'Los Angeles, CA',
      'price': '\$50',
    },
    {
      'name': 'Comedy Night',
      'category': 'COMEDY',
      'image': 'assets/tickets/comedy.jpg',
      'date': 'Oct 25 • 9:00 PM',
      'location': 'Chicago, IL',
      'price': '\$25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
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
                        color: const Color(0xFFE4E8EE),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.menu_rounded,
                        color: Color(0xFF182638),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'EVENTS',
                    style: TextStyle(
                      fontFamily: 'Facebook',
                      color: Color(0xFF182638),
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
                        color: const Color(0xFFE4E8EE),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.confirmation_number_outlined,
                        color: Color(0xFF182638),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Find something to enjoy',
                style: TextStyle(
                  fontFamily: 'Grindy',
                  color: Color(0xFF778292),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Upcoming Events',
                style: TextStyle(
                  fontFamily: 'Heylowitch',
                  color: Color(0xFF182638),
                  fontSize: 31,
                ),
              ),
              const SizedBox(height: 17),
              Container(
                height: 51,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Color(0xFF7D8998),
                    ),
                    SizedBox(width: 9),
                    Text(
                      'Search events',
                      style: TextStyle(
                        fontFamily: 'Grindy',
                        color: Color(0xFFA4ACB6),
                        fontSize: 11,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.tune_rounded,
                      color: Color(0xFFC35A45),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              ...List.generate(
                events.length,
                (index) {
                  final event = events[index];
                  final selected = selectedEvent == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedEvent = index;
                      });
                    },
                    child: Container(
                      height: 125,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: selected
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFFF5E1DB),
                                  Color(0xFFFFFDFC),
                                ],
                              )
                            : const LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFFC35A45)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(
                              event['image']!,
                              width: 105,
                              height: 107,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 11),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0D8D2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        event['category']!,
                                        style: const TextStyle(
                                          fontFamily: 'Facebook',
                                          color: Color(0xFFA34836),
                                          fontSize: 7,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      event['price']!,
                                      style: const TextStyle(
                                        fontFamily: 'Facebook',
                                        color: Color(0xFFA34836),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  event['name']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Heylowitch',
                                    color: Color(0xFF182638),
                                    fontSize: 19,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      color: Color(0xFFC35A45),
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        event['date']!,
                                        style: const TextStyle(
                                          fontFamily: 'Grindy',
                                          color: Color(0xFF7D8998),
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xFFC35A45),
                                      size: 13,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        event['location']!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Grindy',
                                          color: Color(0xFF7D8998),
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      selected
                                          ? Icons.check_circle_rounded
                                          : Icons.arrow_forward_ios_rounded,
                                      color: const Color(0xFFC35A45),
                                      size: 14,
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
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF182638),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_offer_outlined,
                      color: Color(0xFFE3A06F),
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Tickets available for a limited time',
                        style: TextStyle(
                          fontFamily: 'Grindy',
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xFFE3A06F),
                      size: 18,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFC35A45),
                        Color(0xFF8E3D31),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Your Ticket',
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