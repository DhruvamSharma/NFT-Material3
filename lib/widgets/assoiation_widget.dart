import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/asset_links.dart';

class AssociationWidget extends StatelessWidget {
  const AssociationWidget({Key? key}) : super(key: key);
  static const double size = 30;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Supported by',
          style: Theme.of(context).textTheme.caption,
        ),
        CachedNetworkImage(
          imageUrl: AssetLinks.etherLogo,
          height: size,
          width: size,
        ),
        CachedNetworkImage(
          imageUrl: AssetLinks.metaMaskLogo,
          height: size,
          width: size,
        ),
        CachedNetworkImage(
          imageUrl: AssetLinks.binanceLogo,
          height: size,
          width: size,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
