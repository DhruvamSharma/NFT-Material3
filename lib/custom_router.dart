import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nft_material/pages/auctions.dart';
import 'package:nft_material/pages/home.dart';

class CustomRouter {
  static Route<dynamic> onRoute(RouteSettings settings) {
    // provide click feedback on every page open
    HapticFeedback.mediumImpact();

    switch (settings.name) {
      case AuctionsPage.routeName:
        return _transitionRoute(const AuctionsPage(), AuctionsPage.routeName);
      default:
        return _transitionRoute(const HomePage(), HomePage.routeName);
    }
  }

  static PageRoute _transitionRoute(Widget widget, String routeName) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }
}
