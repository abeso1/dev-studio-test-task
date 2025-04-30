import 'dart:math';
import 'dart:ui' as ui;
import 'package:dev_studio_test_task/core/style/colors.dart';
import 'package:dev_studio_test_task/core/style/text_style.dart';
import 'package:flutter/material.dart';

class ZodiacWheel extends StatefulWidget {
  final DateTime selectedDate;

  const ZodiacWheel({super.key, required this.selectedDate});

  @override
  State<ZodiacWheel> createState() => _ZodiacWheelState();
}

class _ZodiacWheelState extends State<ZodiacWheel>
    with SingleTickerProviderStateMixin {
  late String selectedSign;
  late AnimationController _controller;
  final Map<String, ui.Image> zodiacImages = {};
  ui.Image? centerImage;

  // TODO: Implement zodiac class together with images and date
  // range for each sign
  final List<String> zodiacSigns = [
    'Leo',
    'Virgo',
    'Libra',
    'Scorpius',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
  ];

  @override
  void initState() {
    super.initState();
    selectedSign = getZodiacSign(widget.selectedDate);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller.forward();

    _loadAllImages();
  }

  // Loads all zodiac images from assets and center image
  Future<void> _loadAllImages() async {
    final futures = zodiacSigns.map(
      (sign) => _loadImage('assets/images/zodiac/$sign.png').then((img) {
        zodiacImages[sign] = img;
      }),
    );
    await Future.wait(futures);
    centerImage = await _loadImage('assets/images/zodiac/center.png');
    setState(() {});
  }

  Future<ui.Image> _loadImage(String asset) async {
    final byteData = await DefaultAssetBundle.of(context).load(asset);
    final codec = await ui.instantiateImageCodec(byteData.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  void didUpdateWidget(ZodiacWheel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      final newSign = getZodiacSign(widget.selectedDate);

      if (newSign != selectedSign) {
        setState(() {
          selectedSign = newSign;
          _controller.forward(from: 0);
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (zodiacImages.length < zodiacSigns.length || centerImage == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 305,
      width: 305,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: ZodiacWheelPainter(
              zodiacSigns: zodiacSigns,
              selectedSign: selectedSign,
              highlightProgress: _controller.value,
              images: zodiacImages,
              centerImage: centerImage!,
            ),
          );
        },
      ),
    );
  }

  String getZodiacSign(DateTime date) {
    final int month = date.month;
    final int day = date.day;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'Aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'Taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'Gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'Cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'Leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'Virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'Libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return 'Scorpius';
    }
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return 'Sagittarius';
    }
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return 'Capricorn';
    }
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return 'Aquarius';
    }
    return 'Pisces';
  }
}

class ZodiacWheelPainter extends CustomPainter {
  final List<String> zodiacSigns;
  final String selectedSign;
  final double highlightProgress;
  final Map<String, ui.Image> images;
  final ui.Image centerImage;

  ZodiacWheelPainter({
    required this.zodiacSigns,
    required this.selectedSign,
    required this.highlightProgress,
    required this.images,
    required this.centerImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final middleRadius = outerRadius * 0.6;
    final innerRadius = outerRadius * 0.4;
    final labelRadius = outerRadius * 0.44;
    final anglePerSign = 2 * pi / zodiacSigns.length;

    final basePaint =
        Paint()
          ..color = const Color(0xFFF9F8F6)
          ..style = PaintingStyle.fill;

    final borderPaint =
        Paint()
          ..color = lightGreyColor
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

    final tickerPaint =
        Paint()
          ..color = lightGreyColor.withValues(alpha: 0.4)
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, outerRadius, basePaint);
    canvas.drawCircle(center, outerRadius, borderPaint);
    canvas.drawCircle(center, middleRadius, borderPaint);
    canvas.drawCircle(center, innerRadius, borderPaint);

    for (int i = 0; i < zodiacSigns.length; i++) {
      final startAngle = i * anglePerSign;
      final startX = center.dx + outerRadius * cos(startAngle);
      final startY = center.dy + outerRadius * sin(startAngle);
      final endX = center.dx + innerRadius * cos(startAngle);
      final endY = center.dy + innerRadius * sin(startAngle);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), borderPaint);

      if (zodiacSigns[i] == selectedSign) {
        final path = Path();
        path.moveTo(
          center.dx + innerRadius * cos(startAngle),
          center.dy + innerRadius * sin(startAngle),
        );
        path.arcTo(
          Rect.fromCircle(center: center, radius: outerRadius),
          startAngle,
          anglePerSign,
          false,
        );
        path.arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngle + anglePerSign,
          -anglePerSign,
          false,
        );
        path.close();

        final gradient = RadialGradient(
          colors: [
            lightGreyColor.withValues(alpha: 0.3 * highlightProgress),
            lightGreyColor.withValues(alpha: 0.0),
          ],
          stops: [innerRadius / outerRadius, 1.0],
        );

        final rect = Rect.fromCircle(center: center, radius: outerRadius);
        final paint =
            Paint()
              ..shader = gradient.createShader(rect)
              ..style = PaintingStyle.fill;

        canvas.drawPath(path, paint);
      }

      final textAngle = startAngle + anglePerSign / 2;
      final imageOffset = Offset(
        center.dx + (middleRadius + outerRadius) / 2 * cos(textAngle),
        center.dy + (middleRadius + outerRadius) / 2 * sin(textAngle),
      );

      final zodiacImage = images[zodiacSigns[i]];
      if (zodiacImage != null) {
        final imageRect = Rect.fromCenter(
          center: imageOffset,
          width: 24,
          height: 24,
        );
        paintImage(
          canvas: canvas,
          rect: imageRect,
          image: zodiacImage,
          fit: BoxFit.contain,
        );
      }

      for (int j = 1; j < 12; j++) {
        final tickAngle = startAngle + j * (anglePerSign / 12);
        final tickStart = Offset(
          center.dx + (outerRadius - 8) * cos(tickAngle),
          center.dy + (outerRadius - 8) * sin(tickAngle),
        );
        final tickEnd = Offset(
          center.dx + outerRadius * cos(tickAngle),
          center.dy + outerRadius * sin(tickAngle),
        );
        canvas.drawLine(tickStart, tickEnd, tickerPaint);
      }
    }

    final centerImageSize = labelRadius * 2;
    final centerRect = Rect.fromCenter(
      center: center,
      width: centerImageSize,
      height: centerImageSize,
    );
    paintImage(
      canvas: canvas,
      rect: centerRect,
      image: centerImage,
      fit: BoxFit.cover,
    );

    // Add selected sign text over the center image
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: interFontFamily,
      height: 24 / 18,
      letterSpacing: -0.01,
    );
    final textSpan = TextSpan(text: selectedSign, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
