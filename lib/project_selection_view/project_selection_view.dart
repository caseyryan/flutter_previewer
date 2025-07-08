import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/controllers/project_controller.dart';
import 'package:flutter_previewer/localization/translator_builder.dart';
import 'package:flutter_previewer/widgets/header.dart';
import 'package:flutter_previewer/widgets/tg_appbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lite_state/lite_state.dart';

import 'project_card.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProjectSelectionView extends StatefulWidget {
  const ProjectSelectionView({
    super.key,
  });

  @override
  State<ProjectSelectionView> createState() => _ProjectSelectionViewState();
}

class _ProjectSelectionViewState extends State<ProjectSelectionView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const maxWidth = 800.0;
    final width = min(maxWidth, size.width);

    return LiteState<ProjectController>(
      builderName: 'projectSelectionViewBuilder',
      builder: (BuildContext c, ProjectController controller) {
        final childCount = width < 800.0 ? 1 : 2;
        controller.updateNumColumns(childCount);
        return Scaffold(
          appBar: TgAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            scrolledUnderElevation: 2.0,
            centerTitle: true,
            title: Header(
              text: 'PROJECTS'.translate(),
            ),
          ),
          body: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width,
                ),
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: childCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      WovenGridTile(projectController.cardAspectRatio),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final model = projectController.projectModels[index];
                      return ProjectCard(
                        key: ValueKey(model),
                        model: model,
                        paddingBottom: kPadding,
                        paddingLeft: kPadding,
                        paddingRight: kPadding,
                        onPressed: projectController.selectProject,
                      );
                    },
                    childCount: projectController.projectModels.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
