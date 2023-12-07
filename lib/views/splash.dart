import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import '../consts.dart';
import 'login.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
          backgroundColor:  kdarkprimary ,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget:  Image.asset("assets/images/1.png"),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen:  ChatterSignIn(),
        );
  }
}