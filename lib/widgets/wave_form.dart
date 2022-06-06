import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nft_material/asset_links.dart';

class WaveFormWidget extends StatelessWidget {
  const WaveFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      Theme.of(context).brightness == Brightness.dark
          ? AssetLinks.waveDarkThemeLink
          : AssetLinks.waveLightThemeLink,
      height: 300,
    );
  }
}
