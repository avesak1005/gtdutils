import 'package:gtd_utils/data/network/network.dart';

class AuthenticationAPIEndpoint extends GtdEndpoint {
  AuthenticationAPIEndpoint({required super.env, required super.path});

  static const String kLogIn = '/api/authenticate';
  static const String kLogOut = '/api/account/log-out';
  static const String kDeleteAccount = '/api/account/delete-current-account';
  static const String kForgotPassword = '/api/account/reset-password/init';
  static const String kForgotPasswordB2B = '/api/account/reset_password/init';
  static const String kAccountInfo = '/api/account';
  static const String kSocialSignup = '/api/social/signup';
  static const String kRegister = '/api/register';
  static const String kShortProfile = '/api/profile/short';
  static const String kCustomerProfile = '/customersrv/api/customer-profiles';
  static const String kCustomerTraveller = '/customersrv/api/customer-travellers';
  static const String kCustomerAvatar = '/customersrv/api/customer-avatars/profile';
  static const String kVerifyPassword = '/api/account/verify-current-password';
  static const String kChangePassword = '/api/account/change-password';
  static const String kChangePasswordB2B = '/api/account/change_password';
  static const String kUpdateTraveller = '/customersrv/api/customer-travellers-collection';
  static const String kUpdateCustomer = '/customersrv/api/customer-profiles';

  //B2B Endpoint
  // static const String kLogInB2B = '/api/authenticate-v2';
  static const String kLogInB2B = '/api/authenticate';
  static const String kAgencyProfile = '/api/user-profiles';
  static const String kAgencyAvatarProfile = '/agentsrv/api/agent-avatars/findByProfileId';
  static const String kUpdateAgencyAvatar = '/agentsrv/api/agent-avatars';
  static const String kAgencyFullProfile = '/api/agencies';
  static const String kUpdateAgencyProfile = '/api/agencies/common-info';
  static const String kAgencyRegister = '/api/agencies/register';

  static GtdEndpoint logIn(GTDEnvType envType) {
    const path = kLogIn;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint forgotPassword(GTDEnvType envType) {
    const path = kForgotPassword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint forgotPasswordB2B(GTDEnvType envType) {
    const path = kForgotPasswordB2B;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint socialSignup(GTDEnvType envType) {
    const path = kSocialSignup;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAccountInfo(GTDEnvType envType) {
    const path = kAccountInfo;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateAccountInfo(GTDEnvType envType) {
    const path = kAccountInfo;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint logOut(GTDEnvType envType) {
    const path = kLogOut;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint deleteAccount(GTDEnvType envType) {
    const path = kDeleteAccount;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint register(GTDEnvType envType) {
    const path = kRegister;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint shortProfile(GTDEnvType envType) {
    const path = kShortProfile;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerAvatar(GTDEnvType envType, int profileId) {
    String path = '$kCustomerAvatar/$profileId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerProfile(GTDEnvType envType, int profileId) {
    String path = '$kCustomerProfile/$profileId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerTraveller(GTDEnvType envType, int travellerId) {
    String path = '$kCustomerTraveller/$travellerId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint changePassword(GTDEnvType envType) {
    const path = kChangePassword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint changePasswordB2B(GTDEnvType envType) {
    const path = kChangePasswordB2B;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint veryfyPassword(GTDEnvType envType) {
    const path = kVerifyPassword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateTraveller(GTDEnvType envType) {
    const path = kUpdateTraveller;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateCustomer(GTDEnvType envType) {
    const path = kUpdateCustomer;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  //B2B
  static GtdEndpoint logInB2B(GTDEnvType envType) {
    const path = kLogInB2B;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint registerB2B(GTDEnvType envType) {
    const path = kAgencyRegister;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAgencyProfile(GTDEnvType envType) {
    const path = kAgencyProfile;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAgencyFullProfile(GTDEnvType envType, String agencyId) {
    String path = '$kAgencyFullProfile/$agencyId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAgencyAvatarProfile(GTDEnvType envType, String agencyId) {
    String path = '$kAgencyAvatarProfile/$agencyId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateAgencyAvatar(GTDEnvType envType) {
    String path = kUpdateAgencyAvatar;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateAgencyProfile(GTDEnvType envType) {
    const path = kUpdateAgencyProfile;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
