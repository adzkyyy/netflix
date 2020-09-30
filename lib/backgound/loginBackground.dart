import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/widget/bgColor.dart';
import 'dart:math';
import 'dart:ui';


class BackgroundLogin extends CustomPainter{

  BackgroundLogin({
    Animation<double> animation,
  })
   : blackPaint = Paint()
    ..color = BgColor.black
    ..style = PaintingStyle.fill,
    orenPaint = Paint()
    ..color = BgColor.oren
    ..style = PaintingStyle.fill,
    amberPaint = Paint()
    ..color = BgColor.amber
    ..style = PaintingStyle.fill,
    pinkCerahPaint = Paint()
    ..color = BgColor.pinkCerah
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4,
    liquidAnim = CurvedAnimation(
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeInBack,
      parent: animation,
    ),
    orenAnim = CurvedAnimation(
      parent: animation, 
      curve: const Interval(
        0, 
        0.7, 
        curve: Interval(
          0, 
          0.8, 
          curve: SpringCurve()),
       ),
       reverseCurve: Curves.linear,
    ),
    blackAnim = CurvedAnimation(
      parent: animation, 
      curve: const Interval(
        0, 
        0.10,
        curve: Interval(
          0, 
          0.9, 
          curve: SpringCurve())
      ),
      reverseCurve: Curves.easeInCirc,
    ),
    amberAnim = CurvedAnimation(
      parent: animation, 
      curve: const SpringCurve(),
      reverseCurve: Curves.easeInCirc,
    ),
    super(repaint: animation);
    

  final Animation<double> liquidAnim;
  final Animation<double> blackAnim;
  final Animation<double> orenAnim;
  final Animation<double> amberAnim;

  final Paint blackPaint;
  final Paint orenPaint;
  final Paint amberPaint;
  final Paint pinkCerahPaint;

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
      points[points.length - 1].y,);
  }

   @override
  void paint(Canvas canvas, Size size) {

    print('Paint');

    paintPink(canvas, size);

    paintOren(canvas, size);

    paintAmber(size, canvas);

  }

  void paintPink (Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0, 
      lerpDouble(0, size.height, blackAnim.value)
    );
    _addPointToPath(
      path, 
      [
        Point(
          lerpDouble(0, size.width /3, blackAnim.value),
          lerpDouble(0, size.height, blackAnim.value)
        ),
        Point(
          lerpDouble(size.width /2, size.width /4 * 3, liquidAnim.value),
          lerpDouble(size.height /2, size.height /4 * 3, liquidAnim.value)
        ),
        Point(
          size.width,
          lerpDouble(size.height / 2, size.height * 3/4  , liquidAnim.value)
        ),
      ]
    );
    canvas.drawPath(path, blackPaint);
  }

  void paintOren (Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0, 
      lerpDouble(size.height / 4, size.height /2, orenAnim.value)
    );
    _addPointToPath(
      path, 
      [
        Point(
          size.width / 4,
          lerpDouble(size.height /2, size.height * 3/4, liquidAnim.value)
        ),
        Point(
          size.width* 3/5,
          lerpDouble(size.height /4, size.height / 2, liquidAnim.value)
        ),
        Point(
          size.width * 4/5,
          lerpDouble(size.height /6, size.height / 3, orenAnim.value)
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, orenAnim.value)
        ),
      ]
    );
    canvas.drawPath(path, orenPaint);
  }

  void paintAmber (Size size, Canvas canvas){
    if (amberAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3/4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, amberAnim.value) 
      );

      _addPointToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 4,
          0,
        ),
      ]);
      canvas.drawPath(path, amberPaint);
    }
  }


   @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}