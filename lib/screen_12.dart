import 'package:flutter/material.dart';

class Screen12 extends StatefulWidget {
  const Screen12({super.key});

  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
  int selectedSurah = 0;
  bool isPlaying = false;
  bool isFavorite = false;

  final List<Map<String, dynamic>> surahs = [
    {
      'name': 'الفاتحة',
      'number': '01',
      'verses': '7 آيات',
      'image': 'assets/quran/al_fatiha.jpg',
    },
    {
      'name': 'الكهف',
      'number': '18',
      'verses': '110 آية',
      'image': 'assets/quran/al_kahf.jpg',
    },
    {
      'name': 'يس',
      'number': '36',
      'verses': '83 آية',
      'image': 'assets/quran/yasin.jpg',
    },
    {
      'name': 'الرحمن',
      'number': '55',
      'verses': '78 آية',
      'image': 'assets/quran/al_rahman.jpg',
    },
    {
      'name': 'الملك',
      'number': '67',
      'verses': '30 آية',
      'image': 'assets/quran/al_mulk.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentSurah = surahs[selectedSurah];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F4ED),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
                _buildHeader(),
                _buildCurrentSurah(currentSurah),
                _buildSectionTitle(),
                _buildSurahList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.settings_outlined,
              size: 21,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Quran Kareem',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Listen & Reflect',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF315C4B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentSurah(Map<String, dynamic> surah) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: const Color(0xFF315C4B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isFavorite
                        ? Colors.red.shade300
                        : Colors.white,
                    size: 19,
                  ),
                ),
                const Spacer(),
                const Text(
                  'التلاوة الحالية',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                surah['image'],
                width: double.infinity,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'مشاري راشد العفاسي',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 8,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'سورة ${surah['name']}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${surah['number']}  •  ${surah['verses']}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (selectedSurah < surahs.length - 1) {
                      setState(() {
                        selectedSurah++;
                        isPlaying = false;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: const Color(0xFF315C4B),
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    if (selectedSurah > 0) {
                      setState(() {
                        selectedSurah--;
                        isPlaying = false;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          const Text(
            'عرض الكل',
            style: TextStyle(
              color: Color(0xFF315C4B),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Text(
            'السور',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurahList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          surahs.length,
          (index) {
            final surah = surahs[index];
            final selected = index == selectedSurah;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSurah = index;
                  isPlaying = false;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFE5EEE9)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF315C4B)
                            : const Color(0xFFF0EDE5),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Center(
                        child: Text(
                          surah['number'],
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : const Color(0xFF315C4B),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'سورة ${surah['name']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'مشاري راشد العفاسي  •  ${surah['verses']}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      selected
                          ? Icons.equalizer_rounded
                          : Icons.play_circle_outline_rounded,
                      color: const Color(0xFF315C4B),
                      size: 25,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF315C4B),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'Surahs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
    );
  }
}