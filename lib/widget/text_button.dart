import 'package:flutter/material.dart';
import 'package:lipl_control/widget/widget.dart';

TextButton textButton<T>({
  required T item,
  required ButtonData<T> buttonData,
}) =>
    TextButton(
      onPressed: buttonData.enabled(item)
          ? () {
              buttonData.onPressed(item);
            }
          : null,
      child: Text(
        buttonData.label.toUpperCase(),
        style: const TextStyle(
          letterSpacing: 1.5,
        ),
      ),
    );
