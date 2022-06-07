import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:nft_material/asset_links.dart';
import 'package:nft_material/theme.dart';

class BrightnessToggle extends StatefulWidget {
  const BrightnessToggle({super.key});

  @override
  State<BrightnessToggle> createState() => _BrightnessToggleState();
}

class _BrightnessToggleState extends State<BrightnessToggle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
      lowerBound: 0.2,
      upperBound: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    checkForChangeInTheme();
    return GestureDetector(
      onTap: () {
        if (!_controller.isAnimating) {
          if (_controller.value == _controller.lowerBound) {
            _controller.animateTo(_controller.upperBound);
          } else {
            _controller.reverse(from: _controller.upperBound);
          }

          final themeProvider = ThemeProvider.of(context);
          final settings = themeProvider.settings.value;
          final newSettings = ThemeSettings(
            sourceColor: settings.sourceColor,
            themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
          );
          ThemeSettingChange(settings: newSettings).dispatch(context);
        }
      },
      child: ClipOval(
        child: Lottie.network(
          AssetLinks.brightnessToggleLink,
          height: 40,
          width: 40,
          controller: _controller,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void checkForChangeInTheme() {
    if (!_controller.isAnimating) {
      if (Theme.of(context).brightness == Brightness.dark &&
          _controller.value != _controller.upperBound) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _controller.animateTo(_controller.upperBound);
        });
      } else if (Theme.of(context).brightness == Brightness.light &&
          _controller.value != _controller.lowerBound) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _controller.reverse(from: _controller.upperBound);
        });
      }
    }
  }
}
