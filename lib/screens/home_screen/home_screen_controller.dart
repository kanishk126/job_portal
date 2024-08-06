import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:job_portal/api_provider/api_provider.dart';
import 'package:job_portal/model/company_detail_model.dart';

class HomeScreenController extends GetxController{

  RxBool isLoading = RxBool(false);
  var details = RxList<CompanyDetailModel>([]);


  @override
  void onInit() {
    getData();
    super.onInit();
  }



  void getData() async{
    try{
      final data = await ApiProvider().funGetAllData();
      details.assignAll(data);
    }catch(error){
      print(error);
    }
  }


  String limitToTwoWords(String text) {
    final words = text.split(' ');
    if (words.length <= 2) {
      return text; // Return the original text if it has 2 or fewer words
    }
    return '${words[0]} ${words[1]}'; // Return only the first two words
  }


}