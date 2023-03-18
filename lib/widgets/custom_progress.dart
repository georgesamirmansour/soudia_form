
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/app_colors.dart';

class CustomProgress extends StatefulWidget {
  final double size;
  final Color color;

  const CustomProgress({super.key, this.size = 30, this.color = accentColor});

  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: widget.color,
      size: widget.size,
    );
  }
}
