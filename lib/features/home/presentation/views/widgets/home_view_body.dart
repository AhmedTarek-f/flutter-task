import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const HomeSliverAppBar(),
        ],
        body: const ProductsGridView()
    );
  }
}