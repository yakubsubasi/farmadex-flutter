DateTime? getDateTimeFromTimestamp(dynamic value) {
  if (value == null) return null;
  final connectorService = SupabaseConnectorService();

  return connectorService.getDateTimeFromTimestamp(value);
}

getTimestampFromDateTime(DateTime? value) {
  if (value == null) return null;

  final connectorService = SupabaseConnectorService();
  return connectorService.getTimestampFromDateTime(value);
}

class SupabaseConnectorService {
  DateTime? getDateTimeFromTimestamp(timestamp) {
    return (timestamp is String)
        ? DateTime.parse(timestamp)
        : timestamp.toDate();
  }

  getTimestampFromDateTime(DateTime? dateTime) {
    return dateTime!.toIso8601String();
  }
}
