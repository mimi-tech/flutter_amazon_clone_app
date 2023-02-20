
import 'package:amazon_clone_new/Models/new_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {


  Future<bool> saveUser(NewUser user) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userId',user.userId ?? "");
    prefs.setString('firstName',user.firstName ?? "");
    prefs.setString('email',user.email ?? "");
    prefs.setString('lastName',user.lastName ?? "");
    prefs.setString('password',user.password ?? "");


    return prefs.commit();

  }



  Future<NewUser> getUser ()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String userId = prefs.getString("userId") ?? "";
    String firstName = prefs.getString("firstName") ?? "";
    String email = prefs.getString("email") ?? "";
    String lastName = prefs.getString("lastName") ?? "";
    String password = prefs.getString("password") ?? "";


    return NewUser(
        userId: userId,
        firstName: firstName,
        email: email,
        lastName: lastName,
        password: password,

    );

  }





  void saveAuthId(String userId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('amazonCloneUserId',userId);
  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('firstName');
    prefs.remove('email');
    prefs.remove('lastName');
    prefs.remove('password');




  }



  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("amazonCloneUserId") ?? "";
    return userId;
  }

}