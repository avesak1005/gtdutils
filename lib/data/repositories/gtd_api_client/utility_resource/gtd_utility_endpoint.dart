import 'package:gtd_utils/data/network/network.dart';

class GtdUtilityEndpoint extends GtdEndpoint {
  GtdUtilityEndpoint({required super.env, required super.path});
  static const String kNotifiMessages = "/utilitysrv/api/get-notify-message-with-page";
  static const String kNotifiMessagesUnreadCount = "/utilitysrv/api/get-count-unread-notify-message";
  static const String kInvoiceSumary = "/utilitysrv/api/approval-invoices/sumary-by-month";
  static const String kInvoiceHistories = "/utilitysrv/api/approval-invoices/history";
  static const String kRegisterToken = "/utilitysrv/api/notify-mobile-tokens";
  static const String kB2BAgencyTransactions = "/api/_search/agency-transactions";
  static const String kB2BSumaryTransactions = "/pricingsrv/api/_sum/total-agency-transactions";
  static const String kB2BBookingTransactions = "/api/_search/booking-transactions";
  static const String kB2BHeaderSummary = "/api/header-summary";

  static GtdEndpoint getListNotifications(GTDEnvType envType, String userRefcode) {
    const path = kNotifiMessages;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$userRefcode");
  }

  static GtdEndpoint getCountUnreadNotifications(GTDEnvType envType, String userRefcode) {
    const path = kNotifiMessagesUnreadCount;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$userRefcode");
  }

  static GtdEndpoint getInvoiceSumary(GTDEnvType envType) {
    const path = kInvoiceSumary;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getInvoiceHistories(GTDEnvType envType) {
    const path = kInvoiceHistories;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint registerDeviceToken(GTDEnvType envType) {
    const path = kRegisterToken;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getSumaryTransactions(GTDEnvType envType) {
    const path = kB2BSumaryTransactions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAgencyTransactions(GTDEnvType envType) {
    const path = kB2BAgencyTransactions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getBookingTransactions(GTDEnvType envType) {
    const path = kB2BBookingTransactions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getHeaderSummary(GTDEnvType envType) {
    const path = kB2BHeaderSummary;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
