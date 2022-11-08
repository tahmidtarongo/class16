import 'Data.dart';

/// success : true
/// message : "User login successfully!"
/// data : {"user_id":20,"token":"47|dCIMzkvCn9FyVA7Ox6aY1kD8zif3PvcxnvjSHsSM","name":"Prince Mahmud","email":"p@z.com","phone":"0174632983462","refer":null}

class SignInModel {
  SignInModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SignInModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SignInModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SignInModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}