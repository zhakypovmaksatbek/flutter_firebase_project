import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/product/enums/image_size.dart';

import 'package:flutter_firebase_project/product/models/recommended.dart';
import 'package:kartal/kartal.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    required this.recommended,
    super.key,
  });

  final Recommended recommended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              recommended.image ?? '',
              height: ImageSizes.normal.value,
              errorBuilder: (context, error, stackTrace) => const Placeholder(),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(recommended.title ?? ''),
              subtitle: Text(
                recommended.description ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
