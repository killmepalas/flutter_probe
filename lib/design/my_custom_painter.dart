import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(size.width / 2, size.height - size.height - 100);
    final p2 = Offset(size.width / 2, size.height + 100);
    final paint = Paint()
      ..color = Color.fromARGB(27, 0, 0, 0)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class TapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 154, 123, 212)
      ..strokeWidth = 35
      ..style = PaintingStyle.stroke;

    final a = Offset(size.width * 1 / 4, size.height * 1 / 4);
    final b = Offset(size.width * 3 / 4, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);

    canvas.drawRect(rect, paint);

    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;
    final path_right = Path()
      ..moveTo(size.width * 3 / 4, size.height * 1 / 4)
      ..lineTo(size.width * 7 / 8, size.height * 1 / 4)
      ..lineTo(size.width * 13 / 16, size.height)
      ..lineTo(size.width * 7 / 8, size.height + size.height * 3 / 4)
      ..lineTo(size.width * 3 / 4, size.height + size.height * 3 / 4)
      ..close();

    canvas.drawPath(path_right, paint);

    final path_left = Path()
      ..moveTo(size.width * 1 / 4, size.height * 1 / 4)
      ..lineTo(size.width * 1 / 8, size.height * 1 / 4)
      ..lineTo(size.width * 3 / 16, size.height)
      ..lineTo(size.width * 1 / 8, size.height + size.height * 3 / 4)
      ..lineTo(size.width * 1 / 4, size.height + size.height * 3 / 4)
      ..close();

    canvas.drawPath(path_left, paint);

    paint.color = Color.fromARGB(255, 62, 34, 114);
    final path_left_min = Path()
      ..moveTo(size.width * 1 / 4, size.height + size.height * 3 / 4)
      ..lineTo(size.width * 9 / 40, size.height + size.height * 5 / 16)
      ..lineTo(size.width * 1 / 4, size.height + size.height * 5 / 16)
      ..close();

    canvas.drawPath(path_left_min, paint);

    final path_right_min = Path()
      ..moveTo(size.width * 3 / 4, size.height + size.height * 3 / 4)
      ..lineTo(size.width * 31 / 40, size.height + size.height * 5 / 16)
      ..lineTo(size.width * 3 / 4, size.height + size.height * 5 / 16)
      ..close();

    canvas.drawPath(path_right_min, paint);

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: 'BENEDICT',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(size.width * 3 / 8, 0);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
