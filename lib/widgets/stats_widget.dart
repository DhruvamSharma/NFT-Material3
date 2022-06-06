import 'package:flutter/material.dart';
import 'package:nft_material/pages/auctions.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SingleStatWidget(number: '12.1K+', description: 'Art Works'),
            SizedBox(
              height: 20,
            ),
            SingleStatWidget(number: '1.7M+', description: 'Artists'),
            SizedBox(
              height: 20,
            ),
            SingleStatWidget(number: '45K+', description: 'Auctions'),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(context, AuctionsPage.routeName);
          },
          child: Container(
            height: 200,
            width: 250,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.purple
                : Colors.deepPurpleAccent.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    height: 40,
                    width: 50,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.2)
                        : Colors.deepPurpleAccent.withOpacity(0.5),
                    child: const Icon(Icons.arrow_forward),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Text(
                      'Discover Artwork',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            letterSpacing: 8.0,
                            height: 1.5,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: SizedBox(
                      width: 70,
                      child: Divider(
                        height: 10,
                        thickness: 2,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SingleStatWidget extends StatelessWidget {
  const SingleStatWidget({
    required this.number,
    required this.description,
    Key? key,
  }) : super(key: key);
  final String number;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
