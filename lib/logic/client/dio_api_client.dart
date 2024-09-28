import 'package:e_shop/logic/client/dio_api_client_implementation.dart';
import 'package:injectable/injectable.dart';

import 'resource.dart';


@lazySingleton
abstract class DioApiClient {

  @factoryMethod
  static DioApiClient create() => DioAPIClientAPIImplementation();

  Future<Resource> getData();
}