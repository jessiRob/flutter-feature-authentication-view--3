import 'package:invoice_tracker/widgets/login_form.dart';
import 'package:invoice_tracker/widgets/register_form.dart';

class UserService {
  getUserUuid(){
    if (user!=null){
      return user.uid;
    } else{
      return userLog.uid;
    }
  }
  getUserName(){
    if (user!=null){
      return user.name;
    } else{
      return userLog.name;
    }
  }
  getUserEmail(){
    if (user!=null){
      return user.email;
    } else{
      return userLog.email;
    }
  }
  getUserPassword(){
    if (user!=null){
      return user.password;
    } else{
      return userLog.password;
    }
  }
}