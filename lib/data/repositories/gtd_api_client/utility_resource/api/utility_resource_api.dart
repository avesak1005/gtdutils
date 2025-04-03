import 'package:dio/dio.dart';
import 'package:gtd_utils/data/network/gtd_json_parser.dart';
import 'package:gtd_utils/data/network/network.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/utility_resource/models/response/gtd_financial_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/utility_resource/models/response/gtd_financial_sumary_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/utility_resource/models/response/gtd_header_summary_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/utility_resource/utility_resource.dart';
import 'package:gtd_utils/data/repositories/gtd_repository_error/gtd_api_error.dart';

import '../../booking_resource/booking_resource.dart';

class UtilityResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;
  GTDEnvType b2bEnvType = GTDEnvType.AgentAPI;

  UtilityResourceApi._();
  static final shared = UtilityResourceApi._();

  Future<GtdNotificationsRs> getNotificationItems(
      {required String userRefcode, int page = 0, required GtdNotifySenderMethod senderMethod}) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getListNotifications(envType, userRefcode));
      networkRequest.queryParams = {
        "page": page,
        "size": 15,
        "sort": "schedule,desc",
        "senderMethod": senderMethod.rawValue
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdNotificationsRs notificationsRs = JsonParser.jsonToModel(GtdNotificationsRs.fromJson, response.data);
      return notificationsRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getNotificationItems: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<int> getCountUnreadNotifications({required String userRefcode}) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getCountUnreadNotifications(envType, userRefcode));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final result = response.data as Map<String, dynamic>?;
      return (result?["count"] as int?) ?? 0;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getNotificationItems: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdInvoiceSumaryResponse> getInvoiceSumary({required String userRefcode}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getInvoiceSumary(envType));
      networkRequest.queryParams = {"userRefCode": userRefcode};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInvoiceSumaryResponse invoiceSumaryResponse =
          JsonParser.jsonToModel(GtdInvoiceSumaryResponse.fromJson, response.data);
      return invoiceSumaryResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getInvoiceSumary: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdInvoiceHistoryRs> getInvoiceHistories({required String userRefcode, int page = 0}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getInvoiceHistories(envType));
      List<String> status = ["SUCCESS", "PENDING", "FAILED", "CREATED", "SIGNING", "SIGNFAILED"];

      networkRequest.queryParams = {
        "userRefCode": userRefcode,
        "page": page,
        "size": 20,
        "sort": "createdDate,desc",
        "isAdminIssue": "false",
        "approvedStatuses": status.join(","),
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInvoiceHistoryRs invoiceHistoryRs = JsonParser.jsonToModel(GtdInvoiceHistoryRs.fromJson, response.data);
      return invoiceHistoryRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getInvoiceHistories: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<void> registerDeviceToken({required String userRefcode, required String fcmToken}) async {
    try {
      var body = {"userRefCode": userRefcode, "token": fcmToken};
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.post, enpoint: GtdUtilityEndpoint.registerDeviceToken(envType), data: body);

      networkService.request = networkRequest;
      await networkService.execute();
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error registerDeviceToken: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdFinancialSumaryRs> getAgencySumaryTransactions(String agencyCode) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getSumaryTransactions(b2bEnvType));
      networkRequest.queryParams = {"agencyCode": agencyCode};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdFinancialSumaryRs result = JsonParser.jsonToModel(GtdFinancialSumaryRs.fromJson, response.data);
      return result;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getAgencySumaryTransactions: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdFinancialRs>> getAgencyTransactions() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getAgencyTransactions(b2bEnvType));
      networkRequest.queryParams = {"size": 2000, "page": 0, "sort": "id,asc"};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdFinancialRs> result = JsonParser.jsonArrayToModel(GtdFinancialRs.fromJson, response.data);
      return result;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getAgencyTransactions: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<SearchBookingRs> getBookingTransactions(SearchBookingRq request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: GtdUtilityEndpoint.getBookingTransactions(b2bEnvType),
      );
      networkRequest.queryParams = request.toB2BRequest();
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      SearchBookingRs result = JsonParser.jsonToModel(SearchBookingRs.fromJson, response.data["page"]);
      return result;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getBookingTransactions: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdHeaderSummaryRs> getHeaderSummary() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: GtdUtilityEndpoint.getHeaderSummary(b2bEnvType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHeaderSummaryRs result = JsonParser.jsonToModel(GtdHeaderSummaryRs.fromJson, response.data);
      return result;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getHeaderSummary: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
