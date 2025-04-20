import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static String routeName = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
