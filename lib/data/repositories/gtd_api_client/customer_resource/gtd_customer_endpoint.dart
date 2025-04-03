import 'package:gtd_utils/data/network/network_service/gtd_end_points.dart';
import 'package:gtd_utils/data/network/network_service/gtd_environment.dart';

class GtdCustomerEndpoint extends GtdEndpoint {
  GtdCustomerEndpoint({required super.env, required super.path});
  static const String kSavedTravellers = '/api/customers/travellers';
  static const String kSavedCompanies = '/utilitysrv/api/approval-invoices/saved-business';
  static const String kSavedCustomers = '/api/customers';
  static const String kUpdateCustomer = '/api/customers/air-customer-travellers-collection';

  static GtdEndpoint getSavedTravellers(GTDEnvType envType) {
    const path = kSavedTravellers;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getSavedCompanies(GTDEnvType envType) {
    const path = kSavedCompanies;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getSavedCustomers(GTDEnvType envType) {
    const path = kSavedCustomers;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateCustomers(GTDEnvType envType) {
    const path = kUpdateCustomer;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint deleteCustomer(GTDEnvType envType, String customerId) {
    const path = kSavedCustomers;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$customerId");
  }
}
