// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_project/product/models/news.dart';
import 'package:flutter_firebase_project/product/models/recommended.dart';
import 'package:flutter_firebase_project/product/models/tag.dart';
import 'package:flutter_firebase_project/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_firebase_project/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  List<Tag> _fullTagList = [];
  List<Tag> get fullTagList => _fullTagList;

  Future<void> fetchNews() async {
    final newsCollectionReferance = FirebaseCollections.news.referance;
    final responce = await newsCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();

    if (responce.docs.isNotEmpty) {
      final values = responce.docs.map((e) => e.data()).toList();
      state = state.copyWith(news: values);
    }
  }

  Future<void> fetchTags() async {
    final items =
        await fetchList<Tag, Tag>(const Tag(), FirebaseCollections.tag);

    state = state.copyWith(tags: items);
    _fullTagList = items ?? [];
  }

  Future<void> fetchRecommended() async {
    final items = await fetchList<Recommended, Recommended>(
      const Recommended(),
      FirebaseCollections.recommended,
    );

    state = state.copyWith(recommended: items);
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);

    await Future.wait([
      fetchTags(),
      fetchNews(),
      fetchRecommended(),
    ]);

    state = state.copyWith(isLoading: false);
  }

  void updateSelectedTag(Tag? tag) {
    if (tag == null) return;
    state = state.copyWith(selectedTag: tag);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.news,
    this.tags,
    this.recommended,
    this.selectedTag,
    this.isLoading,
  });

  final List<News>? news;
  final List<Tag>? tags;
  final List<Recommended>? recommended;
  final Tag? selectedTag;
  final bool? isLoading;
  @override
  List<Object?> get props => [news, tags, recommended, isLoading, selectedTag];

  HomeState copyWith({
    List<News>? news,
    List<Tag>? tags,
    List<Recommended>? recommended,
    Tag? selectedTag,
    bool? isLoading,
  }) {
    return HomeState(
      news: news ?? this.news,
      tags: tags ?? this.tags,
      recommended: recommended ?? this.recommended,
      selectedTag: selectedTag ?? this.selectedTag,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
