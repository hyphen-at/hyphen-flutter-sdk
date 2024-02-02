import 'package:hyphen_flutter_sdk/src/core/common/key/hyphen_public_key.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_approve.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_edit_device.dart';
import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_retry_2fa.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'device_api.g.dart';

@RestApi(baseUrl: "base_url_here")
abstract class DeviceAPI {
  factory DeviceAPI(Dio dio, {String baseUrl}) = _DeviceAPI;

  @PUT("device/v1/devices/{publicKey}")
  Future<void> editDevice(
    @Path("publicKey") HyphenPublicKey publicKey,
    @Body() HyphenRequestEditDevice requestPayload,
  );

  @PUT("device/v1/2fa/{id}")
  Future<void> retry2FA(
    @Path("id") String id,
    @Body() HyphenRequestRetry2FA requestPayload,
  );

  @DELETE("device/v1/2fa/{id}")
  Future<void> deny2FA(@Path("id") String id);

  @POST("/device/v1/2fa/{id}/approve")
  Future<void> approve2FA(
    @Path("id") String id,
    @Body() HyphenRequest2FAApprove requestPayload,
  );
}
