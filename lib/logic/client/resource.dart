import 'status.dart';

class Resource {
  Status? status;
  dynamic data;
  String? message;

  Resource({
    required this.status,
    required this.data,
    required this.message,
  });
}
