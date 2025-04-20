import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_task/core/common_widgets/product_image.dart';
import 'package:flutter_task/features/product_details/presentation/views/widgets/product_item_details.dart';
import 'package:flutter_task/features/product_details/presentation/views/widgets/product_price_footer.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel productData = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return  Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(
                  image: productData.image,
                  height: 220.h,
                  width: ScreenUtil().screenWidth,
                ),
                SizedBox(height: 32.h,),
                ProductItemDetails(productData: productData),
              ],
            ),
          ),
        ),
        ProductPriceFooter(price: productData.price,),
      ],
    );
  }
}