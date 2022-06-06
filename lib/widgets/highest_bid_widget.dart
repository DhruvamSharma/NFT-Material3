import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/asset_links.dart';
import 'package:simple_animations/simple_animations.dart';

class HighestBidWidget extends StatelessWidget {
  const HighestBidWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      builder: (_, child, position) {
        return Transform.translate(
          offset: Offset(0, position),
          child: child ?? Container(),
        );
      },
      tween: Tween<double>(begin: 100, end: 0),
      delay: const Duration(milliseconds: 80),
      duration: kThemeAnimationDuration,
      child: Row(
        children: [
          const SizedBox(
            height: 40,
            width: 40,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  AssetLinks.highestBidderProfileImageLink),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Highest Bid Placed By',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).textTheme.caption?.color,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Dhruvam',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
