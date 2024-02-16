import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:hyphen_flutter_sdk/networking/request/hyphen_request_sign.dart';
import 'package:hyphen_flutter_sdk/networking/response/hyphen_sign_result.dart';

part 'sign_api.g.dart';

@RestApi()
abstract class SignAPI {
  factory SignAPI(Dio dio, {String? baseUrl}) = _SignAPI;

  @POST("sign/v1/cadence/transaction")
  Future<HyphenSignResult> signTransactionWithServerKey(@Body() HyphenRequestSign requestPayload);

  @POST("sign/v1/cadence/paymaster")
  Future<HyphenSignResult> signTransactionWithPayMasterKey(@Body() HyphenRequestSign requestPayload);
}
