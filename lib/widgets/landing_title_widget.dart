import 'package:flutter/material.dart';
import 'package:nft_material/extensions.dart';

class LandingTitleWidget extends StatelessWidget {
  const LandingTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTheme = context.textTheme.headlineMedium?.copyWith(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    );
    final subtitle = context.textTheme.bodySmall?.copyWith(
      wordSpacing: 2.0,
      height: 1.5,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            'Started',
            style: context.textTheme.bodySmall,
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: -15,
              right: 90,
              child: Container(
                height: 40,
                width: 90,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blueAccent
                    : Colors.purpleAccent.withOpacity(0.5),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Discover ',
                    style: titleTheme?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: 'Rare Collections ',
                    style: titleTheme?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'Of \n',
                    style: titleTheme?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: 'Art and NFTs. ',
                    style: titleTheme?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'Digital market place for crypto collectibles and non-fungible tokens ',
                  style: subtitle?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'NFTs.',
                  style: subtitle?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
