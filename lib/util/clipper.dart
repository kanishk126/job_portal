import 'package:flutter/material.dart';

class BottomSheetClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();


    path.lineTo(0, size.height+10);
    var firstStart = Offset(size.width-(size.width/1.02), size.height-50);
    var firstEnd = Offset(size.width/6.5, size.height-50);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);


    var secondStart = Offset(size.width-(size.width/1.5), size.height-48);
    var secondEnd = Offset(size.width-(size.width/1.4), size.height+90);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(0,size.height);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
