import 'package:flutter/material.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';

class CustomScaffoldBg extends StatelessWidget {
  const CustomScaffoldBg({super.key, this.body, this.appBar});
  final Widget? body;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [DarkAppColors.primary800, colorScheme.background],
          stops: const [0.3, 0.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
