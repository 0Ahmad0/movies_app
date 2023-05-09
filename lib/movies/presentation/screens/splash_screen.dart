import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'movies_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const MoviesScreen()));
    });
    return Scaffold(
      body: Center(
        child: FadeInDown(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png'),
              const SizedBox(
                height: 20.0,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
