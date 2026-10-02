import 'package:flutter/material.dart';

class Screen17 extends StatefulWidget {
  final String roomName;
  final String image;

  const Screen17({
    super.key,
    required this.roomName,
    required this.image,
  });

  @override
  State<Screen17> createState() => _Screen17State();
}

class _Screen17State extends State<Screen17> {
  bool light = true;
  bool ac = true;
  bool tv = false;
  bool curtains = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6C63FF),
                          Color(0xFF8E85FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  widget.roomName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D1D35),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Control your smart devices',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.image,
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 210,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        bottom: 18,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.roomName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Smart Devices',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D1D35),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      light = !light;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: light
                            ? [
                                const Color(0xFFFFB74D),
                                const Color(0xFFFF8A65),
                              ]
                            : [
                                Colors.white,
                                Colors.white,
                              ],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: light
                              ? Colors.orange.withOpacity(0.2)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: light
                                ? Colors.white.withOpacity(0.25)
                                : const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            light
                                ? Icons.lightbulb_rounded
                                : Icons.lightbulb_outline_rounded,
                            color: light ? Colors.white : Colors.orange,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Smart Lights',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: light
                                      ? Colors.white
                                      : const Color(0xFF1D1D35),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                light ? 'Lights are ON' : 'Lights are OFF',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: light
                                      ? Colors.white.withOpacity(0.9)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          light
                              ? Icons.check_circle_rounded
                              : Icons.circle_outlined,
                          color: light ? Colors.white : Colors.grey,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ac = !ac;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ac
                            ? [
                                const Color(0xFF42A5F5),
                                const Color(0xFF5C6BC0),
                              ]
                            : [
                                Colors.white,
                                Colors.white,
                              ],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: ac
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: ac
                                ? Colors.white.withOpacity(0.2)
                                : const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.ac_unit_rounded,
                            color: ac ? Colors.white : Colors.blue,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Air Conditioner',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: ac
                                      ? Colors.white
                                      : const Color(0xFF1D1D35),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                ac ? 'Air Conditioner is ON' : 'Air Conditioner is OFF',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: ac
                                      ? Colors.white.withOpacity(0.9)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          ac
                              ? Icons.check_circle_rounded
                              : Icons.circle_outlined,
                          color: ac ? Colors.white : Colors.grey,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tv = !tv;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: tv
                                ? const Color(0xFFEDE7F6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.tv_rounded,
                                size: 32,
                                color: tv
                                    ? const Color(0xFF7E57C2)
                                    : Colors.grey,
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'TV',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1D1D35),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                tv ? 'ON' : 'OFF',
                                style: TextStyle(
                                  color: tv
                                      ? const Color(0xFF7E57C2)
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            curtains = !curtains;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: curtains
                                ? const Color(0xFFE0F7FA)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.blinds_rounded,
                                size: 32,
                                color: curtains
                                    ? const Color(0xFF00ACC1)
                                    : Colors.grey,
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Curtains',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1D1D35),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                curtains ? 'OPEN' : 'CLOSED',
                                style: TextStyle(
                                  color: curtains
                                      ? const Color(0xFF00ACC1)
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}