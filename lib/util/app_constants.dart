// import '../data/model/response/language_model.dart';
import 'images.dart';

class AppConstants {
  //https://www.grihshobha.in/wp-json/api/v3/homepage
  static const String BASE_URL = 'https://www.grihshobha.in';
  static const String SPLASH_TEXT_1 = 'Welcome!';
  static const String SPLASH_TEXT_2 = 'One Planet College app Demo text !';
  static const String SPLASH_TEXT_3 = 'Multi Store';
  static const String APP_NAME = 'One Planet College';
  static const double APP_VERSION = 1.0;

  static const String HEADER_ID = '012sw8909klo';
  static const String LOCALIZATION_KEY = 'X-localization';

  static const String getstory_URI = '/wp-json/api/v3/getstory/';
  static const String REGISTER_URI = '/register';
  static const String LOGIN_URI = '/login';
  static const String SEARCH_URI = '/wp-json/api/v3/homepage';
  static const String RESET_PASSWORD_URI = '/reset-password';
  static const String FORGET_PASSWORD_URI = '/forgot-password';
  static const String VERIFY_TOKEN_URI = '/verify-token';
  static const String TOKEN_URI = '/token';
  static const String TERMS_AND_CONDITIONS_URI = '/terms-and-conditions';
  static const String PRIVACY_POLICY_URI = '/privacy-policy';
  static const String CATEGORY_URI = '/api/v1/categories';
  static const String ABOUT_US_URI = '/api/v1/about-us';
  static const String CANCELATION_URI = '/api/v1/cancelation';
  static const String REFUND_URI = '/api/v1/refund';

  // Shared Key
  static const String THEME = 'OnePlanet_theme';
  static const String TOPIC = 'all_zone_customer';
  static const String Course = 'Course';
  static const String TOKEN = 'OnePlanet_token';
  static const String COUNTRY_CODE = 'OnePlanet_country_code';
  static const String LANGUAGE_CODE = 'OnePlanet_language_code';
  static const String USER_PASSWORD = 'OnePlanet_user_password';
  static const String USER_ADDRESS = 'OnePlanet_user_address';
  static const String USER_NUMBER = 'OnePlanet_user_number';
  static const String USER_COUNTRY_CODE = 'OnePlanet_user_country_code';
  static const String NOTIFICATION = 'OnePlanet_notification';
  static const String NOTIFICATION_COUNT = 'OnePlanet_notification_count';
  static const String INTRO = 'OnePlanet_intro';
  // static List<LanguageModel> languages = [
  //   LanguageModel(imageUrl: Images.english, languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   // LanguageModel(imageUrl: Images.arabic, languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
  //   LanguageModel(imageUrl: Images.hindi, languageName: 'हिंदी', countryCode: 'IN', languageCode: 'hi'),
  // ];
}
