import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/controllers/project_controller.dart';
import 'package:flutter_previewer/extensions/string_extensions.dart';
import 'package:flutter_previewer/localization/translator_builder.dart';
import 'package:flutter_previewer/models/project_model.dart';
import 'package:flutter_previewer/project_selection_view/type_chip.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_color_theme.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_text_theme.dart';
import 'package:flutter_previewer/web_utils/web_utils.dart';
import 'package:flutter_previewer/widgets/card_base.dart';
import 'package:flutter_previewer/widgets/custom_button.dart';
import 'package:flutter_previewer/widgets/custom_pale_button.dart';
import 'package:flutter_previewer/widgets/description.dart';
import 'package:flutter_previewer/widgets/header.dart';
import 'package:flutter_previewer/widgets/resize_detector.dart';
import 'package:flutter_previewer/widgets/separator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.model,
    required this.onPressed,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
  });

  final ProjectModel model;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final ValueChanged<ProjectModel>? onPressed;

  Future openInTelegram() async {
    final chatUrl = 'https://t.me/serov_dev_bot';
    final url = '$chatUrl?project-id=${model.id}';
    if (isTelegramMiniApp) {
      WebUtils.openTelegramUrl(url);
    } else {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ResizeDetector(
        onSizeUpdate: (value) {
          projectController.setCardSize(value);
        },
        child: CardBase(
          paddingBottom: paddingBottom,
          paddingLeft: paddingLeft,
          paddingRight: paddingRight,
          paddingTop: paddingTop,
          marginTop: 0.0,
          marginLeft: 0.0,
          marginBottom: 0.0,
          marginRight: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 736.0 / 503.0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const SmoothBorderRadius.only(
                      topLeft: SmoothRadius(
                        cornerRadius: 16.0,
                        cornerSmoothing: 1.0,
                      ),
                      topRight: SmoothRadius(
                        cornerRadius: 16.0,
                        cornerSmoothing: 1.0,
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        model.image.toJpgPath(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      paddingTop: 0.0,
                      text: model.name,
                      isBigHeader: true,
                      paddingBottom: kBigPadding,
                    ),
                    Description(
                      text: model.description,
                    ),
                    const Separator(
                      paddingTop: kPadding,
                      paddingBottom: kPadding,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Description(
                            text: 'Number of screens:'.translate(),
                          ),
                        ),
                        Description(
                          text: model.numScreens,
                          style: CustomTextTheme.of(context).descriptionStyle
                              .copyWith(
                                color: CustomColorTheme.of(context).normalTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kSmallPadding,
                    ),
                    Wrap(
                      children: [
                        for (final type in model.types)
                          TypeChip(
                            type: type,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 60,
                          child: CustomPaleButton(
                            width: double.infinity,
                            paddingTop: kPadding,
                            onPressed: () {
                              onPressed?.call(model);
                            },
                            text: 'See Demo'.translate(),
                          ),
                        ),
                        const SizedBox(
                          width: kPadding,
                        ),
                        Expanded(
                          flex: 40,
                          child: CustomButton(
                            width: double.infinity,
                            paddingTop: kPadding,
                            onPressed: () {
                              debugPrint('OPEN IN TELEGRAM');
                              openInTelegram();
                            },
                            text: 'Buy'.translate(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
