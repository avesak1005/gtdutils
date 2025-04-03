import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gtd_utils/constants/app_const.dart';
import 'package:gtd_utils/data/cache_helper/cache_helper.dart';
import 'package:gtd_utils/data/cache_helper/models/gtd_user_info.dart';
import 'package:gtd_utils/data/network/gtd_app_logger.dart';
import 'package:gtd_utils/data/network/gtd_json_parser.dart';
import 'package:gtd_utils/data/network/network_service/gtd_dio_exception.dart';
import 'package:gtd_utils/data/network/network_service/gtd_environment.dart';
import 'package:gtd_utils/data/network/network_service/gtd_network_request.dart';
import 'package:gtd_utils/data/network/network_service/gtd_network_service.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/authentication_resource.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/agency_register_request.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/change_password_request.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/login_social_requests.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/register_request.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/update_customer_request.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/request/update_traveller_request.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/account_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/agent_avatar_profile_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_avatar_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_profile_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_traveller_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/register_agency_response.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/short_profile_response.dart';
import 'package:gtd_utils/data/repositories/gtd_repository_error/gtd_api_error.dart';

import '../../air_tickets_resource/models/response/gtd_error_rs.dart';

class AuthenticationResourceAPI {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = AppConst.shared.envType;
  GTDEnvType b2bEnvType = GTDEnvType.AgentAPI;
  CancelToken cancelToken = CancelToken();

  AuthenticationResourceAPI._();

  static final shared = AuthenticationResourceAPI._();

