import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/switch_buttom_lang.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget reloadPage; // الصفحة اللي نعيد تحميلها بعد تغيير اللغة

  const CustomAppBar({
    super.key,
    required this.reloadPage,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isArabic = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isArabic = context.locale.languageCode == 'ar';
  }

  void _toggleLanguage(bool value) async {
    setState(() {
      isArabic = value;
    });

    final newLocale = isArabic ? const Locale('ar') : const Locale('en');
    await context.setLocale(newLocale);

    // إعادة تحميل الصفحة الحالية بدون أنيميشن
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => widget.reloadPage,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColores().background,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LanguageSwitch(
            isArabic: isArabic,
            onChanged: _toggleLanguage,
          ),
        ),
      ],
    );
  }
}
