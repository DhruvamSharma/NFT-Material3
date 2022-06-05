import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaveFormWidget extends StatelessWidget {
  const WaveFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      Theme.of(context).brightness == Brightness.dark
          ? 'https://assets2.lottiefiles.com/packages/lf20_xsudhjgo.json'
          : 'https://assets2.lottiefiles.com/packages/lf20_kgnr4v67.json',
      height: 300,
    );
  }
}
