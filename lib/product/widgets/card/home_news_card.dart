import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/product/constants/color_constants.dart';
import 'package:flutter_firebase_project/product/models/news.dart';

import 'package:flutter_firebase_project/product/widgets/text/subtitle_text.dart';
import 'package:kartal/kartal.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    super.key,
    required this.newsItem,
  });

  final News newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              newsItem.backgroundImage ?? '',
              color: const Color.fromARGB(52, 0, 0, 0),
              colorBlendMode: BlendMode.colorBurn,
              errorBuilder: (context, error, stackTrace) => const Placeholder(),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_add_outlined,
                    color: ColorConstants.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SubtitleText(
                      value: newsItem.category??'',
                      color: ColorConstants.greyLighter,
                    ),
                    Text(
                      newsItem.title?? '',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: ColorConstants.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
