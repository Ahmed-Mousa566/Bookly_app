import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 40.0),
      child: CustomAppBar(),
    )]);
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AssetsData.logo,
        height: 18,
        ),

         IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }
}
