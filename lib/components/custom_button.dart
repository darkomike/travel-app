import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformWidgetFactory {
  Widget createWidget();
}

class IOSWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return CupertinoButton(child: const Text("IOS Button"), onPressed: () {});
  }
}
class AndroidWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return ElevatedButton(child: const Text("Andriod Button"), onPressed: () {});
  }
}
class WebWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return TextButton(child: const Text("Web Button"), onPressed: () {});
  }
}
