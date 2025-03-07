import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ColTextAndWidget extends StatelessWidget {
  const ColTextAndWidget({
    Key? key,
    required this.label,
    // this.onTapIcon,
    this.labelWidget,
    this.labelStyle,
    required this.widget,
    this.vertical,
  }) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  // final Function()? onTapIcon;
  final Widget? labelWidget;
  final Widget widget;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Get.isDarkMode ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: labelStyle),
                if (labelWidget != null) labelWidget!
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: widget,
          ),
        ],
      ),
    );
  }
}
