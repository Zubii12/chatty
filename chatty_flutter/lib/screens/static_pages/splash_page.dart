import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 64.0, right: 64.0, top: 104.0, bottom: 88.0),
                  child: MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Image.asset('assets/images/splash_screen_light.png')
                      : Image.asset('assets/images/splash_screen_dark.png'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    'Connect easily with your family and friends over countries',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
