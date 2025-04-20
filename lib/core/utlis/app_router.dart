import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/views/home_view.dart';
import 'package:flutter_task/features/product_details/presentation/views/product_details_view.dart';

abstract class AppRouter{
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeView.routeName: (_) => const HomeView(),
    ProductDetailsView.routeName: (_) => const ProductDetailsView()
  };
}