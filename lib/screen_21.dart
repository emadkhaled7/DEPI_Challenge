import 'package:flutter/material.dart';
import 'screen_22.dart';

class Screen21 extends StatefulWidget {
  final String workoutName;

  const Screen21({
    super.key,
    required this.workoutName,
  });

  @override
  State<Screen21> createState() => _Screen21State();
}

class _Screen21State extends State<Screen21> {
  int currentExercise = 1;

  final List<Map<String, String>> exercises = [
    {
      'name': 'Warm Up',
      'time': '05:00',
    },
    {
      'name': 'Push Ups',
      'time': '12 reps',
    },
    {
      'name': 'Squats',
      'time': '15 reps',
    },
    {
      'name': 'Mountain Climbers',
      'time': '20 reps',
    },
    {
      'name': 'Cool Down',
      'time': '05:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final exercise = exercises[currentExercise - 1];

    return Scaffold(
      backgroundColor: const Color(0xFF17191F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      widget.workoutName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '$currentExercise/${exercises.length}',
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: List.generate(
                  exercises.length,
                  (index) {
                    return Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: index < currentExercise
                              ? const Color(0xFFFF7043)
                              : Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF7043),
                        Color(0xFFFF8A65),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.25),
                        blurRadius: 40,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.white,
                    size: 85,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Center(
                child: Text(
                  exercise['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  exercise['time']!,
                  style: const TextStyle(
                    color: Color(0xFFFF7043),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white54,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        currentExercise == exercises.length
                            ? 'Finish your workout!'
                            : 'Keep going and complete this exercise.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  if (currentExercise < exercises.length) {
                    setState(() {
                      currentExercise++;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Screen22(
                          workoutName: widget.workoutName,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF7043),
                        Color(0xFFFF8A65),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    currentExercise == exercises.length
                        ? 'Finish Workout'
                        : 'Next Exercise',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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