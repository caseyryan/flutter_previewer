import 'package:flutter/material.dart';
import 'package:ecommerce_001/exports.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  @override
  void initState() {
    initControllers({
      ConfigController: () => ConfigController(
        configType: ConfigType.dev,
      ),
      ThemeController: () => ThemeController(),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LiteState<ConfigController>(
      builder: (BuildContext c, ConfigController configController) {
        return LiteState<ThemeController>(
          builder: (BuildContext c, ThemeController themeController) {
            return MaterialApp.router(
              scrollBehavior: const AnyDragBehavior(
                useClampingScrollPhysics: false,
              ),
              routerConfig: goRouter,
              title: 'eCommerce App',
              debugShowCheckedModeBanner: false,
              showPerformanceOverlay: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeController.themeMode,
              builder: (BuildContext context, Widget? widget) {
                return widget ?? const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}
