import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_images.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
            ),
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  const AssetImage(AppImages.shoppingBag),
                  color: AppColors.white,
                  size: 30.r,
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Add To Cart",
                      style:AppFonts.fontSize18SemiBold.copyWith(color: AppColors.white)
                      ,)
                    ,),
                ),
              ],
            )
        ),
      ),
    );
  }
}