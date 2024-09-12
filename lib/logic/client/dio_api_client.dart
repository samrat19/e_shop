import 'resource.dart';

abstract class DioApiClient{
  Future<Resource> getData();
}