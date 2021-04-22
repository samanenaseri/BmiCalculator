import 'package:flutter/material.dart';
import 'package:bmi/screens/top_of_page.dart';

class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

   var firstEndPoint1 = Offset(size.width*0.25, size.height-50);
     var firstcontrolPoint1= Offset(size.width *0.12,size.height -100);
    Path path = Path();

     path.lineTo(0.0, size.height-50);
  // path.lineTo(size.width*0.5, size.height-50);
//     path.quadraticBezierTo(firstcontrolPoint1.dx, firstcontrolPoint1.dy, firstEndPoint1.dx, firstEndPoint1.dy);
//   var secondEndPoint1 = Offset(size.width*0.5, size.height-50);
//   var secondcontrolPoint1= Offset(size.width *0.37,size.height );
//  path.quadraticBezierTo(secondcontrolPoint1.dx, secondcontrolPoint1.dy, secondEndPoint1.dx, secondEndPoint1.dy);
//   var thirdEndPoint1 = Offset(size.width*0.75, size.height-50);
//   var thirdcontrolPoint1= Offset(size.width *0.63,size.height -100);
//   path.quadraticBezierTo(thirdcontrolPoint1.dx, thirdcontrolPoint1.dy, thirdEndPoint1.dx, thirdEndPoint1.dy);
//   var forthEndPoint1 = Offset(size.width, size.height-50);
//   var forthcontrolPoint1= Offset(size.width *0.87,size.height );
//   path.quadraticBezierTo(forthcontrolPoint1.dx, forthcontrolPoint1.dy, forthEndPoint1.dx, forthEndPoint1.dy);
  path.lineTo(size.width, size.height-50);
   path.lineTo(size.width, 0);
     path.close();
     return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }

  }
