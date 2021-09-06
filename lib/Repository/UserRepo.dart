import 'package:school_app/DataModel/User.dart';

class UserRepo{

  static Future<User> authenticate(String mobile, String pass) async{

    return await Future.delayed(Duration(seconds: 3)).then((value){
      if(mobile=="2" && pass=="1"){
      Map<String, dynamic> _res = {"id": 1, "name":"hassan", "family":"hassani", "mobile":"123456", "type":1, "active":1 , "token":"6hrFDATxrG9w14QY9"};
      return User.fromJson(_res);

      }
      throw Exception('mobile/password was wrong');
    });
  }

  static Future<User> verifyByToken(String token) async{

    return await Future.delayed(Duration(seconds: 3)).then((value){
      if(token == "6hrFDATxrG9w14QY9"){
        Map<String, dynamic> _res = {"id": 1, "name":"hassan", "family":"hassani", "mobile":"123456", "type":1, "active":1 , "token":""};
        return User.fromJson(_res);

      }
      throw Exception('mobile/password was wrong');
    });
  }




}