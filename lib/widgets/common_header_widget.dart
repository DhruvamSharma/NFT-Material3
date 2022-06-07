import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/asset_links.dart';
import 'package:nft_material/extensions.dart';
import 'package:nft_material/widgets/brightness_toggle.dart';

class CommonHeaderWidget extends StatelessWidget {
  const CommonHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Row(
            children: [
              Text(
                'D.',
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              const BrightnessToggle(),
              SizedBox(
                height: 40,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: AssetLinks.profileImageLink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
