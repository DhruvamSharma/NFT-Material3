import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/asset_links.dart';
import 'package:nft_material/extensions.dart';
import 'package:nft_material/models.dart';
import 'package:simple_animations/simple_animations.dart';

class AuctionItemTitleWidget extends StatelessWidget {
  const AuctionItemTitleWidget({required this.item, Key? key})
      : super(key: key);
  final AuctionItem item;
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
      delay: const Duration(milliseconds: 50),
      duration: kThemeAnimationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              item.title.toUpperCase(),
              style: context.textTheme.headline5
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    height: 20,
                    imageUrl: AssetLinks.profileImageLink,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.userName,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).textTheme.caption?.color,
                    ),
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
