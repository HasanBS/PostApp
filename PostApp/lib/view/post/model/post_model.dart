import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends INetworkModel<PostModel> {
  @JsonKey(name: "_id")
  int? id;
  int? userId;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  @override
  Map<String, dynamic>? toJson() {
    return _$PostModelToJson(this);
  }

  @override
  PostModel fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }
}
