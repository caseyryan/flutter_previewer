import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/controllers/project_controller.dart';
import 'package:flutter_previewer/localization/translator_builder.dart';
import 'package:flutter_previewer/widgets/header.dart';
import 'package:lite_state/lite_state.dart';

import 'project_card.dart';

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
    return LiteState<ProjectController>(
      builderName: 'projectSelectionViewBuilder',
      builder: (BuildContext c, ProjectController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            scrolledUnderElevation: 2.0,
            title: Header(
              text: 'PROJECTS'.translate(),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  controller.projectModels.map(
                    (e) {
                      return ProjectCard(
                        model: e,
                        paddingTop: kPadding,
                        paddingLeft: kPadding,
                        paddingRight: kPadding,
                        onPressed: controller.selectProject
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
