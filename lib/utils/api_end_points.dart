class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;
  // for android emulator only
  static const String BASE_URL = 'http://10.0.2.2:8000/api/v1';
  static const String BASE_URL_FOR_IMAGES = 'http://10.0.2.2:8000';

  // for iOS emulator and physical device
  //static const String BASE_URL = "http://127.0.0.1:8000/api/v1";

  static const String POPULAR_PRODUCT_END_POINT = "/products/popular";

  static const String DRINKS_URL = "/products/drinks";

  static const String RECOMMENDED_PRODUCT_END_POINT = "/products/recommended";

  static const String TOKEN = "";

  static const String PHONE = "";
  static const String PASSWORD = "";

  static const String SIGNUP_END_POINT = "/auth/register";
  static const String LOGIN_END_POINT = "/auth/login";
  static const String USER_INFO_END_POINT = "/customer/info";
  static const String USER_ADDRESS = "user_address";
  static const String ADD_USER_ADDRESS_END_POINT = "/customer/address/add";
  static const String USER_ADDRESS_LIST_END_POINT = "/customer/address/list";

  static const String GEOCODE_END_POINT = "/config/geocode-api";
  static const String ZONE_END_POINT = "/config/get-zone-id";
  static const String SEARCH_LOCATION_END_POINT =
      "/config/place-api-autocomplete";
  static const String PLACE_DETAILS_END_POINT = "/config/place-api-details";

  static const String CART_LIST = "cart-list";

  static const String CART_HISTORY_LIST = "cart-history-list";

  static const String UPLOAD_URL = "/uploads/";
}
