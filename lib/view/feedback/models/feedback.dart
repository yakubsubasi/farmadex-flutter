import 'package:farmadex/core/utils/json/utils.dart';
import 'package:farmadex/view/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Feedback {
  String? id;

  final String message;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(
      name: 'created_at',
      fromJson: getDateTimeFromTimestamp,
      toJson: getTimestampFromDateTime)
  final DateTime? createdAt;

  /// bug, feature, other
  final FeedbackType type;

  Feedback({
    required this.message,
    required this.userId,
    required this.type,
    required this.createdAt,
    this.id,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
