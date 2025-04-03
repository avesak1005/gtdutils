import 'package:gtd_utils/data/network/gtd_app_logger.dart';
import 'package:gtd_utils/data/network/models/wrapped_result/result.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/api/customer_resource_api.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_company_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';
import 'package:gtd_utils/data/repositories/gtd_repository_error/gtd_api_error.dart';
import 'package:gtd_utils/helpers/extension/string_extension.dart';

class GtdCustomerRepository {
  final CustomerResourceApi customerResourceApi = CustomerResourceApi.shared;

  GtdCustomerRepository._();
  static final shared = GtdCustomerRepository._();

  Future<Result<List<GtdSavedTravellerRs>, GtdApiError>> getSavedTravellers() async {
    try {
      //Filter invalid traveller: firstname and lastname is empty
      final response = await customerResourceApi.getSavedTravellers();
      var filteredTravellers =
          response.where((element) => !element.firstName.isNullOrEmpty() && !element.surName.isNullOrEmpty()).toList();
      return Success(filteredTravellers);
    } on GtdApiError catch (e) {
      Logger.e("getSavedTravellers: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdSavedCompanyRs>, GtdApiError>> getSavedCompanies(String userRefCode) async {
    try {
      final response = await customerResourceApi.getSavedCompanies(userRefCode);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getSavedCompanies: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdSavedTravellerRs>, GtdApiError>> getSavedCustomers() async {
    try {
      final response = await customerResourceApi.getSavedCustomers();
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getSavedCustomers: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdSavedTravellerRs>, GtdApiError>> updateCustomers(List<GtdSavedTravellerRs> travellers) async {
    try {
      final response = await customerResourceApi.updateCustomers(travellers);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("updateCustomers: $e");
      return Error(e);
    }
  }

  Future<Result<bool, GtdApiError>> deleteCustomer(String customerId) async {
    try {
      final response = await customerResourceApi.deleteCustomer(customerId);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("deleteCustomer: $e");
      return Error(e);
    }
  }
}
