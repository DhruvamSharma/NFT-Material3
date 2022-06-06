import 'package:flutter/material.dart';
import 'package:nft_material/models.dart';
import 'package:simple_animations/simple_animations.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = CategoriesProvider();
    return SizedBox(
      height: 40,
      child: AnimatedBuilder(
        animation: categoriesProvider,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            itemBuilder: (_, index) {
              return CategoriesSingleWidget(
                index: index,
                provider: categoriesProvider,
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
          );
        },
      ),
    );
  }
}

class CategoriesSingleWidget extends StatelessWidget {
  const CategoriesSingleWidget(
      {required this.index, required this.provider, Key? key})
      : super(key: key);
  final int index;
  final CategoriesProvider provider;
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      builder: (_, child, position) {
        return Transform.translate(
          offset: Offset(position, 0),
          child: child ?? Container(),
        );
      },
      tween: Tween<double>(begin: 200, end: 0),
      delay: Duration(milliseconds: index * 10),
      duration: kThemeAnimationDuration,
      child: GestureDetector(
        onTap: () {
          provider.assignSelectedIndex(index);
        },
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          height: 30,
          margin: const EdgeInsets.only(right: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: provider.selectedIndex == index
                ? Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : const Color(0xff110A5C)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Center(
            child: Text(
              categories[index],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: provider.selectedIndex == index
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).textTheme.caption?.color,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesProvider extends ChangeNotifier {
  int selectedIndex = 0;
  void assignSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
