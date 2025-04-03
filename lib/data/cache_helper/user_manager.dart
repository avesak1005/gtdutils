import 'package:collection/collection.dart';
import 'package:gtd_utils/data/cache_helper/cache_helper.dart';
import 'package:gtd_utils/data/cache_helper/models/gtd_account_hive.dart';
import 'package:gtd_utils/data/cache_helper/models/gtd_user_info.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/meta_resource/models/response/gtd_country_code_rs.dart';
import 'package:gtd_utils/utils/gtd_widgets/gtd_call_back.dart';
import 'package:rxdart/rxdart.dart';

import '../repositories/gtd_api_client/authentication_resource/models/response/account_response.dart';
import '../repositories/gtd_api_client/booking_resource/models/response/list_membership_rs.dart';

class UserManager {
  UserManager._();
  final localeStream = BehaviorSubject<String>.seeded('vi');
  String get cachedLanguage => CacheHelper.shared.getCachedLanguage();
  String get token => CacheHelper.shared.getCachedAppToken();
  List<GtdCountryCodeRs> countries = [];
  List<DataMembershipRs> cities = [];
  static final shared = UserManager._();
  final isLoggedInStream = BehaviorSubject<bool>.seeded(false);
  late GtdCallback<String> bookingResultWebViewCallback;
  late GtdVoidCallback popToHomeCallback;

  String? username;
  String? password;

  String? get angencyCode {
    return userInfo?.agencyFullProfile?.agentProfiles?.first.agencyCode;
  }

  GtdAccountHive? _currentAccount;

  GtdAccountHive? get currentAccount => _currentAccount;

  GtdUserInfo? userInfo;
  AccountResponse? accountInfo;

  setLoggedIn(bool isLoggedIn) {
    isLoggedInStream.add(isLoggedIn);
  }

  setLocale(String locale) {
    localeStream.add(locale);
  }

  Future<void> saveAppToken(String token) async {
    await CacheHelper.shared.cacheAppToken('Bearer $token');
  }

  Future<void> cacheUserData(GtdAccountHive accountData) async {
    // await CacheHelper.cacheObject<GtdAccountHive>(
    //   accountData,
    //   cacheStorageType: CacheStorageType.accountBox,
    // );
    await CacheHelper.shared.saveSharedObject(accountData.toMap(), key: CacheStorageType.accountBox.name);
    await getAccountData();
  }

  Future<GtdAccountHive?> getAccountData() async {
    final account = CacheHelper.shared.loadSavedObject(GtdAccountHive.fromMap, key: CacheStorageType.accountBox.name);
    _currentAccount = account;
    if (account != null) {
      isLoggedInStream.add(true);
    }
    return _currentAccount;
  }

  Future<void> removeAccountData() async {
    this.userInfo = null;
    CacheHelper.shared.removeCachedSharedObject(CacheStorageType.accountBox.name);
  }

  GtdCountryCodeRs? countryFromCode(String code) {
    GtdCountryCodeRs? countryCodeRs = countries.firstWhereOrNull((value) => value.code == code);
    return countryCodeRs;
  }

  Future<void> saveUserInfo(GtdUserInfo userInfo) async {
    this.userInfo = userInfo;
    await CacheHelper.shared.saveSharedObject(userInfo.toJson(), key: CacheStorageType.userInfo.name);
    await getAccountData();
  }

  Future<GtdUserInfo?> loadUserInfo() async {
    final userInfo = CacheHelper.shared.loadSavedObject(GtdUserInfo.fromJson, key: CacheStorageType.userInfo.name);
    this.userInfo = userInfo;
    if (userInfo != null) {
      isLoggedInStream.add(true);
    }
    return userInfo;
  }
}
