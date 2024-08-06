
import 'package:dio/dio.dart';
import 'package:job_portal/model/company_detail_model.dart';

class ApiProvider {
  final Dio _dio = Dio();


  final String apiUrl = 'https://jsonplaceholder.typicode.com/albums/1/photos';




  Future funGetAllData() async {
    try {
      Response response = await _dio.get(apiUrl);
      if(response.statusCode == 200){
        final List<dynamic> data = response.data;
        return data.map((json) => CompanyDetailModel.fromJson(json)).toList();
      }
    } catch (error) {
      throw Exception('Something went wrong $error');
    }
  }
}