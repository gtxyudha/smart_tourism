import 'package:flutter/material.dart';
import 'package:smart_tourism/cubit/page_cubit.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBottomNavigation extends StatelessWidget {
  final int index;
  final String imageUrl;
  const ThemeBottomNavigation({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kabuColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kputihColor,
              borderRadius: BorderRadius.circular(defaultradius),
            ),
          )
        ],
      ),
    );
  }
}
