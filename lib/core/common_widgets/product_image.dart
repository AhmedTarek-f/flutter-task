import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_images.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.image, this.width, this.height});
  final String? image;
  final double? width,height;
  @override
  Widget build(BuildContext context) {
    return image!= null?
    CachedNetworkImage(
      imageUrl: image!,
      fit: BoxFit.contain,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
          color: AppColors.primary,
        ),
      ),
    ):
    Image.asset(
      AppImages.imageNotAvailable,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}