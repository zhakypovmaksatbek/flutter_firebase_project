// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_project/product/utility/base/base_firebase_model.dart';
@immutable
class Recommended with EquatableMixin, BaseFirebaseModel<Recommended>, IdModel {
 const  Recommended({
    this.description,
    this.title,
    this.image,
    this.id,
  });

  final String? description;
  final String? title;
  final String? image;
  @override
  final String? id;

  @override
  List<Object?> get props => [description, title, image, id];

  Recommended copyWith({
    String? description,
    String? title,
    String? image,
    String? id,
  }) {
    return Recommended(
      description: description ?? this.description,
      title: title ?? this.title,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'image': image,
    };
  }

  @override
  Recommended fromJson(Map<String, dynamic> json) {
    return Recommended(
      description: json['description'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
  }
}
