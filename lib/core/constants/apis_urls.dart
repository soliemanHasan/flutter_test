/// class [ApisUrls] contains all URLs to external services, services,
/// or APIs, according to the following figure
///
/// add new APIs URL in this way:
/// EX: static const String {verb}featureName = '$_baseApiUrl/{route}';

class ApisUrls {
  /// [_baseUrl] base server url
  static const String _baseUrl = 'https://qondos.net';
  /// [_baseApiUrl] base API url
  static const String _baseApiUrl = '$_baseUrl/api';

  /// [_baseImagesUrl] base Images Url
  static const String _baseImagesUrl = '$_baseUrl/uploads';
  static String baseImagesUrl(String url) => '$_baseImagesUrl/$url';

  /// Auth Feature APIs
  static const String register = '$_baseApiUrl/technicans/sign-up';

  /// Category Feature APIs
  static const String getCategories='$_baseApiUrl/categories';
  static String getSubCategories(int? id) =>
      '$_baseApiUrl/categories/$id';
}
