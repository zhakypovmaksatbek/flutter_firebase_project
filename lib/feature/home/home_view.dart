// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/feature/home/home_provider.dart';
import 'package:flutter_firebase_project/feature/home/sub_view/home_search_delegate.dart';
import 'package:flutter_firebase_project/product/constants/index.dart';
import 'package:flutter_firebase_project/product/models/news.dart';
import 'package:flutter_firebase_project/product/models/tag.dart';
import 'package:flutter_firebase_project/product/utility/exception/custom_exception.dart';
import 'package:flutter_firebase_project/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_firebase_project/product/widgets/card/home_news_card.dart';
import 'package:flutter_firebase_project/product/widgets/card/recommended.dart';
import 'package:flutter_firebase_project/product/widgets/text/subtitle_text.dart';
import 'package:flutter_firebase_project/product/widgets/text/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

part 'home_news_list_view.dart';
part 'sub_view/home_chips.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(_homeProvider.notifier).fetchAndLoad();
    });
    ref.read(_homeProvider.notifier).addListener((state) {
      _controller.text = state.selectedTag?.name ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: context.paddingNormal,
              children: [
                const _Header(),
                _CustomField(_controller),
                const _TagListView(),
                const _BrowseHorizontalListView(),
                const _RecommendedHeader(),
                const _RecommendedLIstView(),
              ],
            ),
            if (ref.watch(_homeProvider).isLoading ?? false)
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }
}

class _CustomField extends ConsumerWidget {
  const _CustomField(
    this.controller,
  );
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: TextField(
        controller: controller,
        onTap: () async {
          final responce =await showSearch<Tag?>(
            context: context,
            delegate: HomeSearchDelegate(
              ref.read(_homeProvider.notifier).fullTagList,
            ),
          );
          ref.read(_homeProvider.notifier).updateSelectedTag(responce);
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: ColorConstants.greyLighter,
          prefixIcon: Icon(Icons.search_outlined),
          suffixIcon: Icon(Icons.mic_none_outlined),
          hintText: StringConstants.search,
        ),
      ),
    );
  }
}

class _TagListView extends ConsumerWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsItems = ref.watch(_homeProvider).tags ?? [];

    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagsItems.length,
        itemBuilder: (BuildContext context, int index) {
          final tagItem = tagsItems[index];
          if (tagItem.active ?? false) {
            return _ActiveChip(tagItem);
          }
          return _PassiveChip(tagItem);
        },
      ),
    );
  }
}

class _BrowseHorizontalListView extends ConsumerWidget {
  const _BrowseHorizontalListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).news ?? [];
    return SizedBox(
      height: context.dynamicHeight(.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsItems.length,
        itemBuilder: (BuildContext context, int index) {
          return HomeNewsCard(newsItem: newsItems[index]);
        },
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: TitleText(value: StringConstants.homeTitle),
        ),
        TextButton(
          onPressed: () {},
          child: const SubtitleText(
            value: StringConstants.homeSeeAll,
            color: ColorConstants.grey,
          ),
        )
      ],
    );
  }
}

class _RecommendedLIstView extends ConsumerWidget {
  const _RecommendedLIstView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(_homeProvider).recommended ?? [];

    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return RecommendedCard(recommended: values[index]);
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(value: StringConstants.homeBrowse),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: const SubtitleText(
            value: StringConstants.homeSubTitle,
            color: ColorConstants.grey,
          ),
        ),
      ],
    );
  }
}
