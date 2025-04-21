import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView ({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is ChangeSearchFieldValueState,
      builder: (context, state) => GridView.builder(
        padding: REdgeInsets.symmetric(vertical: 4),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1/1.05
        ),
        itemBuilder: (context, index) => ProductItem(productData: controller.searchProductsList[index],),
        itemCount: controller.searchProductsList.length,
      ),
    );
  }
}