import 'package:flutter/material.dart';

class Screen9 extends StatefulWidget {
  const Screen9({super.key});

  @override
  State<Screen9> createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {
  int selectedWorkout = 0;

  final List<Map<String, dynamic>> workouts = [
    {
      'title': 'Strength',
      'subtitle': 'Upper body',
      'duration': '45 min',
      'calories': '320 kcal',
      'image': 'assets/fitness/workout_1.jpg',
      'icon': Icons.fitness_center_rounded,
    },
    {
      'title': 'Cardio',
      'subtitle': 'Outdoor run',
      'duration': '30 min',
      'calories': '240 kcal',
      'image': 'assets/fitness/workout_2.jpg',
      'icon': Icons.directions_run_rounded,
    },
    {
      'title': 'HIIT',
      'subtitle': 'Full body',
      'duration': '25 min',
      'calories': '280 kcal',
      'image': 'assets/fitness/workout_3.jpg',
      'icon': Icons.flash_on_rounded,
    },
    {
      'title': 'Yoga',
      'subtitle': 'Flexibility',
      'duration': '35 min',
      'calories': '180 kcal',
      'image': 'assets/fitness/workout_4.jpg',
      'icon': Icons.self_improvement_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151715),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                25,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildHeader(),
                    const SizedBox(height: 25),
                    _buildProgressCard(),
                    const SizedBox(height: 20),
                    _buildStats(),
                    const SizedBox(height: 26),
                    _buildWorkoutHeader(),
                    const SizedBox(height: 13),
                    _buildWorkoutTypes(),
                    const SizedBox(height: 20),
                    _buildFeaturedWorkout(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            'assets/fitness/profile.jpg',
          ),
        ),
        const SizedBox(width: 11),
        const Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'Tuesday, 29 Sep',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Ready to move?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: const Color(0xff252925),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffC8F36A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 105,
            width: 105,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    value: .68,
                    strokeWidth: 9,
                    backgroundColor: Colors.black12,
                    color: const Color(0xff151715),
                  ),
                ),
                const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      '68%',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'complete',
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 17),
          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Weekly goal',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '5 / 7 workouts',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Two more sessions to complete your goal.',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _buildStat(
          '2.4k',
          'Calories',
          Icons.local_fire_department_outlined,
        ),
        const SizedBox(width: 9),
        _buildStat(
          '3.2h',
          'Active',
          Icons.timer_outlined,
        ),
        const SizedBox(width: 9),
        _buildStat(
          '18.4k',
          'Steps',
          Icons.directions_walk_outlined,
        ),
      ],
    );
  }

  Widget _buildStat(
    String value,
    String label,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff242824),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xffC8F36A),
              size: 19,
            ),
            const SizedBox(height: 7),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutHeader() {
    return const Row(
      children: [
        Text(
          'Choose a workout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          'View all',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutTypes() {
    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: workouts.length,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          final workout = workouts[index];
          final isSelected =
              selectedWorkout == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWorkout = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 180,
              ),
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xffC8F36A)
                    : const Color(0xff242824),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Icon(
                    workout['icon'],
                    color: isSelected
                        ? Colors.black
                        : Colors.white54,
                    size: 25,
                  ),
                  const Spacer(),
                  Text(
                    workout['title'],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    workout['duration'],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.black54
                          : Colors.white38,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedWorkout() {
    final workout = workouts[selectedWorkout];

    return Container(
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        image: DecorationImage(
          image: AssetImage(
            workout['image'],
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(.88),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              workout['subtitle'],
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: Text(
                    workout['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          '${workout['title']} workout started',
                        ),
                        duration:
                            const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: Color(0xffC8F36A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '${workout['duration']}  •  ${workout['calories']}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
