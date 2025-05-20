import 'package:flutter/cupertino.dart';

extension OnWidgetStateProp<T> on T {
  WidgetStateProperty<T> get widgetState {
    return WidgetStateProperty.resolveWith((states) => this);
  }
}
