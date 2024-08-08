import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/screens/home_screen/home_screen_controller.dart';
import 'package:job_portal/util/appStyles.dart';
import 'package:job_portal/util/assets.dart';
import 'package:job_portal/util/auth_services.dart';
import 'package:job_portal/util/bottomsheet.dart';
import 'package:job_portal/util/common_function.dart';
import 'package:job_portal/util/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../util/appColors.dart';

class HomeScreen extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: Obx(
        ()=> Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(controller.photo.value,
                      height: 70,
                        width: 70,
                      ),
                    ),
                    SizedBox(width: 2.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(text: controller.name.value,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        ),
                        SizedBox(height: 1.h,),
                        Container(
                          width: 42.w,
                          child: commonText(
                            text: controller.email.value,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            textOverFlow: TextOverflow.clip
                          ),
                        )

                      ],
                    ),
                      ],
                    ),
                const Spacer(),
                commonButton(
                    title: 'Log Out',
                    onTap: (){
                      AuthServices().signOut();
                      controller.clearData();
                    },
                    isIcon: false
                )
              ],
            ),
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.white,
                AppColors.gray,
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Obx(
          ()=> Stack(
            children: [
              controller.isLoading.value == false ?
              Positioned.fill(
                top: 25.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(()=> ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.filteredDetails.length,
                            separatorBuilder: (context,position){
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (context,index){
                              final job = controller.filteredDetails[index];
                              return Container(
                                height: 10.h,
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.gray.withOpacity(.2)
                                      ),
                                      child: Center(
                                        child: Image.network(controller.details[index].thumbnailUrl.toString(),
                                          height: 25,
                                          width: 25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){
                                        Get.bottomSheet(
                                          barrierColor: AppColors.gray.withOpacity(0.7),
                                          isScrollControlled: true,
                                          CustomBottomSheet(
                                            image: Assets.googleIcon,
                                            companyName: 'Google LLc',
                                            address: 'Silicon Valley, CA',
                                            companyDescription: "Tech Based Company and Producer",
                                            postName: "Ui/Ux Designer",
                                            description: controller.description,
                                            onTap: (){
                                              controller.storeStatus(index);
                                              Get.back();
                                              Get.snackbar(
                                                  '',
                                                  '',
                                                  backgroundColor: AppColors.green.withOpacity(0.7),
                                                  titleText: commonText(
                                                      text: 'Successful',
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                  messageText: commonText(
                                                      text: 'Job Applied Successfully',
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                  snackPosition: SnackPosition.BOTTOM
                                              );
                                            },
                                          ),
                                          backgroundColor: AppColors.white,
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          commonText(
                                            text: controller.limitToTwoWords(job.title.toString()),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            // textOverFlow: TextOverflow.ellipsis
                                          ),
                                          Container(
                                            width: 200,
                                            child: commonText(
                                                text: controller.details[index].title.toString(),
                                                maxLine: 1,
                                                textOverFlow: TextOverflow.ellipsis
                                          ))
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: 3.w),
                                    Obx(()=> DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: controller.isApplied[index] ? AppColors.green.withOpacity(0.4) :
                                              AppColors.primaryColor.withOpacity(0.4),
                                              blurRadius: 2.0,
                                              spreadRadius: 4.0
                                            )
                                          ]
                                        ),
                                        child: SvgPicture.asset(Assets.applyIcon,
                                          height: 35,
                                          width: 35,
                                          color: controller.isApplied[index] ? AppColors.green : AppColors.primaryColor,
                                          // colorBlendMode: BlendMode.softLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ):Positioned(
                top: 47.h,
                left: 44.w,
                right: 44.w,
                bottom: 47.h,
                child: const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: (){
                          controller.key.currentState!.openDrawer();
                          print('tap');
                        },
                        child: SvgPicture.asset(Assets.menuIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        ()=> AnimatedContainer(
                          height: controller.height.value,
                          width: controller.width.value,
                          padding: EdgeInsets.only(right: controller.width.value == 80.w ? 0 : 10),
                          decoration: BoxDecoration(
                              color: controller.width.value == 80.w ? AppColors.gray : AppColors.white,
                              borderRadius: BorderRadius.circular(13)
                          ),
                          duration: const Duration(milliseconds: 300),
                          child: InkWell(
                            onTap: (){
                              controller.increaseHandW();
                            },
                            child: controller.width.value == 80.w ?
                                Container(
                                  height: controller.height.value,
                                  width: controller.width.value,
                                  child: TextField(
                                    onChanged: (value) => controller.filterDetails(value),
                                    decoration: Appstyles.inputDecoration(
                                      hintText: 'Search for jobs',
                                      suffixIcon: InkWell(
                                        onTap: (){
                                          controller.increaseHandW();
                                        },
                                          child: const Icon(Icons.search)
                                      ),
                                    ),
                                  ),
                                ):
                            Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(Assets.searchIcon,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15.h,
                  left: 0,
                  right: 0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:commonText(text: "Find Your Dream Job Today",
                          fontSize: 40,
                          fontWeight: FontWeight.w700
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}