import 'package:flutter/material.dart';
import 'package:lipl_control/widget/widget.dart';

SingleChildScrollView expansionPanelList<T>({
  Key? key,
  required List<T> items,
  required Callback<T, String> selectId,
  required Callback<T, Widget> selectTitle,
  required Callback<T, Widget> selectSummary,
  required List<ButtonData<T>> buttons,
}) =>
    SingleChildScrollView(
      primary: false,
      child: ExpansionPanelList.radio(
        children: items
            .map(
              (T item) => ExpansionPanelRadio(
                canTapOnHeader: true,
                value: selectId(item),
                headerBuilder: (_, __) => selectTitle(item),
                body: Column(
                  children: <Widget>[
                    selectSummary(item),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ...buttons.map(
                          (ButtonData<T> buttonData) => textButton<T>(
                            item: item,
                            buttonData: buttonData,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
