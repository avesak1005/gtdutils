import 'package:dio/dio.dart';
import 'package:gtd_utils/constants/app_const.dart';
import 'package:gtd_utils/data/network/gtd_json_parser.dart';
import 'package:gtd_utils/data/network/network.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/booking_resource/booking_api_endpoint.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/booking_resource/models/request/search_booking_rq.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/booking_resource/models/response/list_membership_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/booking_resource/models/response/search_booking_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_repository_error/gtd_api_error.dart';

/// API Client for call API
class BookingResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = AppConst.shared.envType;
  CancelToken cancelToken = CancelToken();

  BookingResourceApi._();
  static final shared = BookingResourceApi._();

  void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("cancelled");
    }
  }

  Future<SearchBookingRs> searchMyBooking(SearchBookingRq searchBookingRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.searchMyBooking(envType),
        queryParams: searchBookingRq.toJson(),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      // SearchBookingRs searchBookingRs = SearchBookingRs.fromJson(response.data);
      SearchBookingRs searchBookingRs = JsonParser.jsonToModel(SearchBookingRs.fromJson, response.data);
      return searchBookingRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error searchMyBooking: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<SearchBookingRs> searchListMyBooking(SearchBookingRq searchBookingRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.searchListBooking(envType),
        queryParams: searchBookingRq.toJson(),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      // SearchBookingRs searchBookingRs = SearchBookingRs.fromJson(response.data);
      List<BookingInfoElement> bookingInfos = JsonParser.jsonArrayToModel(BookingInfoElement.fromJson, response.data);
      SearchBookingRs searchBookingRs = SearchBookingRs(content: bookingInfos);
      searchBookingRs.last = bookingInfos.isEmpty;
      return searchBookingRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error searchListMyBooking: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<DataMembershipRs>> getListMembershipRs(
      {String? domainName, int? page, int? size, dynamic objectName}) async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      queryParams['domain_name'] = domainName ?? 'air_member_card';
      queryParams['page'] = page ?? 0;
      queryParams['size'] = size ?? 1000;
      queryParams['object_name'] = objectName ?? '';
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.getMembership(envType),
        queryParams: queryParams,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      List<DataMembershipRs> listMembershipRs = JsonParser.jsonArrayToModel(DataMembershipRs.fromJson, response.data);
      return listMembershipRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getListMembershipRs: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<DataMembershipRs>> getListVNCities() async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      queryParams['domain_name'] = 'destination';
      queryParams['lookupType'] = 'vn';
      queryParams['page'] = 0;
      queryParams['size'] = 1000;
      queryParams['object_name'] = 'region';
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.getMembership(GTDEnvType.AgentAPI),
        queryParams: queryParams,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      List<DataMembershipRs> listMembershipRs = JsonParser.jsonArrayToModel(DataMembershipRs.fromJson, response.data);
      return listMembershipRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getListVNCities: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<BookingDetailRs> getBookingDetailByBookingNumber(String bookingNumber) async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      queryParams['booking_number'] = bookingNumber;
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.getBookingDetai(envType),
        queryParams: queryParams,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      // BookingDetailRs bookingDetailRs = BookingDetailRs.fromJson(response.data);
      BookingDetailRs bookingDetailRs = JsonParser.jsonToModel(BookingDetailRs.fromJson, response.data);
      return bookingDetailRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getBookingDetailByBookingNumber: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<BookingDetailRs> getFinalBookingDetail(String bookingNumber) async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      queryParams['booking_number'] = bookingNumber;
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: BookingApiEndpoint.finalBookingDetail(envType),
        queryParams: queryParams,
      );
      networkRequest.connectTimeout = 120;
      networkRequest.receiveTimeout = 120;
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      // BookingDetailRs bookingDetailRs = BookingDetailRs.fromJson(response.data);
      BookingDetailRs bookingDetailRs = JsonParser.jsonToModel(BookingDetailRs.fromJson, response.data);
      return bookingDetailRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getFinalBookingDetail: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<String> additionalRequest(Map<String, Object?> additionalRequest) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: BookingApiEndpoint.additionalRequest(envType), data: additionalRequest);
      networkRequest.connectTimeout = 120;
      networkRequest.receiveTimeout = 120;
      networkService.request = networkRequest;
      await networkService.execute(cancelToken: cancelToken);
      return "success";
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error additionalRequest: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