  void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("cancelled");
    }
  }

  Future<LogInResponse> logInWithSocial(LoginSocialRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.socialSignup(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      LogInResponse logInResponse = JsonParser.jsonToModel(LogInResponse.fromJson, response.data);
      return logInResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<dynamic> forgotPassword(String emailOrPhone) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.forgotPassword(envType),
        data: emailOrPhone,
        headers: {
          'Content-Type': 'text/plain',
        },
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return Future.value(response);
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<dynamic> forgotPasswordB2B(String emailOrPhone) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.forgotPasswordB2B(b2bEnvType),
        data: emailOrPhone,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'text/plain',
          'Accept-Encoding': 'gzip, deflate, br',
        },
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return Future.value(response);
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<LogInResponse> logIn(LogInRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.logIn(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      LogInResponse logInResponse = JsonParser.jsonToModel(LogInResponse.fromJson, response.data);
      return logInResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AccountResponse> getAccountInfo() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.getAccountInfo(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AccountResponse accountResponse = JsonParser.jsonToModel(AccountResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getAccountInfo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<bool> updateAccountInfo(AccountResponse accountInfo) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: AuthenticationAPIEndpoint.updateAccountInfo(envType), data: accountInfo);
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      // AccountResponse accountResponse = JsonParser.jsonToModel(AccountResponse.fromJson, response.data);
      return true;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error updateAccountInfo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> logOut() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.logOut(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logOut: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> deleteAccount() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.delete,
        enpoint: AuthenticationAPIEndpoint.deleteAccount(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logOut: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> register(RegisterRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.register(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error register: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<ShortProfileResponse> getShortProfile() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.shortProfile(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      ShortProfileResponse accountResponse = JsonParser.jsonToModel(ShortProfileResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getShortProfile: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerAvatarResponse> getCustomerAvatar(int profileId) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerAvatar(envType, profileId),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerAvatarResponse accountResponse = JsonParser.jsonToModel(CustomerAvatarResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerAvatar: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerProfileResponse> getCustomerProfile(int profileId) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerProfile(envType, profileId),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerProfileResponse accountResponse = JsonParser.jsonToModel(CustomerProfileResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerProfile: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerTravellerResponse> getCustomerTraveller(
    int travellerId,
  ) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerTraveller(
          envType,
          travellerId,
        ),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerTravellerResponse accountResponse =
          JsonParser.jsonToModel(CustomerTravellerResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerTraveller: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> changePassword(ChangePasswordRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.changePassword(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error changePassword: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> verifyPassword(String oldPassword) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: AuthenticationAPIEndpoint.veryfyPassword(b2bEnvType),
          data: oldPassword,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'text/plain',
            'Accept-Encoding': 'gzip, deflate, br',
            'Authorization': CacheHelper.shared.getCachedAppToken()
          });
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error changePassword: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> changePasswordB2B(String newPassword) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: AuthenticationAPIEndpoint.changePasswordB2B(b2bEnvType),
          data: newPassword,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'text/plain',
            'Accept-Encoding': 'gzip, deflate, br',
            'Authorization': CacheHelper.shared.getCachedAppToken()
          });
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error changePassword: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> updateTraveller(UpdateTravellerRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.put,
        enpoint: AuthenticationAPIEndpoint.updateTraveller(envType),
        data: [request.toJson()],
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error updateTraveller: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> updateCustomer(UpdateCustomerRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.put,
        enpoint: AuthenticationAPIEndpoint.updateCustomer(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error updateCustomer: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  //B2B
  Future<LogInResponse> logInB2B(LogInRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.logInB2B(b2bEnvType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      LogInResponse logInResponse = JsonParser.jsonToModel(LogInResponse.fromJson, response.data);
      return logInResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      var errors = e.response?.data?["errors"];
      if (errors != null && errors.isNotEmpty) {
        List<ErrorRs> parsedErrors =
            (errors as List<dynamic>).map((e) => ErrorRs.fromJson(e as Map<String, dynamic>)).toList();
        throw GtdApiError.fromErrorsJson(parsedErrors);
      } else {
        GtdDioException dioException = GtdDioException.fromDioError(e);
        throw GtdApiError(message: dioException.message);
      }
      // GtdDioException dioException = GtdDioException.fromDioError(e);
      // throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.fromErrorsJson(e);
      // throw GtdApiError.handleObjectError(e);
    }
  }

  Future<RegisterAgencyResponse> registerB2B(AgencyRegisterRq request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.registerB2B(b2bEnvType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      RegisterAgencyResponse agencyResponse =
          JsonParser.jsonToModel(RegisterAgencyResponse.fromJson, response.data['result']);
      return agencyResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AgencyShortProfile> getAgencyProfile() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: AuthenticationAPIEndpoint.getAgencyProfile(b2bEnvType));
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AgencyShortProfile agencyShortProfile = JsonParser.jsonToModel(AgencyShortProfile.fromJson, response.data);
      return agencyShortProfile;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AgencyFullProfile> getAgencyFullProfile(String agencyId) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: AuthenticationAPIEndpoint.getAgencyFullProfile(b2bEnvType, agencyId));
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AgencyFullProfile agencyProfile = JsonParser.jsonToModel(AgencyFullProfile.fromJson, response.data);
      return agencyProfile;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<AgentAvatarProfileRs>> getAgencyAvatar(String agencyId) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: AuthenticationAPIEndpoint.getAgencyAvatarProfile(b2bEnvType, agencyId));
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      List<AgentAvatarProfileRs> agencyProfiles =
          JsonParser.jsonArrayToModel(AgentAvatarProfileRs.fromJson, response.data);
      return agencyProfiles;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      // GtdDioException dioException = GtdDioException.fromDioError(e);
      // throw GtdApiError(message: dioException.message);
      return [];
    } catch (e) {
      Logger.e("Error logIn: $e");
      // throw GtdApiError.handleObjectError(e);
      return [];
    }
  }

  Future<void> updateAgencyAvatar(String agencyId, Uint8List file) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: AuthenticationAPIEndpoint.updateAgencyAvatar(b2bEnvType), file: file);
      networkRequest.queryParams = {"profileId": agencyId, "mineType": "jpeg"};
      networkService.request = networkRequest;
      final Response response = await networkService.uploadMedia(cancelToken: cancelToken);
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      // GtdDioException dioException = GtdDioException.fromDioError(e);
      // throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      // throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AgencyFullProfile> updateAgencyProfile(AgencyFullProfile agencyProfile) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.put, enpoint: AuthenticationAPIEndpoint.updateAgencyProfile(b2bEnvType), data: agencyProfile);
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AgencyFullProfile agencyShortProfile = JsonParser.jsonToModel(AgencyFullProfile.fromJson, response.data);
      return agencyShortProfile;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
