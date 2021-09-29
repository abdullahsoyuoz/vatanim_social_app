import 'dart:async';

import 'package:flutter/material.dart';

class GhostLike extends StatefulWidget {
  Widget child;
  bool isLiked;
  double width;
  Widget likeWidget;
  IconData iconData;
  Color iconColor;
  double iconScale;
  Function onTap;
  Function onDoubleTap;
  Curve curve;
  Duration startDuration;
  Duration endDuration;
  GhostLike({
    @required this.child,
    @required this.isLiked,
    @required this.width,
    this.likeWidget,
    this.iconData,
    this.onTap,
    this.onDoubleTap,
    this.iconScale = 0.5,
    this.iconColor = Colors.redAccent,
    this.curve = Curves.linear,
    this.startDuration = const Duration(milliseconds: 200),
    this.endDuration = const Duration(milliseconds: 50),
  })  : assert(iconScale > 0 && iconScale <= 1),
        assert(iconData == null || likeWidget == null);
  @override
  _GhostLikeState createState() => _GhostLikeState();
}

class _GhostLikeState extends State<GhostLike> {
  @override
  Widget build(BuildContext context) {
    Stream.value(widget.isLiked).listen((event) {
      if (widget.isLiked) {
        Future.delayed(
            Duration(milliseconds: widget.startDuration.inMilliseconds), () {
          widget.isLiked = !widget.isLiked;
          setState(() {});
        });
      }
    });

    return InkWell(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget.child,
            Center(
              child: Transform.scale(
                scale: widget.isLiked ? 1 : 0.5,
                child: AnimatedOpacity(
                  opacity: widget.isLiked ? 1 : 0,
                  duration: widget.isLiked
                      ? widget.startDuration
                      : widget.endDuration,
                  curve: widget.curve,
                  child: widget.iconData != null
                      ? Icon(
                          widget.iconData,
                          size: widget.width * widget.iconScale,
                          color: widget.iconColor,
                        )
                      : widget.likeWidget != null
                          ? widget.likeWidget
                          : SizedBox(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
