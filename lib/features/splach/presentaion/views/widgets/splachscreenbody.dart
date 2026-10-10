import 'package:bookly_app/features/Home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/splach/presentaion/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplachScreenBody extends StatefulWidget {
  const SplachScreenBody({super.key});

  @override
  State<SplachScreenBody> createState() => _SplachScreenBodyState();
}

class _SplachScreenBodyState extends State<SplachScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();

       initSlidingAnimation();

       navigateToHome();
  }


  

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          slidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

void initSlidingAnimation() {
    animationController = AnimationController(
     vsync: this,
     duration: const Duration(seconds: 1),
          );
        slidingAnimation = Tween<Offset>(
          begin: const Offset(0, 5),
          end: const Offset(0, 0),
        ).animate(animationController);
    
        animationController.forward();
  }
  void navigateToHome() {
    Future.delayed( const Duration(seconds: 2), () {
     Get.to(() => const HomeView(),
     transition: Transition.rightToLeftWithFade,
     );
     
      }
    );
  }

}
