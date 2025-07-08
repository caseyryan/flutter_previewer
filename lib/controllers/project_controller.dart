import 'package:flutter/rendering.dart';
import 'package:flutter_previewer/models/project_model.dart';
import 'package:flutter_previewer/projects/ecommerce/ecommerce_page.dart';
import 'package:lite_state/lite_state.dart';

ProjectController get projectController {
  return findController<ProjectController>();
}

class ProjectController extends LiteStateController<ProjectController> {
  final List<ProjectModel> _projectModels = [
    ProjectModel(
      id: 1,
      name: 'Shopper\'s Paradise',
      description:
          'A Full fledged UI set for e-commerce application. Contains all the necessary screens for building a service for an online shopping',
      image: 'ecommerce_splash',
      numScreens: '100+',
      types: [
        ProjectType.ecommerce,
      ],
      builder: (context) {
        return EcommercePage();
      },
    ),
    ProjectModel(
      id: 2,
      name: 'Shopper\'s Paradise',
      description:
          'A Full fledged UI set for e-commerce application. Contains all the necessary screens for building a service for an online shopping',
      image: 'ecommerce_splash',
      numScreens: '100+',
      types: [
        ProjectType.ecommerce,
      ],
      builder: (context) {
        return EcommercePage();
      },
    ),
    ProjectModel(
      id: 3,
      name: 'Shopper\'s Paradise',
      description:
          'A Full fledged UI set for e-commerce application. Contains all the necessary screens for building a service for an online shopping',
      image: 'ecommerce_splash',
      numScreens: '100+',
      types: [
        ProjectType.ecommerce,
      ],
      builder: (context) {
        return EcommercePage();
      },
    ),
  ];

  bool _isToolbarVisible = true;
  bool get isToolbarVisible => _isToolbarVisible;

  Size? _cardSize;
  void setCardSize(Size value) {
    if (_cardSize == null || value.width > _cardSize!.width || value.height > _cardSize!.height) {
      _cardSize = value;
      rebuild();
    }
  }

  double get cardAspectRatio {
    if (_cardSize == null) {
      return 3.0 / 4.0;
    }
    return _cardSize!.width / _cardSize!.height;
  }

  void showToolbar() {
    _isToolbarVisible = true;
    rebuild('mainBuilder');
  }

  void hideToolbar() {
    _isToolbarVisible = false;
    rebuild('mainBuilder');
  }

  bool _isFrameEnabled = false;
  bool get isFrameEnabled => _isFrameEnabled;

  void setFrameEnabled(bool value) {
    _isFrameEnabled = value;
    debugPrint('SET FRAME ENABLED: $value');
  }

  List<ProjectModel> get projectModels => _projectModels;

  ProjectModel? _selectedProject;
  ProjectModel? get selectedProject => _selectedProject;

  bool get hasSelectedProject {
    return _selectedProject != null;
  }

  void selectProject(ProjectModel? model) {
    _selectedProject = model;
    rebuild('mainBuilder');
  }

  @override
  void reset() {}
  @override
  void onLocalStorageInitialized() {}
}
