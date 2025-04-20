import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: const SafeArea(
            child: HomeViewBody()
        ),
      ),
    );
  }
}
