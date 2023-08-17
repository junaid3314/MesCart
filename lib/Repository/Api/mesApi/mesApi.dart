import 'dart:convert';


import 'package:http/http.dart';




import '../../modelclass/mesSigninModelclass.dart';
import '../../modelclass/mesSignupModelclass.dart';
import '../../modelclass/profileAddressModelclass.dart';
import 'api_client.dart';


class meskartApi{
  ApiClient apiClient = ApiClient();


  Future<MesSignupModelclass> getmeskart(String userName,String email,String phone,String password,) async {
    String trendingpath = '/auth/local/sign-up';
    var body = {
      "username":userName,
      "email":email,
      "password":password,
      "phone":phone,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSignupModelclass.fromJson(jsonDecode(response.body));
  }
  Future<MesSigninModelclass> getmessignin(String email,String password,) async {
    String trendingpath = '/auth/local/sign-in';
    var body = {
      "email":email,
      "password":password,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSigninModelclass.fromJson(jsonDecode(response.body));
  }
   getresetpswd({required String newpassword,required String oldpassword,}) async {
    String trendingpath = '/user/reset-password';
    var body = {
      "newPassword": newpassword,
      "oldPassword": oldpassword

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'PUT', jsonEncode(body));


  }
  getresetprfl(String username,String email,String phone, ) async {
    String trendingpath = '/user/update';
    var body = {
      "username":username,
      "email":email,
      "phone":phone,
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'PATCH', jsonEncode(body));
  }
  getCreateSellerAc(String name,String contactNumber,String aadhar,String email,
      String collegeName,String collegePlace,String course,String academicYear,
      String admissionNumber,String storePin ) async {
    String trendingpath = '/seller/account/create';
    var body = {
      "shopname":name,
      "phone":contactNumber,
      "aadhaarNumber":aadhar,
      "email":email,
      "collegename":collegeName,
      "collegeplace":collegePlace,
      "course":course,
      "academicyear":academicYear,
      "admissionnumber":admissionNumber,
      "pin":storePin,
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));
  }
  getaddAddress(String fullname,String phonenumber,String pincode,String state,String city,String houseNoOrBuildingName,
      String roadname,String landmark,String addressType ) async {
    String trendingpath = '/user/add-delivery-address';
    var body = {
      "fullName": fullname,
      "phone_numbers": [phonenumber],
      "pincode": pincode,
      "state": state,
      "city":city,
      "houseOrBuildingNumber": houseNoOrBuildingName,
      "roadNameOrArea": roadname,
      "landmark": landmark,
      "type": addressType
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));
  }
  Future<ProfileAddressModelclass> getProfileAddress() async {
    String trendingpath = '/user/profile';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return ProfileAddressModelclass.fromJson(jsonDecode(response.body));
  }
  getDeleteAddress(String addressId) async {
    String trendingpath = '/user/remove-delivery-address/$addressId';
    var body = {
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'DELETE', jsonEncode(body));
  }


}