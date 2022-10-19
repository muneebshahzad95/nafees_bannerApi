import 'package:dio/dio.dart';

class ApiClass{
  static Response? response;
  static Dio dio= Dio();
  static String post ="Post";
  static String Base_url = "https://nafeesonline.trecsol.com/api/";

  static Future<Response?> nafeesApi ({required String path,required String apiType})async{
    switch(apiType){
      case 'Post':
        response = await dio.post(Base_url+path);

        return response;
      case 'Get':
        response = await dio.get(Base_url+path);
        return response;
      default:
        response = await dio.get(Base_url+path);
        return response;
    }
  }
}