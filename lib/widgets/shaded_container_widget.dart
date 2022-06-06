import 'package:flutter/material.dart';

class ShadedContainerWidget extends StatelessWidget {
  const ShadedContainerWidget({required this.child, Key? key})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              colors: Theme.of(context).brightness == Brightness.dark
                  ? const [
                      Colors.white,
                      Colors.white54,
                    ]
                  : const [
                      Color(0xff110A5C),
                      Color(0xff110A5C),
                    ],
              stops: const [0.4, 1.0],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
