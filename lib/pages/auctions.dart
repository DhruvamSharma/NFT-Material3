import 'package:flutter/material.dart';
import 'package:nft_material/widgets/auction_items_widget.dart';
import 'package:nft_material/widgets/auction_title_widget.dart';
import 'package:nft_material/widgets/categories_widget.dart';
import 'package:nft_material/widgets/common_header_widget.dart';
import 'package:nft_material/widgets/wave_form.dart';

class AuctionsPage extends StatelessWidget {
  const AuctionsPage({Key? key}) : super(key: key);
  static const String routeName = '/auctions-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            right: -40,
            top: -30,
            child: WaveFormWidget(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CommonHeaderWidget(),
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: AuctionTitleWidget(),
                ),
                CategoriesWidget(),
                AuctionItemsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
