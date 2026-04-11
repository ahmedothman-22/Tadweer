import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tadweer/core/helpers/shared_pref_helper.dart';
import 'package:tadweer/core/routing/routes.dart';
import 'package:tadweer/core/utils/shared_pref_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      final isSeen = SharedPrefHelper.getBool(
        key: SharedPrefKeys.kIsOnBoardingSeen,
      );

      final isRegistered = SharedPrefHelper.getBool(
        key: SharedPrefKeys.kIsRegistered,
      );
      if (isSeen == true && isRegistered != true) {
        GoRouter.of(context).pushReplacement(Routes.loginView);
      } else if (isRegistered == true) {
        GoRouter.of(context).pushReplacement(Routes.homeview);
      } else {
        GoRouter.of(context).pushReplacement(Routes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/to_do.json',
              width: 250.w,
              height: 250.h,
            ),
          ],
        ),
      ),
    );
  }
}
