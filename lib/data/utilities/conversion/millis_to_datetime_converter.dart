import 'package:json_annotation/json_annotation.dart';

/// Handles networked data fetching for weather.
class MillisToDateTimeConverter implements JsonConverter<DateTime, int> {
  const MillisToDateTimeConverter();

  @override
  DateTime fromJson(int json) {
    // multiply the timestamp input by 1000 since input is second, but
    // [DateTime.fromMillisecondsSinceEpoch] expect milliseconds
    return DateTime.fromMillisecondsSinceEpoch(json * 1000, isUtc: true);
  }

  @override
  int toJson(DateTime json) => json.millisecondsSinceEpoch;
}