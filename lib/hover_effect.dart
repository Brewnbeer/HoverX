library HoverX;

import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final ImageProvider image;
  final Color hoverColor;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  const HoverEffect({
    Key key,
    @required this.title,
    this.titleStyle,
    @required this.image,
    @required this.hoverColor,
    this.height = 370,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  _HoverEffectState createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (f) {
        setState(() {
          isVisible = true;
        });
      },
      onExit: (f) {
        setState(() {
          isVisible = false;
        });
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.hoverColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
          image: DecorationImage(
            image: widget.image,
          ),
        ),
        child: Visibility(
          visible: isVisible,
          child: Container(
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height,
            color: Colors.white70,
            child: Center(
              child: Text(
                widget.title,
                style:
                    widget.titleStyle ?? Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
