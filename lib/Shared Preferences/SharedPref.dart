import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
static SharedPreferences ? sharedPref ;
static init() async {
  sharedPref = await SharedPreferences.getInstance();
}
static Future<bool?> putBool({required String? key , required bool? value ,}) async {
return await  sharedPref?.setBool( key!,value! );
  
}
static bool? getBool({required String? key })  {
  return   sharedPref?.getBool(key!);

}
static Future<bool?> saveData({@required String? key , @required dynamic value}) async{
  if (value is String){
    return await sharedPref?.setString(key!, value);}
  if (value is int){return await sharedPref?.setInt(key!, value);}
  if (value is bool){return await sharedPref?.setBool(key!, value);}

  return await sharedPref?.setDouble(key!, value);
}
static dynamic getData({required String?key}){
  return   sharedPref?.get(key!);
}

}