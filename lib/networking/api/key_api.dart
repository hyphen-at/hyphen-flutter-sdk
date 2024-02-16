import 'package:hyphen_flutter_sdk/networking/response/hyphen_response_keys.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'key_api.g.dart';

@RestApi()
abstract class KeyAPI {
  factory KeyAPI(Dio dio, {String? baseUrl}) = _KeyAPI;

  @GET("key/v1/keys")
  Future<HyphenResponseKeys> getKeys();
}
