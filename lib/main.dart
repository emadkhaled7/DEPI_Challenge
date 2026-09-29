import 'package:challenge/screen_4.dart';
import 'package:challenge/screen_5.dart';
import 'package:challenge/screen_6.dart';
import 'package:challenge/screen_7.dart';
import 'package:challenge/screen_8.dart';
import 'package:challenge/screen_9.dart';
import 'package:flutter/material.dart';
import 'screen_1.dart';
import 'screen_2.dart';
import 'screen_3.dart';

void main() {
  runApp(const ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Screen7(),
    );
  }
}