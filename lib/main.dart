import 'package:challenge/screen_16.dart';
import 'package:challenge/screen_19.dart';
import 'package:challenge/screen_4.dart';
import 'package:challenge/screen_5.dart';
import 'package:challenge/screen_6.dart';
import 'package:challenge/screen_7.dart';
import 'package:challenge/screen_8.dart';
import 'package:challenge/screen_9.dart';
import 'package:challenge/screen_10.dart';
import 'package:challenge/screen_11.dart';
import 'package:challenge/screen_12.dart';
import 'package:challenge/screen_13.dart';
import 'package:challenge/screen_14.dart';
import 'package:challenge/screen_15.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Screen19(),
    );
  }
}