import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // للتحكم في شفافية الصورة

  @override
  void initState() {
    super.initState();

    // بعد أول فريم، نشغل الأنميشن ونبدأ العد التنازلي
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignInScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                "assets/ToDoApp_SplashSecreen.svg",
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const Spacer(),
            const Text(
              "Developed by Ahmed Elgendy",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
