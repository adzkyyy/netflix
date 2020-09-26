import 'package:flutter/rendering.dart';
import 'package:netflix/widget/bgColor.dart';


class BackgroundLogin extends CustomPainter{

  BackgroundLogin()
   : pinkPaint = Paint()
    ..color = BgColor.pink
    ..style = PaintingStyle.fill,
    orenPaint = Paint()
    ..color = BgColor.oren
    ..style = PaintingStyle.fill,
    amberPaint = Paint()
    ..color = BgColor.amber
    ..style = PaintingStyle.fill,
    pinkCerahPaint = Paint()
    ..color = BgColor.pinkCerah
    ..style = PaintingStyle.fill;

  final Paint pinkPaint;
  final Paint orenPaint;
  final Paint amberPaint;
  final Paint pinkCerahPaint;

   @override
  void paint(Canvas canvas, Size size) {
    print(size);
    paintPink(canvas, size);

  }

  void paintPink (Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.quadraticBezierTo(
      size.width / 2, 
      0,
      size.width,
      size.height/2, 
    );

    canvas.drawPath(path, pinkPaint);
  }


   @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
  void _addPointToPath (Path path, List<Point> points){

    if(points.length < 3){
      throw UnsupportedError ('test');
    }

    for (var i = 0; i < points.length - 2; i++){
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }
    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x, 
      points[points.length - 1].y);
  }
}
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
