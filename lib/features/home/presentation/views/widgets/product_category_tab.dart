import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';

class ProductCategoryTab extends StatelessWidget {
  const ProductCategoryTab({super.key, required this.categoryName,this.isSelected = false});
  final String categoryName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Container(
        padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
            color: isSelected? AppColors.primary: AppColors.white,
            borderRadius: BorderRadius.circular(32.r),
            border: isSelected? null :Border.all(color: AppColors.gray)
        ),
        child: Text(
          categoryName,
          style: AppFonts.fontSize16SemiBold.copyWith(color: isSelected?AppColors.white:AppColors.black),
        ),
      ),
    );
  }
}