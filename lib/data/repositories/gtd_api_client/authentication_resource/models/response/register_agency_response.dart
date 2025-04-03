import 'package:gtd_utils/data/cache_helper/models/gtd_user_info.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';

import '../../../air_tickets_resource/models/response/gtd_error_rs.dart';
import '../../../air_tickets_resource/models/response/gtd_info_rs.dart';

class RegisterAgencyResponse extends GtdResponse {
  bool? actived;
  AgencyFullProfile? agencyTO;
  RegisterAgencyResponse(
      {this.agencyTO, this.actived, super.duration, super.textMessage, super.errors, super.infos, super.success});
  factory RegisterAgencyResponse.fromJson(Map<String, dynamic> json) => RegisterAgencyResponse(
        agencyTO: json["result"]?["agencyTO"] == null ? null : AgencyFullProfile.fromJson(json["result"]["agencyTO"]),
        actived: json["result"]?["actived"] ?? false, // Default to false if null
        duration: json["duration"] ?? 0, // Default to 0 if null
        errors: json["errors"] == null ? [] : List<ErrorRs>.from(json["errors"].map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? [] : List<InfoRs>.from(json["infos"].map((x) => InfoRs.fromJson(x))),
        success: json["success"] ?? false, // Default to false if null
        textMessage: json["textMessage"] ?? '', // Default to empty string if null
      );

  Map<String, dynamic> toJson() => {
        "result": agencyTO?.toJson(),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}
