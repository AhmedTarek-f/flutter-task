import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';

class ProductTitleAndRatingRow extends StatelessWidget {
  const ProductTitleAndRatingRow({super.key, required this.productData, this.titleStyle, this.ratingStyle, this.starIconSize, this.maxLines});
  final ProductModel productData;
  final TextStyle? titleStyle;
  final TextStyle? ratingStyle;
  final double? starIconSize;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              productData.title,
              overflow: TextOverflow.ellipsis,
              style: titleStyle ?? AppFonts.fontSize14Medium,
              maxLines: maxLines,
            )
        ),
        Row(
          children: [
            Icon(Icons.star,color: AppColors.gold,size: starIconSize?? 22.r,),
            Text(
              productData.rating.rate.toString(),
              style: ratingStyle ?? AppFonts.fontSize14Medium.copyWith(color: AppColors.gray),
            ),
          ],
        )
      ],
    );
  }
}