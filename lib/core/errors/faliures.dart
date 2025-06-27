import 'package:dio/dio.dart';

abstract class Faliures {
  final String errMessage;

  Faliures(this.errMessage);
}

class ServerFaliure extends Faliures {
  ServerFaliure(super.errMessage);

  factory ServerFaliure.fromDioError(DioError dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('connection Timeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFaliure('send Timeout with Apiserver');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Receive Timeout with Apiserver');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
          dioerror.response!.statusCode!,
          dioerror.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFaliure('request to Apiserver was canseld');

      case DioExceptionType.connectionError:
        return ServerFaliure('No internst connection');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains('SocketException')) {
          return ServerFaliure('No internst connection');
        }
        return ServerFaliure('Unexpected error ,please try letar');
      default:
        return ServerFaliure('Opps there was an error,please try again');
    }
  }

  factory ServerFaliure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure('Method not found,please try letar');
    } else if (statusCode == 500) {
      return ServerFaliure('internat server error, please try letar');
    } else {
      return ServerFaliure('Opps there was an error,please try again');
    }
  }
}
