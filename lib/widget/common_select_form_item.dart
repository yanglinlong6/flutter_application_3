import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/common_picker/index.dart';
import 'package:flutter_application_3/widget/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final Function(int) onChange;

  const CommonSelectFormItem(
      {Key? key,
      required this.label,
      required this.value,
      required this.options,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
        label: label,
        contentBuilder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              var result = CommonPicker.showPicker(
                context: context,
                options: options,
                value: value,
              );
              result.then((selectedValue) {
                if (value != selectedValue && selectedValue != null) {
                  onChange(selectedValue);
                }
              });
            },
            child: SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    options[value],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          );
        });
  }
}
