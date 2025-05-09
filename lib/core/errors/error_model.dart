import 'package:api_handling/core/api/end_points.dart';

class ErrorModel {
  // depends on the response from backend api

  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  // to converts the Json coming from response to my model
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    // must the Strings Below be same as in the response ("status and ErrorMessage")
    return ErrorModel(
        status: jsonData[ApiKey.status],
        errorMessage: jsonData[ApiKey.errorMessage]);
  }
}
