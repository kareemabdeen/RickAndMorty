import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/constants.dart';

class CharacterswebServices {
  var dio = Dio();

  CharacterswebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: kBasicUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
    );
    dio = Dio(options);
   
  }

  //charcter

  Future<Map<String, dynamic>> getAllCharactersRequest() async {
    try {
      Response response = await dio.get('character');
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
