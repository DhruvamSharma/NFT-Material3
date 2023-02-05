import 'package:flutter/material.dart';
import 'package:nft_material/extensions.dart';
import 'package:nft_material/file_downloader.dart';
import 'package:nft_material/models.dart';
import 'package:nft_material/widgets/shaded_container_widget.dart';

class PlaceBidButton extends StatefulWidget {
  const PlaceBidButton({required this.item, Key? key}) : super(key: key);
  final AuctionItem item;

  @override
  State<PlaceBidButton> createState() => _PlaceBidButtonState();
}

class _PlaceBidButtonState extends State<PlaceBidButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!isLoading) {
          enableOrDisableLoader(true);
          final imageData = await startDownloadUsingRunMethod();
          enableOrDisableLoader(false);
          if (!mounted) return;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(imageData)));
        }
      },
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ShadedContainerWidget(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Place Bid',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: LinearProgressIndicator(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void enableOrDisableLoader(bool isVisible) {
    setState(() {
      isLoading = isVisible;
    });
  }
}
