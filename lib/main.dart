import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/movies/domain/entity/movie.dart';
import '/movies/presintation/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen(),
    );
  }
}
