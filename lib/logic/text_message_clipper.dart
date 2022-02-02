import 'package:flutter/cupertino.dart';

class TextMessageClipper extends CustomClipper<Path>{
  final bool isSender ;
  TextMessageClipper({required this.isSender});

  @override
  Path getClip(Size size) {
    var path = Path();
    double pathCurve = 12 ;

   if (isSender) {      /// for shaping the container based on the message owner
                        /// type which can be the sender of the message or not

     path.lineTo(0, size.height);
     path.lineTo(size.width-pathCurve, size.height);
     path.lineTo(size.width-pathCurve, pathCurve);
     path.quadraticBezierTo(size.width-pathCurve, pathCurve, size.width, 0);
   }else {
     path.quadraticBezierTo(pathCurve, 0, pathCurve, pathCurve);
     path.lineTo(pathCurve, size.height);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width, 0);
   }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}