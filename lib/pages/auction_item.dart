import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/models.dart';
import 'package:nft_material/widgets/auction_item_title_widget.dart';
import 'package:nft_material/widgets/highest_bid_widget.dart';
import 'package:nft_material/widgets/shaded_container_widget.dart';
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
          title: const Text('Auctions'),
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
              onSelected: (option) {},
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
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
              PlayAnimation<double>(
                builder: (_, child, position) {
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
              PlayAnimation<double>(
                builder: (_, child, position) {
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).textTheme.caption?.color,
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
                child: PlayAnimation<double>(
                  builder: (_, child, position) {
                    return Transform.translate(
                      offset: Offset(0, position),
                      child: child ?? Container(),
                    );
                  },
                  tween: Tween<double>(begin: 100, end: 0),
                  delay: const Duration(milliseconds: 90),
                  duration: kThemeAnimationDuration,
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ShadedContainerWidget(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Place Bid',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              Text(
                                item.timeLeft,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
