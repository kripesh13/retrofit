
import 'package:api_call_with_retrofit/network_response/status.dart';

class ApiResponse<T> {
  DataStatus dataStatus;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.dataStatus);

  ApiResponse.loading() : dataStatus = DataStatus.Loading;
  ApiResponse.completed(this.data) : dataStatus = DataStatus.Completed;
  ApiResponse.error(this.message) : dataStatus = DataStatus.Error;

  @override
  String toString() {
    return "message: $message, data: $data, status: $dataStatus";
  }
}
