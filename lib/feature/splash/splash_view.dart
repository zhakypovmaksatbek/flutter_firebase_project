import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/feature/home/home_view.dart';
import 'package:flutter_firebase_project/feature/splash/splash_providor.dart';
import 'package:flutter_firebase_project/product/constants/index.dart';
import 'package:flutter_firebase_project/product/enums/image_constants.dart';
import 'package:flutter_firebase_project/product/widgets/text/wavy_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider =
      StateNotifierProvider<SplashProvidor, SplashState>((ref) {
    return SplashProvidor();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).chekApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.navigateToPage(const HomeView());
        } else {
          //false
        }
      }
    });
    return Scaffold(
      backgroundColor: ColorConstants.purpleDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: IconConstants.appIcon.toImage,
            ),
            const WavyBoldText(title: StringConstants.appName)
          ],
        ),
      ),
    );
  }
}
