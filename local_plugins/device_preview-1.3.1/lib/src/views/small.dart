import 'package:device_preview/device_preview.dart';
import 'package:device_preview/src/localization/translator_builder.dart';
import 'package:device_preview/src/state/store.dart';
import 'package:device_preview/src/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tool_panel/tool_panel.dart';

/// The tool layout when the screen is small.
class DevicePreviewSmallLayout extends StatelessWidget {
  /// Create a new panel from the given tools grouped as [slivers].
  const DevicePreviewSmallLayout({
    super.key,
    required this.maxMenuHeight,
    required this.scaffoldKey,
    required this.onMenuVisibleChanged,
    required this.slivers,
  });

  /// The maximum modal menu height.
  final double maxMenuHeight;

  /// The key of the [Scaffold] that must be used to show the modal menu.
  final GlobalKey<ScaffoldState> scaffoldKey;

  /// Invoked each time the menu is shown or hidden.
  final ValueChanged<bool> onMenuVisibleChanged;

  /// The sections containing the tools.
  ///
  /// They must be [Sliver]s.
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    final toolbarTheme = context.select(
      (DevicePreviewStore store) => store.settings.toolbarTheme,
    );
    return Theme(
      data: toolbarTheme.asThemeData(),
      child: SafeArea(
        top: false,
        child: _BottomToolbar(
          showPanel: () async {
            onMenuVisibleChanged(true);
            final sheet = scaffoldKey.currentState?.showBottomSheet(
              (context) => ToolPanel(
                isModal: true,
                slivers: slivers,
              ),
              constraints: BoxConstraints(
                maxHeight: maxMenuHeight,
              ),
              backgroundColor: Colors.transparent,
            );
            await sheet?.closed;
            onMenuVisibleChanged(false);
          },
        ),
      ),
    );
  }
}

class _BottomToolbar extends StatelessWidget {
  const _BottomToolbar({
    required this.showPanel,
  });

  final VoidCallback showPanel;

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.select(
      (DevicePreviewStore store) => store.data.isEnabled,
    );
    return Material(
      child: ListTile(
        title: isEnabled
            ? Text('Открыть Меню'.translate())
            : Text('Включить Рамку'.translate()),
        onTap: isEnabled
            ? showPanel
            : () {
                final state = context.read<DevicePreviewStore>();
                state.data = state.data.copyWith(
                  isEnabled: true,
                );
              },
        // onTap: showPanel,
        leading: isEnabled
            ? const Icon(Icons.tune)
            : const Icon(Icons.phone_android),
        trailing: Switch(
          value: isEnabled,
          onChanged: (v) {
            final state = context.read<DevicePreviewStore>();
            state.data = state.data.copyWith(
              isEnabled: v,
            );
          },
        ),
      ),
    );
  }
}
