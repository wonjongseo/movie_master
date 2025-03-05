import 'package:flutter/material.dart';
import 'package:movie_report_app/core/configs/theme/app_color.dart';

class SelectableOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableOption({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primary : null,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.secondBackground,
                  width: .5,
                ),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
