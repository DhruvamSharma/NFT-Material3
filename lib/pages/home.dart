import 'package:flutter/material.dart';
import 'package:nft_material/widgets/assoiation_widget.dart';
import 'package:nft_material/widgets/common_header_widget.dart';
import 'package:nft_material/widgets/landing_title_widget.dart';
import 'package:nft_material/widgets/stats_widget.dart';
import 'package:nft_material/widgets/wave_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home-page';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CommonHeaderWidget(),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: LandingTitleWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, top: 40.0),
                child: StatsWidget(),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 40.0, top: 80.0, bottom: 20,),
                child: AssociationWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
