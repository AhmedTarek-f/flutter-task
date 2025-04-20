import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/product_details/presentation/views/widgets/add_to_cart_button.dart';

class ProductPriceFooter extends StatelessWidget {
  const ProductPriceFooter({super.key, required this.price});
  final num price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 90.h,
      padding: REdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.7),
                blurStyle: BlurStyle.outer,
                blurRadius: 3
            )
          ]
      ),
      child: Row(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth*0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    "Total Price",
                    style: AppFonts.fontSize16SemiBold.copyWith(color: AppColors.gray),
                  ),
                ),
                const RSizedBox(height: 4,),
                FittedBox(
                    child: Text(
                      "\$${price.toString()}",
                      style: AppFonts.fontSize18Bold,
                    )),
              ],
            ),
          ),
          SizedBox(width: ScreenUtil().screenWidth*0.05,),
          const AddToCartButton()
        ],
      ),
    );
  }
}