import 'package:lipl_control/widget/widget.dart';

class ButtonData<T> {
  ButtonData({
    required this.label,
    required this.onPressed,
    required this.showOnMobile,
    bool Function(T)? enabled,
  }) {
    if (enabled != null) {
      this.enabled = enabled;
    }
  }
  final String label;
  final bool showOnMobile;
  final OnPressed<T> onPressed;
  bool Function(T) enabled = (T f) => true;
}
