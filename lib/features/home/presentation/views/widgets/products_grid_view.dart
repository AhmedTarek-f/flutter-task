import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView ({super.key, required this.productsList});
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: REdgeInsets.symmetric(vertical: 4),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          childAspectRatio: 1/1.05
      ),
      itemBuilder: (context, index) => ProductItem(productData: productsList[index],),
      itemCount: productsList.length,
    );
  }
}