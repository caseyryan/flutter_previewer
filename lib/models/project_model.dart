import 'package:flutter/widgets.dart';
import 'package:flutter_previewer/models/price.dart';

enum ProjectType {
  ecommerce(title: 'E-Commerce'),
  banking(title: 'Banking'),
  shopper(title: 'Shopper'),
  travel(title: 'Travel'),
  health(title: 'Health'),
  wallet(title: 'Wallet'),
  carwash(title: 'Carwash'),
  foodDelivery(title: 'Food Delivery');

  final String title;

  const ProjectType({required this.title});
}

class ProjectModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String numScreens;
  final List<ProjectType> types;
  final WidgetBuilder builder;
  final List<Price> prices;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.builder,
    required this.numScreens,
    required this.types,
    this.prices = const [],

  });
}