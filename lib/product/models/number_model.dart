import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_project/product/utility/base/base_firebase_model.dart';

class NumberModel extends Equatable
    with IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });

  final String? number;

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

 
  @override
  // TODO: implement id
  String? id = '';

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
