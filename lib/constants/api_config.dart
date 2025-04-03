// https://www.bambooairways.com/vn/vi/book/booking-information/fare-rules
// https://www.vietjetair.com/en/pages/fare-rules-1607053453722
// https://www.vietnamairlines.com/vn/vi/legal/conditions-of-carriage

class ApiClientConfig {
  static String baseUrl = 'https://uat-api.gotadi.com';
  static String termsAndConditionsUrl = 'https://gotadi.com/customer/terms-conditions';
  static String termsAirlineName = 'https://www.vietnamairlines.com/vn/vi/legal/conditions-of-carriage';

  static String termsAirline(String supplierCode) {
    if (supplierCode == "VJ") {
      return "https://www.vietjetair.com/en/pages/fare-rules-1607053453722";
    }
    if (supplierCode == "QH") {
      return "https://www.bambooairways.com/vn/vi/book/booking-information/fare-rules";
    }
    if (supplierCode == "VN") {
      return "https://www.vietnamairlines.com/vn/vi/legal/conditions-of-carriage";
    }
    return "";
  }
}
