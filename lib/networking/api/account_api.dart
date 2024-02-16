import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:hyphen_flutter_sdk/networking/response/hyphen_response_my_account.dart';

part 'account_api.g.dart';

@RestApi()
abstract class AccountAPI {
  factory AccountAPI(Dio dio, {String? baseUrl}) = _AccountAPI;

  @GET("account/v1/me")
  Future<HyphenResponseMyAccount> getMyAccount();
}
