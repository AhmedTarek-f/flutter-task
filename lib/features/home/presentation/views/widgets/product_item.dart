import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/common_widgets/product_title_and_rating_row.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_task/core/common_widgets/product_image.dart';
import 'package:flutter_task/features/product_details/presentation/views/product_details_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productData});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 14,vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetailsView.routeName,arguments: productData);
        },
        borderRadius: BorderRadius.circular(8.r),
        highlightColor: AppColors.primary.withValues(alpha: 0.2),
        splashColor: AppColors.primary.withValues(alpha: 0.2),
        child: Container(
          padding: REdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.7),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 3
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.only(top: 16,bottom: 12),
                child: ProductImage(
                  image: productData.image,
                  height: 100.h,
                  width: ScreenUtil().screenWidth,
                ),
              ),
              ProductTitleAndRatingRow(productData: productData,),
              SizedBox(height: 4.h,),
              Text(
                "\$${productData.price}",
                style: AppFonts.fontSize16Bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}

