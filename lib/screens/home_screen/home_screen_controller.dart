import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_portal/api_provider/api_provider.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/company_detail_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenController extends GetxController {
  final GlobalKey <ScaffoldState> key = GlobalKey();
  RxBool isLoading = false.obs;
  RxList<bool> isApplied = <bool>[].obs;
  RxInt currentIndex = 0.obs;
  RxDouble height = RxDouble(35.0);
  RxDouble width = RxDouble(55.0);
  RxList<CompanyDetailModel> details = <CompanyDetailModel>[].obs;
  RxList<CompanyDetailModel> filteredDetails = <CompanyDetailModel>[].obs; // List for search results
  RxString searchQuery = RxString(''); // Observable search query
  final storage = GetStorage();
  String description = 'On a Mac with Apple silicon: Choose Apple menu  > Shut Down, press and hold the power button until “Loading startup options” appears, select Options, click Continue, then follow the onscreen instructions. On a Mac with Apple silicon: Choose Apple menu  > Shut Down, press and hold the power button until “Loading startup options” appears, select Options, click Continue, then follow the onscreen instructions.';

  @override
  void onInit() {
    super.onInit();
    getData();
    filteredDetails.value = details;
  }

  void increaseHandW(){
    height.value = height.value == 35 ? 40 : 35;
    width.value = width.value == 55 ? 80.w : 55;
    filteredDetails.value = details;
  }

  void filterDetails(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDetails.value = details;
    } else {
      filteredDetails.value = details.where((job) =>
          job.title!.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
  }

  void appliedList(int length) {
    isApplied.value = List<bool>.filled(length, false);
  }

  void storeStatus(int index) {
    if (index >= 0 && index < isApplied.length) {
      isApplied[index] = true;
      storage.write('isApplied', isApplied);
    }
  }

  void clearData() {
    storage.remove('isApplied');
    appliedList(details.length);
  }

  void getData() async {
    isLoading.value = true;
    try {
      final data = await ApiProvider().funGetAllData();
      details.assignAll(data);
      appliedList(details.length);
      List<dynamic>? status = storage.read<List<dynamic>>('isApplied');
      if (status != null && status.length == details.length) {
        isApplied.value = List<bool>.from(status);
      }
      print('Fetched details: ${details[0].title}');
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      isLoading.value = false;
    }
  }

  String limitToTwoWords(String text) {
    final words = text.split(' ');
    return words.length <= 2 ? text : '${words[0]} ${words[1]}';
  }
}
