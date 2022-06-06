import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    required this.openChild,
    required this.closedChild,
    this.onItemClick,
    this.onClosed,
    Key? key,
  }) : super(key: key);

  final Widget closedChild;
  final Widget openChild;
  final VoidCallback? onItemClick;
  final VoidCallback? onClosed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      onClosed: (_) {
        if (onClosed != null) {
          onClosed!();
        }
      },
      openBuilder: (context, closedContainer) {
        return openChild;
      },
      openColor: theme.scaffoldBackgroundColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: theme.scaffoldBackgroundColor,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: () {
            if (onItemClick != null) {
              onItemClick!();
            }
            openContainer();
          },
          child: closedChild,
        );
      },
    );
  }
}
