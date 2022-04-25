import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';

class Delaycard extends StatelessWidget {
  Widget _child;
  DelayedAnimations animation;
  Delaycard(this._child, this.animation);

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
        delayDuration: Duration(milliseconds: 200), // Not required
        animationDuration: Duration(seconds: 1), // Not required
        animation: animation, // Not required
        child: _child);
  }
}
