import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/extensions.dart';
import 'package:nft_material/models.dart';
import 'package:nft_material/widgets/auction_item_title_widget.dart';
import 'package:nft_material/widgets/highest_bid_widget.dart';
import 'package:nft_material/widgets/place_bid_button.dart';
import 'package:simple_animations/simple_animations.dart';

class AuctionItemPage extends StatelessWidget {
  const AuctionItemPage({required this.item, Key? key}) : super(key: key);
  final AuctionItem item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          72,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Auctions',
            style: context.textTheme.titleMedium,
          ),
          titleSpacing: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.pinkAccent,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (option) {
                // Show snack bar

              },
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: context.labelLarge,
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayAnimationBuilder<double>(
                builder: (_, position, child) {
                  return Transform.translate(
                    offset: Offset(0, position),
                    child: child ?? Container(),
                  );
                },
                tween: Tween<double>(begin: 200, end: 0),
                duration: kThemeAnimationDuration,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).dividerColor,
                  )),
                  padding: const EdgeInsets.all(10.0),
                  child: CachedNetworkImage(
                    imageUrl: item.imageLink,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AuctionItemTitleWidget(item: item),
              PlayAnimationBuilder<double>(
                builder: (_, position, child) {
                  return Transform.translate(
                    offset: Offset(0, position),
                    child: child ?? Container(),
                  );
                },
                tween: Tween<double>(begin: 100, end: 0),
                delay: const Duration(milliseconds: 70),
                duration: kThemeAnimationDuration,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'A non-fungible token is a financial security consisting of digital data stored in a blockchain, a form of distributed ledger. The ownership of an NFT is recorded in the blockchain, and can be transferred by the owner, allowing NFTs to be sold and traded.',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.textTheme.bodySmall?.color,
                      height: 1.5,
                      wordSpacing: 2.0,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: HighestBidWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PlayAnimationBuilder<double>(
                  builder: (_, position, child) {
                    return Transform.translate(
                      offset: Offset(0, position),
                      child: child ?? Container(),
                    );
                  },
                  tween: Tween<double>(begin: 100, end: 0),
                  delay: const Duration(milliseconds: 90),
                  duration: kThemeAnimationDuration,
                  child: PlaceBidButton(item: item),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
