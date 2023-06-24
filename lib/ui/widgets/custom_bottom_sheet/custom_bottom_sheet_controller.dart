import 'package:flutter/material.dart';

class CustomBottomSheetController extends ChangeNotifier {
  TickerProvider vsync;
  final AnimationController _animationController;

  StatusAnimation animation = StatusAnimation.close;

  CustomBottomSheetController(this.vsync) : _animationController = AnimationController(vsync: vsync) {
    _animationController.duration = const Duration(milliseconds: 500);
    _animationController.addListener(() {
      notifyListeners();
    });
    _animationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.forward:
          animation = StatusAnimation.isOpen;
          break;
        case AnimationStatus.reverse:
          animation = StatusAnimation.isClose;
          break;
        case AnimationStatus.completed:
          animation = StatusAnimation.open;
          break;
        case AnimationStatus.dismissed:
          animation = StatusAnimation.close;
          break;
        default:
          animation = StatusAnimation.close;
          return;
      }
      notifyListeners();
    });
  }

  get value => _animationController.value;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void open() {
    _animationController.forward();
  }

  void close() {
    _animationController.reverse();
  }

  void toggle() {
    if (animation == StatusAnimation.close) {
      open();
    } else {
      close();
    }
  }
}

enum StatusAnimation { isOpen, isClose, open, close }
