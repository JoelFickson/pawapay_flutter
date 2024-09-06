import 'package:get_it/get_it.dart';

class PawapayBaseService {
  static final PawapayBaseService _instance = PawapayBaseService._internal();

  factory PawapayBaseService() {
    return _instance;
  }

  PawapayBaseService._internal();

  static void register() {
    GetIt.I
        .registerLazySingleton<PawapayBaseService>(() => PawapayBaseService());
  }

  String formatPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceFirst(RegExp(r'^[+0]'), '');
  }

  /// Checks if a given response is a PawaPayNetworkResponse.
  ///
  /// This function attempts to determine if an unknown input
  /// conforms to the PawaPayNetworkResponse interface by checking for the presence
  /// and type of specific properties. Specifically, it checks for the properties
  /// `errorMessage`, `statusCode`, and `errorObject`, and verifies that these properties
  /// are of the correct types (String for `errorMessage` and `errorObject`, and int
  /// for `statusCode`).
  ///
  /// @param response The response object to check. Its type is dynamic
  ///                 to allow for any input, as the purpose of this function
  ///                 is to perform runtime type checking.
  /// @returns True if the input object matches the PawaPayNetworkResponse interface,
  ///          otherwise false.
  bool isPawaPayErrorResponse(dynamic response) {
    if (response is Map<String, dynamic>) {
      final hasErrorMessage = response.containsKey('errorMessage') &&
          response['errorMessage'] is String;
      final hasStatusCode =
          response.containsKey('statusCode') && response['statusCode'] is int;
      final hasErrorObject = response.containsKey('errorObject') &&
          response['errorObject'] is String;

      return hasErrorMessage && hasStatusCode && hasErrorObject;
    }

    return false;
  }
}
