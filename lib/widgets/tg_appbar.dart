import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_previewer/web_utils/web_utils.dart';

const double kTgAppBarToolbarHeight = .3;

double get appbarHeight {
  if (isTelegramMiniApp) {
    return kTgAppBarToolbarHeight;
  }
  if (!kIsWeb) {
    return kToolbarHeight + .0000001;
  }
  return kToolbarHeight;
}

class TgAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TgAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.actionsPadding,
  });

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool? primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final EdgeInsets? actionsPadding;

  @override
  State<TgAppBar> createState() => _TgAppBarState();

  @override
  Size get preferredSize {
    if (isTelegramMiniApp) {
      return const Size.fromHeight(kTgAppBarToolbarHeight);
    }
    return const Size.fromHeight(kToolbarHeight);
  }
}

class _TgAppBarState extends State<TgAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _isScrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);

    if (scaffoldState != null && (scaffoldState.isDrawerOpen || scaffoldState.isEndDrawerOpen)) {
      return;
    }
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification && widget.notificationPredicate(notification)) {
      final bool oldScrolledUnder = _isScrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _isScrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _isScrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_isScrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isTelegramMiniApp) {
      final color = Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: .4);
      return Container(
        color: _isScrolledUnder ? color : Colors.transparent,
        // color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: .3),
        height: kTgAppBarToolbarHeight,
        width: double.infinity,
      );
    }
    return AppBar(
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
      bottom: widget.bottom,
      elevation: widget.elevation,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      notificationPredicate: widget.notificationPredicate,
      shadowColor: widget.shadowColor,
      actionsIconTheme: widget.actionsIconTheme,
      actionsPadding: widget.actionsPadding,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      clipBehavior: widget.clipBehavior,
      title: widget.title,
      leading: widget.leading,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: widget.titleSpacing,
      toolbarOpacity: widget.toolbarOpacity,
      bottomOpacity: widget.bottomOpacity,
    );
  }
}
