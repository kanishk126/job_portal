import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/util/appStyles.dart';
import 'package:job_portal/util/clipper.dart';
import 'package:job_portal/util/common_function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class CustomBottomSheet extends StatelessWidget {
//   final String companyName;
//   final String companyDescription;
//   final String postName;
//   final String description;
//   final String address;
//   final String image;
//   final void Function() onTap;
//
//
//   CustomBottomSheet({
//     this.companyName = '',
//     this.companyDescription= '',
//     this.postName = '',
//     this.description = '',
//     this.address = '',
//     this.image='',
//     required this.onTap ,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.h,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             bottom: 60.h,
//             // right: 53,
//             left: 35,
//             child: ClipPath(
//               clipper: BottomSheetClipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 100,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 47,
//             left: 27,
//             child: Text(
//             companyName,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 87,
//             left: 27,
//             child: Text(
//               address,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 117,
//             left: 27,
//             child: Text(
//               companyDescription,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 180,
//             left: 27,
//             child: Text('Position',
//               style: Appstyles.textStyle(
//                   fontSize: 14,
//                   color: Colors.grey
//               ),
//             )
//           ),
//           Positioned(
//             top: 210,
//             left: 27,
//             child: Text(
//                   postName,
//                   style: Appstyles.textStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700
//                   ),
//             )
//           ),
//           Positioned(
//               top: 280,
//               left: 27,
//               child: Text('Description',
//                 style: Appstyles.textStyle(
//                     fontSize: 14,
//                     color: Colors.grey
//                 ),
//               )
//           ),
//           Positioned(
//               top: 300,
//               left: 27,
//               child: Container(
//                 width: 90.w,
//                 child: Text(
//                   description,
//                   style: Appstyles.textStyle(
//                     fontSize: 16,
//                     color: AppColors.black,
//                     fontWeight: FontWeight.w600,
//                     height: 3
//                   ),
//                 ),
//               )
//           ),
//           Positioned(
//             top: -39,
//             left: 53,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey.withOpacity(0.2),
//               child: ClipOval(
//                 child: SvgPicture.asset(
//                   image,
//                   fit: BoxFit.contain,
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 8.h,
//             left: 0,
//             right: 0,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: commonButton(
//                 title: 'APPLY NOW',
//                 onTap: onTap,
//                 isIcon: false,
//                 boxShadow: [
//                   BoxShadow(
//                       color: AppColors.primaryColor.withOpacity(0.4),
//                       blurRadius: 4.0,
//                       spreadRadius: 6.0
//                   )
//                 ]
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }


class CustomBottomSheet extends StatelessWidget {
  final String companyName;
  final String companyDescription;
  final String postName;
  final String description;
  final String address;
  final String image;
  final void Function() onTap;

  CustomBottomSheet({
    this.companyName = '',
    this.companyDescription = '',
    this.postName = '',
    this.description = '',
    this.address = '',
    this.image = '',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 60.h,
            left: 35,
            child: ClipPath(
              clipper: BottomSheetClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 47,
            left: 27,
            child: Text(
              companyName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 27,
            child: Text(
              address,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 27,
            child: Text(
              companyDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),

          Positioned(
            top: -39,
            left: 53,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: ClipOval(
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 70,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Position',
                      style: Appstyles.textStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      postName,
                      style: Appstyles.textStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Description',
                      style: Appstyles.textStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      description,
                      style: Appstyles.textStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        height: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: commonButton(
                title: 'APPLY NOW',
                onTap: onTap,
                isIcon: false,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8.0,
                    spreadRadius: 9.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

