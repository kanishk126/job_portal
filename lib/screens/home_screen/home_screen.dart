import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/screens/home_screen/home_screen_controller.dart';
import 'package:job_portal/util/appStyles.dart';
import 'package:job_portal/util/assets.dart';
import 'package:job_portal/util/common_function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../util/appColors.dart';

class HomeScreen extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.white,
                AppColors.gray
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(height: 15.h),
                    SvgPicture.asset(Assets.menuIcon,
                      height: 20,
                      width: 20,
                    ),
                    Spacer(),
                    Container(
                      height: 35,
                      width: 55,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                      color: AppColors.white,
                        borderRadius: BorderRadius.circular(17)
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(Assets.searchIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                commonText(text: "Find Your Dream Job Today",
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),
                Obx(
                  ()=> ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.details.length,
                    separatorBuilder: (context,position){
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (context,index){
                      return Container(
                        height: 10.h,
                        padding: EdgeInsets.only(left: 15,right: 15),
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
                            SizedBox(width: 3.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                commonText(
                                  text: controller.limitToTwoWords(controller.details[index].title.toString()),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  // textOverFlow: TextOverflow.ellipsis
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  width: 200,
                                  child: commonText(
                                      text: controller.details[index].title.toString(),
                                      maxLine: 1,
                                      textOverFlow: TextOverflow.ellipsis
                                ))
                              ],
                            ),
                            // SizedBox(width: 3.w),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryColor.withOpacity(0.4),
                                    blurRadius: 2.0,
                                    spreadRadius: 4.0
                                  )
                                ]
                              ),
                              child: SvgPicture.asset(Assets.applyIcon,
                                height: 50,
                                width: 50,
                                color: AppColors.primaryColor,
                                // colorBlendMode: BlendMode.softLight,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}