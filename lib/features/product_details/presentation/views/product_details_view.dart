import 'package:flutter/material.dart';
import 'package:flutter_task/features/product_details/presentation/views/widgets/product_details_app_bar.dart';
import 'package:flutter_task/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = "ProductDetailsView";
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductDetailsAppBar(),
      body: ProductDetailsViewBody(),
    );
  }
}