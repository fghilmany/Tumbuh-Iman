import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/indicators/shimmer_loading.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(AppDimensions.paddingM),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.spaceM),
          child: Row(
            children: [
              ShimmerCircle(size: AppDimensions.iconXL),
              SizedBox(width: AppDimensions.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerLine(width: double.infinity, height: 16),
                    SizedBox(height: AppDimensions.spaceS),
                    ShimmerLine(width: 150, height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}