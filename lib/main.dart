import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/controllers/project_controller.dart';
import 'package:flutter_previewer/localization/translator_builder.dart';
import 'package:flutter_previewer/project_selection_view/back_to_project_section.dart';
import 'package:flutter_previewer/project_selection_view/project_selection_view.dart';
import 'package:flutter_previewer/themes/themes.dart';
import 'package:lite_state/lite_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    initControllers({ProjectController: () => ProjectController()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LiteState<ProjectController>(
      builderName: 'mainBuilder',
      builder: (BuildContext c, ProjectController controller) {
        if (!controller.hasSelectedProject) {
          return MaterialApp(
            debugShowCheckedModeBanner: true,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: ProjectSelectionView(),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: DevicePreview(
                enabled: true,
                isToolbarVisible: controller.isToolbarVisible,
                backgroundColor: Colors.white,
                tools: [
                  BackToProjectList(
                    onPressed: () {
                      controller.selectProject(null);
                    },
                  ),
                  ...DevicePreview.defaultTools,
                ],
                builder: (context) {
                  final store = context.read<DevicePreviewStore>();
                  try {
                    final isEnabled = store.data.isEnabled;
                    controller.setFrameEnabled(isEnabled);
                    // debugPrint('isEnabled: $isEnabled');
                  } catch (_) {}
                  return MaterialApp(
                    // ignore: deprecated_member_use
                    useInheritedMediaQuery: true,
                    debugShowCheckedModeBanner: true,
                    locale: DevicePreview.locale(context),
                    builder: DevicePreview.appBuilder,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    home: controller.selectedProject!.builder(context),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
