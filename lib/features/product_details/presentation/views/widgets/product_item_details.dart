import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/common_widgets/product_title_and_rating_row.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';

class ProductItemDetails extends StatelessWidget {
  const ProductItemDetails({
    super.key,
    required this.productData,
  });

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTitleAndRatingRow(
            productData: productData,
            titleStyle: AppFonts.fontSize18Bold,
            maxLines: 3,
            ratingStyle: AppFonts.fontSize18Medium.copyWith(color: AppColors.gray),
            starIconSize: 26.r,
          ),
          SizedBox(height: 18.h,),
          Text(
            "Product Details",
            style: AppFonts.fontSize18SemiBold,
          ),
          SizedBox(height: 8.h,),
          Text(
            productData.description,
            style: AppFonts.fontSize16Medium.copyWith(color: AppColors.black.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}