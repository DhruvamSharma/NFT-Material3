import 'package:flutter/material.dart';
import 'package:nft_material/extensions.dart';

class AuctionTitleWidget extends StatelessWidget {
  const AuctionTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTheme = context.textTheme.headlineMedium?.copyWith(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    );
    final subtitleTheme = context.textTheme.bodySmall?.copyWith(
      wordSpacing: 2.0,
      height: 1.5,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            'Live',
            style: context.textTheme.bodySmall,
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 15,
              right: -30,
              child: Container(
                height: 40,
                width: 90,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blueAccent
                    : Colors.purpleAccent.withOpacity(0.5),
              ),
            ),
            Text(
              'Auctions.',
              style: titleTheme?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Enjoy! the latest hot auctions',
            style: subtitleTheme,
          ),
        ),
      ],
    );
  }
}
