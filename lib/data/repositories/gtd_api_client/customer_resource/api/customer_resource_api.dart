import 'package:dio/dio.dart';
import 'package:gtd_utils/constants/app_const.dart';
import 'package:gtd_utils/data/network/gtd_app_logger.dart';
import 'package:gtd_utils/data/network/gtd_json_parser.dart';
import 'package:gtd_utils/data/network/network_service/gtd_dio_exception.dart';
import 'package:gtd_utils/data/network/network_service/gtd_environment.dart';
import 'package:gtd_utils/data/network/network_service/gtd_network_request.dart';
import 'package:gtd_utils/data/network/network_service/gtd_network_service.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/gtd_customer_endpoint.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_company_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_repository_error/gtd_api_error.dart';

/// API Client for call API
class CustomerResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = AppConst.shared.envType;
  GTDEnvType b2bEnvType = GTDEnvType.AgentAPI;

  CustomerResourceApi._();
  static final shared = CustomerResourceApi._();

  Future<List<GtdSavedTravellerRs>> getSavedTravellers() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdCustomerEndpoint.getSavedTravellers(envType));
      networkRequest.queryParams = {"page": 0, "size": 300};
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedTravellerRs> savedTravelers =
          JsonParser.jsonArrayToModel(GtdSavedTravellerRs.fromJson, response.data);
      return savedTravelers;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdSavedCompanyRs>> getSavedCompanies(String userRefCode) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdCustomerEndpoint.getSavedCompanies(envType));
      networkRequest.queryParams = {"userRefCode": userRefCode};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedCompanyRs> savedCompanies = JsonParser.jsonArrayToModel(GtdSavedCompanyRs.fromJson, response.data);
      return savedCompanies;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdSavedTravellerRs>> getSavedCustomers() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdCustomerEndpoint.getSavedCustomers(b2bEnvType));
      networkRequest.queryParams = {"page": 0, "size": 2000, "sort": "id,desc", "status": "ACTIVATED"};
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedTravellerRs> savedTravelers =
          JsonParser.jsonArrayToModel(GtdSavedTravellerRs.fromJson, response.data);
      return savedTravelers;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdSavedTravellerRs>> updateCustomers(List<GtdSavedTravellerRs> travellers) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.put, enpoint: GtdCustomerEndpoint.updateCustomers(envType), data: travellers);

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedTravellerRs> savedTravelers =
          JsonParser.jsonArrayToModel(GtdSavedTravellerRs.fromJson, response.data);
      return savedTravelers;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<bool> deleteCustomer(String customerId) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.delete, enpoint: GtdCustomerEndpoint.deleteCustomer(b2bEnvType, customerId));

      networkService.request = networkRequest;
      await networkService.execute();
      return true;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
